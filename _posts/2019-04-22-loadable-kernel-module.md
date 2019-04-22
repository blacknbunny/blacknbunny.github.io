---
title: Loadable Kernel Module Development
layout: post
---

# Loadable Kernel Module (LKM)

Merhaba arkadaşlar. **Loadable Kernel Module (LKM)** yazıma hoşgeldiniz.

Bu yazımda sizlere **Yüklenebilir Çekirdek Modülünün** yani **LKM**'nin geliştirilmesinden bahsedeceğim. Dürüst olursam benim bu, önceki ve ilerideki gelecek yazılarımdan bahsetmiş ve bahsedecek olma sebebim rootkit geliştirebilesiniz diye ama insanlık adına kullanacağım diyen olursa oda kabulumdur. 

**LKM** rootkit geliştirilmesinin en basit yoludur ayrıca bu karşısında basitçe savunma kurabileceğiniz bir yoldur. İşletim sisteminde bir kere root alındıktan sonra rootkit bu yetkiyi kontrol etmenin en iyi yoludur. Bunuda ek bilgi olarak verdiğime göre artık yazımıza geçip **LKM**'nin nasıl yazıldığından bahsedelim.

**LKM**'yi **kernel** yani **çekirdek** için bir eklenti olarak düşünebiliriz ayrıca **LKM** size bulunduğunuz yetkiler ile **kernel** içerisinde kod çalıştırmanızı sağlar. **LKM** az çok kafanızda bunun ne olduğu canlandıysa devam edelim.

# İlk Yüklenebilir Çekirdek Modülümüz
Bu modülü yazmadan önce bize kütüphanelerimiz gerek her programda olduğu gibi :

```
#include <linux/module.h>
#include <linux/init.h>
```

Bu kısımdan sonra bu modül hakkında bilgileri verdiğimiz kısım geliyor :

```
MODULE_AUTHOR("blacknbunny");
MODULE_DESCRIPTION("Basit Merhaba Dunya Modulu");
MODULE_LICENSE("GPL");
```

Modülü kimin yazdığı, modül hakkında açıklama ve lisans yer alıyor bu kısımda.

Bu kısmıda anladığımıza göre biraz daha teknik bölüm olan yükleme kısmına gelelim :

```
static int __init merhaba_init(void)
{
  printk("Merhaba Dünya!\n");
  return 0;
}
```
Bu kısımda modülümüz kernel'e yüklendikten sonra çalışma aşamasında ne yapacağını belirliyor.

Fonksiyon tipimizi ve return tipini belirledikten sonra burada karşımıza çıkan farklı bir fonksiyon var oda **printk** fonksiyonu.

Bu fonksiyon adındanda anlaşılabileceği gibi kernel içerisinde yazdırma yapan bir fonksiyon bu. Daha da detaylı incelemek istiyorum diyen varsa aranızda buyurun [Wikipedia printk](https://en.wikipedia.org/wiki/Printk).

Kernel içerisinde modülümüz aracılığı ile "Merhaba Dünya" yazdırdık fakat her girişin bir çıkışıda vardır **I/O** mantığı gibi düşünün. Günün sonunda bunu nasıl kernel içerisine install edeceğimizi göreceğin **insmod** komutu ile yalnız bunu birde kernelin içinden çıkarmak var bunuda **rmmod** ile yapabiliyoruz.

Rootkitimizi karşıdaki sisteme yükleyip uçup kaçtıktan sonra bu rootkit modülünü sistemden çıkartmamız gerekebilir. O zamanda rootkit içerisinde bir çıkış fonksiyonunun bulunması gerekebilir tabi bu basit bir **LKM** olduğundan detaya girmiyorum.

```
static void __exit merhaba_exit(void)
{
  printk("Hello world kernelden cikartiliyor.\n");
  return;
}
```

Bu şekilde de modülümüzü kernel içerisinden **Unload** edebiliyoruz. Şimdi geldi son kodumuza tüm bu **__init** ve **__exit** fonksiyonlarını modül içine yüklemeye :

```
module_init(merhaba_init);
module_exit(merhaba_exit);
```

Ve **module_init** ile yüklenmenin **module_exit** ilede çıkarılmanın gerçekleştiğini görebiliyoruz.

Şimdi geriye kalan tüm bu kodu birleştirip bir adet **Makefile** dosyası oluşturup **make** komutu ile derlemek.

Alttaki **LKM**'yi **merhaba.c** olarak kaydettiğinizi varsayıyorum.

```
#include <linux/module.h>
#include <linux/init.h>

MODULE_AUTHOR("blacknbunny");
MODULE_DESCRIPTION("Basit Merhaba Dunya Modulu");
MODULE_LICENSE("GPL");

static int __init merhaba_init(void)
{
  printk("Merhaba Dünya!\n");
  return 0;
}

static void __exit merhaba_exit(void)
{
  printk("Hello world kernelden cikartiliyor.\n");
  return;
}

module_init(merhaba_init);
module_exit(merhaba_exit);
```

# Make ile LKM derlenmesi
Bu modülü derlemek içinde komut satırımızdan yada bir pad ile **Makefile** adında bir dosya oluşturup içine eklememiz lazım.

```
obj-m += merhaba.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
```

Derlemeyi gerçekleştirmek için alttaki komut satırında gerçekleştirdiğim komutları kullanabilirsiniz.

```
remnux@remnux:~/heyhey$ ls
Makefile  merhaba.c
remnux@remnux:~/heyhey$ make
make -C /lib/modules/3.13.0-53-generic/build M=/home/remnux/heyhey modules
make[1]: Entering directory `/usr/src/linux-headers-3.13.0-53-generic'
  CC [M]  /home/remnux/heyhey/merhaba.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /home/remnux/heyhey/merhaba.mod.o
  LD [M]  /home/remnux/heyhey/merhaba.ko
make[1]: Leaving directory `/usr/src/linux-headers-3.13.0-53-generic'
```

**make** komutu sonrasında tekrar **ls** komutunu çalıştırdığımızda klasörümüzdeki dosya sayısının arttığını görebiliriz : 

```
remnux@remnux:~/heyhey$ ls
Makefile   merhaba.ko     merhaba.mod.o  modules.order
merhaba.c  merhaba.mod.c  merhaba.o      Module.symvers
remnux@remnux:~/heyhey$
```

Bu dosyaların arasından bizim modülümüz **merhaba.ko**. Bu modülü kernel içerisine **load** edebilmemiz yani yükleyebilmemiz için başta da bahsettiğimiz **insmod** komutunu kullanmamız gerekli.

```
remnux@remnux:~/heyhey$ insmod ./merhaba.ko
insmod: ERROR: could not insert module ./merhaba.ko: Operation not permitted
remnux@remnux:~/heyhey$ sudo insmod ./merhaba.ko
remnux@remnux:~/heyhey$ dmesg | tail -n 1
[ 6350.260783] Merhaba D\xffffffc3\xffffffbc\xffffffbcnya!
remnux@remnux:~/heyhey$ 
```

**insmod** ile bunu kernele yükleyip **dmesg** ile incelediğimizde kernelde bize gelen **Merhaba Dünya** çıktısını görebiliriz. Yalnız kernel içerisinde türkçe karakter kullanımı mevcut olmadığından ve size bunuda ek olarak göstermek istediğimden çıktıyı **hex code**'ları ile almış bulunuyoruz.

Modülümüzün sağlıklı şekilde çalıştığını gözlemledik ve eğer bu modülü silmek istiyorsak **rmmod** komutunu kullanabiliriz :

```
remnux@remnux:~/heyhey$ sudo rmmod merhaba
remnux@remnux:~/heyhey$ dmesg | tail -n 1
[ 6593.845495] Hello world kernelden cikartiliyor.
remnux@remnux:~/heyhey$
```

Ve çıkartılma sonucunda bizim modülümüz içerisinde belirlediğimiz **__exit** fonksiyonu çalıştı.

Eğer modülleri listelemek istiyorsanız **lsmod** komutunu kullanabilirsiniz örneğin : 

```
remnux@remnux:~/heyhey$ lsmod | grep merhaba
merhaba                12427  0 
remnux@remnux:~/heyhey$
```

Bu yazımızda basit bir şekilde **LKM** yani **Yüklenebilir Çekirdek Modülünü** en basit şeklinde geliştirmeyi öğrendik. 

Bir daha ki yazımda büyük ihtimal **sys_call_table hijacking** anlatacağım. 

Sonra ki yazılarda da artık bir rootkit yazarız diye düşünüyorum. Kendinize iyi bakın görüşmek dileği ile !