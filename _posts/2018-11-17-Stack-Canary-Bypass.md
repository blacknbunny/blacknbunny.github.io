---
title: Stack Canary Bypass
layout: post
---

Yazımıza geçmeden önce ben videodan daha iyi öğrenirim diyen arkadaşlar için youtube'da çektiğim videoya alalım sizleri : [Video](https://www.youtube.com/watch?v=sWKxjoZKhx4&t=845s)


Merhaba arkadaşlar bu blogum da sizlere standart güvenlik önlemlerinden biri olan **Stack Canary** yani bir diğer adı ile de **Stack Cookie**'sinin nasıl bypass edileceğinden bahsedeceğim. Kafanız da güvenlik önemleri terimine ait bir yapı olmuşması için çoğumuzun bildiği bir kaç güvenlik önleminin ismini vererek yazıma başlamak istiyorum.  **ASLR, NX, RELRO, SafeSEH, DEP** ve benzerleri... "Stack Canary" gibi güvenlik önlemleridir. Derleyiciniz ile bunları belirleyip işleme geçirebilirsiniz. Ya da işletim sisteminizi bunu otomatik belirlemesi için ayarlaya bilirsiniz.

# Güvenlik Önlemlerinden kısa bahsedelim

Güvenlik zafiyetlerinin sömürgesini bir az da olsa engellemek için vardırlar. Zafiyetler içerisinden en çok bilineni "Buffer Overflow" dur. Birazdan bahsedeceğimiz **Stack Canary**'nin bize **Buffer Overflow** zafiyetini kullanmamamız için ne gibi engellerde bulunduğunu anlatmaya başladığımız da daha iyi kavrayacaksınızdır güvenlik önlemlerinin neler olduklarını.

# Stack Canary Nedir ?

**Stack Canary** yazılım başlamadan önce yazılımın en üstünde **EBP** registerine aktarılmaya hazır 32 bit ise **GS** 64 bit ise **FS** flaglerinde rastegele oluşturulmuş bir değer saklar. Ve programın sonunda da bu değer hala aynımı diye test eder. Aşşağıda ki küçük python kodu bunu daha basit açıklayabilir.

```
from random import randint
cookie = randint(100, 100000)

cookie_backup = cookie

if cookie != cookie_backup:
 print("*** Stack Smash Detected ***")
 exit(0)
else:
 devametbeklemeyapma()

```

Yukarıda ki kodu anlamayanlar varsa basitçe anlatayım. 100 ile 100000 arasında rastgele bir sayı üretiyor ve bu ürettiğiyi sayıyı cookie değişkenine aktarıyor ve bu cookie değişkenini saklamak için cookie_backup değişkenine atıyor ve eğer bu cookie değişkeninin değeri programın sonunda aynı değil ise "Stack Smash Detected" outputunu verip programdan çıkış yapıyor. Aynı ise normal bir şekilde programa kışına devam ediyor. **Stack Canary** basit bir şekilde bu işi yapıyor.

Eğer programın başında verilen cookie değeri değiştirildiyse programdan çıkış yapıyor. Aynı ise normal devam ediyor. Peki ya buffer overflowu engelleyen durum ne ? O kısımada birazdan geleceğiz.

**Stack Canary** bizleri bulunan buffer alanının üzerine yazıp geçmekten alı koyan güvenlik önlemlerinden biridir. Bunun yapısını anlatmak için varsayalım ki aşşağıdaki gibi bir 64 bytelık buffer alanımız var.


```
char buffer[64];
```

Ve bu buffer alanı dışardan gelen bir veriyi **strcpy** fonksiyonu ile buffer alanının içerisine aktarıyor.

```
strcpy(buffer, argv[1]);
```

Normal bir programın akışını **Buffer Overflow** zafiyeti ile terse kullandığımız da normal olarak 64 byte'ın üzerinde bir değer yazacağımızdan alanı delip geçeceğizdir ve stack içerisinde değişkenlere, adreslere ve benzerlerine yazacak hale geleceğizdir. En önemlisi de **EIP** registerinin üzerine yazmak ve return adresini kontrol edip programa kışını yönlendirmek. Fakat **Stack Canary**'nin **Cookie**'leri bize engel olacağından **Buffer Overflow** zafiyetini kullanamayacağızdır.

Ve unutmayalım ki **Cookie**'ler **dinamiktir** aynı değillerdir her program çalıştığın da farklı bir değer alırlar.

Stack içerisin de normal bir programın ve **Stack Canary** güvenlik önleminin etkin olduğu programın görüntüsü :

Normal :

```
-------------------
|                 |
|  Buffer         |
|------------------
|  Saved EIP |
-------------------
|  Saved EBP |
|------------------
|  Return Address  |
 ------------------

```

Stack Canary :

```
-------------------
|                 |
|  Buffer         |
|                 |
|------------------
|  Cookie         |
|------------------
|  Saved EIP      |
-------------------
|  Saved EBP      |
-------------------
|  __stack_chk_fail@plt |
|------------------
|  Return Address |
 ------------------

```

# Ortamımızı hazırlayalım

Aşşağıda ki kaynak kodu indirelim ve belirtilen opsiyonlar ile derliyelim. Sonra da **ASLR**'yi devre dışı bırakalım.

[Örnek Buffer Overflow](https://pastebin.com/pUJwmRgu)

`gcc -Wl,-z,norelro -z execstack -no-pie canary.c -o canary`

**ASLR**'yi disable etmek için bu command line kodu kullanalım :

```
echo 0 | sudo tee /proc/sys/kernel/randomize_va_space
```

# Yavaştan analize başlayalım ve stack canary'i daha iyi anlayalım

Yukarıdakileri yaptıktan sonra programı aşşağıda ki gibi çalıştıralım ve çıkacak sonuca bakalım :

```
root@ubuntu:~# ./canary AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
*** stack smashing detected ***: <unknown> terminated
Aborted (core dumped)
```

Buffer alanımız 64 olduğu için 64'ten daha büyük bir byte sayısı verdiğimiz de program crash oluyor fakat bu normal bir crash değil. Normal de hatırlarsanız **Segmentation fault** çıktısını alıyorduk.

Bu sefer "Stack Smashing Detected" Çıktısını aldık. Bu bizim **Stack Canary**'mizin güvenlik önlemi. Şimdi assembly içerisinde biraz daha detaylı inceleyelim :

[Disassemble Edilmiş ./canary](https://i.imgur.com/RgGDoqL.png)

Yukarıda ki fotorafa girdiğimiz de normal bir program akışı dışın da programın içerisinde bulunan bir kaç kod parçacığı görebiliyoruz. Bunlardan biri :

```
0x0000000000401151 <+15>:    mov    rax,QWORD PTR fs:0x28
0x000000000040115a <+24>:    mov    QWORD PTR [rbp-0x8],rax
```

Bir diğeri ise :

```
0x0000000000401190 <+78>:    mov    rcx,QWORD PTR [rbp-0x8]
0x0000000000401194 <+82>:    xor    rcx,QWORD PTR fs:0x28
0x000000000040119d <+91>:    je     0x4011a4 <main+98>
0x000000000040119f <+93>:    call   0x401040 <__stack_chk_fail@plt>
```

Başta yazdığımız küçük python kodunu hatırladınızmı ? Aslında burada dönen olay oradakiyle tam aynı.

64 bit bir işletim sistemi kullandığımızdan **FS** flaginin içerisinden 0x28 offsetini **RAX** registerine movluyor. Peki bu **FS** registerinin 0x28 içerisinde ne var ?

Tabiki de bizim **Stack Cookie**'miz olan **0x24582bb086d7a100** : 

```
gdb-peda$ x/x $rax
0x24582bb086d7a100:     Cannot access memory at address 0x24582bb086d7a100
```

Unutmayalım ki 64 bit sistemler de **Stack Cookie**'sinin uzunluğu 7 byte'tır. 32 Bit sistemler de ise bu 4 bytetır ve bunların ikisi de bakın burası çok önemli **00** ile başlar.

Python kodunda da olduğu gibi şuan da cookieyi cookie_backup değişkenine aktardık.

2. Kod parçacığı olan kısım ise bu cookie hala aynımı değilmi testidir.

```
0x401190 <main+78>:  mov    rcx,QWORD PTR [rbp-0x8]
```

Bu kısım ile rbp-0x8'de bulunan **Stack Cookie**'sini **RCX** registerine atıyoruz.

```
0x401194 <main+82>:  xor    rcx,QWORD PTR fs:0x28
```

**XOR** ile de bu **Stack Cookie**'sinin değiştirilip değiştirilmediğine bakıyoruz.

```
0x40119d <main+91>:  je     0x4011a4 <main+98>
```

Eğer değiştirilmediyse program akışını normal şekil de devam ettir.

Değiştirilmediyse :

```
0x000000000040119f <+93>:    call   0x401040 <__stack_chk_fail@plt>
```

**__stack_chk_fail fonksiyonunu çağır.**

Bu fonksiyon da bizi programdan atıp exit(0) fonksiyonunu çağırıp programdan çıkıyor. Ekranada "Stack Smashin Detected" yazdırıyor.

Yani buradaki en önemli kısım olan :

**Buffer alanını deldiğimiz sırada cookie'nin üzerine de yazdığımızdan program bir iş karıştırdığımızı anlıyor ve çıkış yapıp ekrana stack'i ezmeye çalıştığımızı yazıyor.**

Yani biz **EIP** registerinin üzerine yazalım derken **Stack Cookie**'sinin de üzerine yazıyoruz ve **__stack_chk_fail** fonksiyonu bu değişikliği görüp birşeyler yapmaya çalıştığımızı anlayıp programdan **exit(0)** fonksiyonu ile çıkış yapıyor.

Gnu Debugger ile programa **92** byte verelim. Normal de **92** byte'ta **EIP** registerinin üzerine yazıp shellcode'un adresini verebilmemiz lazımdı fakat çalıştırdığımız da :

![Can't overwrite EIP](https://i.imgur.com/Q444cqe.png)

Görebiliriz ki **EIP** üzerine yazamıyoruz çünkü **Stack Cookie**'sinin üzerine yazdık ve **__stack_chk_fail** bunu görüp programı durdurdu ve ekrana "*** Stack Smash Detected ***" yazısını yazdı.

# Stack Canary'nin bypass edilme tekniği

**Stack Canary**'nin ne olduğunu iyice kavradığımıza göre yavaştan bypass edilmesine geçelim.

Bypass tekniği olmadan neler olduğunu yukarı da gördük şimdi eip yani return adresini değiştirmemiz için nasıl bypass edileceğini açıklayalım.

Öncelikle programa tekrar **88** bytelık **A** harfini verelim ve geri kalan 4 byte'ı da **B** ile dolduralım ve eip üzerine **B**'leri nasıl ekleyeceğimizi görelim **Stack Canary**'i bypass edip.

GDB ile bu kısıma geldiğimiz de:

```
0x401151 <main+15>:  mov    rax,QWORD PTR fs:0x28
0x40115a <main+24>:  mov    QWORD PTR [rbp-0x8],rax
```

**RAX** registerine aktarılan **Cookie** değerini alıp saklamamız gerek. Yani notepade yazın, chrome'de yeni sekme oluşturun yazın yada aklınızda tutun ama bir yerde tutun o adresi :

**x/x $rax** komutu ile **gdb** içerisinde **Cookie** değerini aldım ben **0x3169b6a3c855be00**. 64 Bit olduğu için 7 byte uzunlıkta ve **00** ile başlıyor.

Şimdi adresi aldığımıza göre 2. kısmımıza geçelim ve **RCX** registerinin değeri yani **Cookie**'mizin değeri büyük ihtimal **B**'ler ve **A**'lar ile kaplanmış olucaktır. **__stack_chk_fail** kısmına gelmeden **breakpoint** ile duralım yani bu kısımda :

```
=> 0x401194 <main+82>:  xor    rcx,QWORD PTR fs:0x28
0x40119d <main+91>:  je     0x4011a4 <main+98>
0x40119f <main+93>:  call   0x401040 <__stack_chk_fail@plt>
```

Bir adım ilerleyelim ve **RCX** registerinin değerine bakalım :

```
gdb-peda$ x/x $rcx
0x4141414141414141:     Cannot access memory at address 0x4141414141414141
```

Görebiliyoruz ki **Cookie** değerimiz **A** harfi ile dolmuş ve **_stack_chk_fail** bu **Cookie** değerinin değiştiğini görecektir bu yüzden bizim başta sakladığımız cookie değerini tekrar **RCX** registerine vermemiz gerekiyor.

Şu şekilde verelim hemen :

```
gdb-peda$  set $rcx = 0x3169b6a3c855be00
```

Ve tekrardan bakalım **Cookie** değerimiz verildimi diye :

 ```
gdb-peda$ x/x $rcx
0x3169b6a3c855be00:     Cannot access memory at address 0x3169b6a3c855be00
 ```
 
 **Cookie** değerimiz eski haline döndü ve programdan artık çıkış yapılmayacaktır. Bizde **EIP** registerinin üzerine basit bir şekilde yazabiliriz bundan sonra :
 
 [EIP Resim](https://i.imgur.com/kSwv6YW.png)
 
 ve gördüğünüz gibi **EIP** registerinin üzerine yani return addresinin üzerine **B** harflerimizi yerleştirdik tabi bu bir örnek oraya normal de shellcodeumuzun adresi geliyor.
 
 **GDB** içerisin de yukarıdaki adımları takip etmeniz çok önemli.
 
 Okuduğunuz için çok teşekkürler umarım yardımcı olabilmişimdir. Sorularınız varsa veya herhangi bir hata gördüyseniz lütfen bana twitter hesabım olan @0DAYanc'tan yazmaya çekinmeyin. Bir Sonraki Yazıda Görüşmek Üzere !