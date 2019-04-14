---
title: Linux Function Hooking
layout: post
---

# Linux Load-Time Function Hooking

Uzun bir süreden sonra bloguma yazı yazıyorum. 2019'un ilk blog yazısı olacak umarım yazıyı beğenirsiniz.

Öncelikle işi fazla komplekste itmeden size başlıktaki bazı terimleri açıklayarak başlamak istiyorum.

> * **Load-Time : Bir yazılım çalışmaya başlamadan önce bir yüklenme zamanı vardır. Program tam olarak çalışabilir hale gelene kadar gereksinimlerini kendine yükler örneğin (Libraries, Memory Regions)**

> * **Function Hooking : Yazılım içerisinde verilen bir fonksiyonu sahte bir fonksiyonla değiştirmek, düzenlemek.**

Anlamakta biraz zorlandıysanız hiç problem değil ileri de bu terimleri daha da detaylı inceleyeceğiz.
<br />

----------------------------------------------------------------------------------------------------------------------------
# Bir yazılımın kullandığı syscalları görmek
Yazılım içerisinde kullanılan sistem çağrılarını(syscalls) görmek için linuxta çoğunluk tarafından kullanılan **strace** binarysini kullanabilirsiniz.
**strace** çalıştıktan sonra örnek bir çıktı :

```
remnux@remnux:~/hoq$ strace ./ornek
execve("./ornek", ["./ornek"], [/* 53 vars */]) = 0
brk(0)                                  = 0x61f000
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8786da4000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=108273, ...}) = 0
mmap(NULL, 108273, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f8786d89000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
open("/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\37\2\0\0\0\0\0"..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=1840928, ...}) = 0
mmap(NULL, 3949248, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f87867bf000
mprotect(0x7f878697a000, 2093056, PROT_NONE) = 0
mmap(0x7f8786b79000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1ba000) = 0x7f8786b79000
mmap(0x7f8786b7f000, 17088, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f8786b7f000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8786d88000
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8786d86000
arch_prctl(ARCH_SET_FS, 0x7f8786d86740) = 0
mprotect(0x7f8786b79000, 16384, PROT_READ) = 0
mprotect(0x600000, 4096, PROT_READ)     = 0
mprotect(0x7f8786da6000, 4096, PROT_READ) = 0
munmap(0x7f8786d89000, 108273)          = 0
fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 2), ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f8786da3000
write(1, "Hello world !\n", 14Hello world !
)         = 14
exit_group(14)                          = ?
+++ exited with 14 +++
```

----------------------------------------------------------------------------------------------------------------------------
# Başlangıç

Şimdi linuxu açıp aşşağıda bulunan kodu derlediğimizi var sayıyorum :

```
#include <stdio.h>

int main(){

  puts("Hello world !");

}
```
Derleme : `gcc ornek.c -o ornek`

Şimdi bizim yapacağımız şey bu **puts** fonksiyonunu çalışma **zamanında(load-time)** verdiğimiz sahte **puts** ile değiştirmek. Böylelikle programda yazan **fonksiyon** değil bizim yazdığımız **fonksiyon** çalışıcak.

----------------------------------------------------------------------------------------------------------------------------
# Fonksiyonu hook etmek için gerekli kütüphanenin yazılması
Kütüphanelerimizi ekleyerek başlayalım :

```
#include <stdio.h>
#include <unistd.h>
#include <dlfcn.h>
```
Sonra hangi fonksiyonu hooklayacağımızı belirleyelim :
```
int puts(const char *message) {


}
```
Burada verilen fonksiyon ve parametreler çok önemli hook edeceğiniz fonksiyonun parametresini ve tipini vermemiz gerek.

Sonrasında orjinal fonksiyonun sahtesini oluşturmamız gerekiyor.

```
int (*new_puts)(const char *message);
```

Ve meşhur **dlsym** fonksiyonuna geldik. Başta eklediğim **dlfcn.h** library'sinden gelen bu küçük ama işlevi  **Function hooking'de** çok büyük olan bu fonksiyonu anlatmaya başlayalım
```
new_puts = dlsym(RTLD_NEXT, "puts");
```
Bu fonksiyon iki adet argüman alıyor. Bunlardan ilki olan **RTLD_NEXT** enum'u **dynamic loader API** kısmına 2. argüman ile bağlantılı bir sonraki örneğe dönmesini söylüyor. Son argüman ise dönülecek örneğin ismini istiyor ve buda bizim yerine sahtesini koyacağımız **puts** fonksiyonu.

Ve son olarak :

```
return new_puts("Hooked Message");
```

İle kütüphanemizi yazıyoruz ve **libornek.c** adıyla kaydediyoruz. Şimdi sıra geldi bu kütüphaneyi oyunda asıl yeri alan **LD_PRELOAD** ortam değişkenine(enviroment variable) atamaya.

Ondan öncesinde tüm bu kütüphanenin bütün kodlarını isteyen olursa : [Pastebin](https://pastebin.com/RwB0RzXm)

Burada ki pastebin linkinden ulaşabilir bu yukarıda anlatılan tüm kodların birleşimine.

----------------------------------------------------------------------------------------------------------------------------

# Kütüphanenin derlenmesi ve LD_PRELOAD'a aktarılması

Temiz bir şekilde derlemek için alttaki gcc parametreleriyle beraber kullanmamız gerekiyor.

```
gcc libornek.c -o libornek.so -fPIC -shared -ldl -D_GNU_SOURCE
```
Derlemeden sonra klasörünüze **libornek.so** adında bir kütüphane eklenecektir.

Şimdi bu yazdığımız kütüphaneyi **LD_PRELOAD** ortam değişkenine atıp önceden yazdığımız **ornek.c** yazılımını manipule etmemiz için alttaki komut satırında gerçekleştirdiğim işlemi yapınız.

```
remnux@remnux:~/hoq$ ls
libornek.c  libornek.so  ornek  ornek.c
remnux@remnux:~/hoq$ pwd
/home/remnux/hoq
remnux@remnux:~/hoq$ export LD_PRELOAD="/home/remnux/hoq/libornek.so"
```

Export ile **LD_PRELOAD** ortam değişkenine kütüphanemizi aktardığımıza göre bu ortam değişkeninin ne olduğundan bahsedebiliriz.

Bu ortam değişkeni yani **enviroment variablesi** linux içerisinde çoook meşhurdur. Hani bahsetmiştik ya bir yazılım çalıştırdığımız da o yazılım önce **(Library, Memory Regions)** gibi bölümleri yükler diye.

İşte bu **LD_PRELOAD** ortam değişkeni çalışan yazılımın başladığı anda bizim verdiğimiz kütüphaneyi içine almasını sağlıyor böyleliklede yazılımları manipule edebiliyoruz.

**LD_PRELOAD** değişkenine kütüphanemiz atanmadan önce **ornek.c** :

[Pastebin](https://pastebin.com/dKF6DVrU)

Atandıktan sonra :

[Pastebin](https://pastebin.com/6vnbTiR5)

Aradaki farkı incelersek görebiliriz ki :

```
0x7ffff7bd8000     0x7ffff7bd9000     0x1000        0x0 /home/remnux/hoq/libornek.so
```

**LD_PRELOAD** ortam değişkenine libornek.so atandıktan sonra **ornek.c** yazılımı içerisinede her çalışmada enjekte oluyor.

----------------------------------------------------------------------------------------------------------------------------
# THE END
Tüm bu olanlardan öncesi ve sonrasında ne değiştiğini görmek istersek şayet : 

**ornek.c**
```
#include <stdio.h>

int main(){

  puts("Hello world !");

}

```

Burada puts "Hello World" yazdır demesine rağmen içerisine enjekte ettiğimiz kütüphane bunu manipule ediyor ve biz bunu çalıştırmak istediğimiz de "Hello World" yerine oluşturduğumuz **libornek.c** kütüphanesinde yaptığımız manipule teknikleri ile eklediğimiz "Yeni Mesaj" çıktısı geliyor.

Öncesi  :

```
remnux@remnux:~/hoq$ ./ornek
Hello world !
remnux@remnux:~/hoq$
```

Function hooking işlemini yazdığımız kütüphaneyi **LD_PRELOAD**'a attıktan sonrası:

```
remnux@remnux:~/hoq$ export LD_PRELOAD="/home/remnux/hoq/libornek.so"
remnux@remnux:~/hoq$ ./ornek
Yeni mesaj
remnux@remnux:~/hoq$
```

Umarım yazıyı beğenmişsinizdir ve açıklayabilmişimdir **Function Hooking**, **Load-Time**, **LD_PRELOAD** vs.. gibi terimleri. İyi günler.