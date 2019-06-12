---
title: Rootkit Development - (Part 1)
layout: post
---

# Rootkit Development - (Part 1)

Merhaba arkadaşlar.

**Rootkit Development**'in ilk part'ına hoşgeldiniz.

Bu yazımızda bir **Rootkit**'in ne olduğunu tam olarak anlayacağız.

Aynı zamanda **Rootkit**'ler ile daha haşır neşir olacağız.

Bu yazının başında önemli bir açıklama olarak şunu söylemek istiyorum bu **Rootkit Development** serisinden sonra oluşabilecek durumlardan ben sorumlu değilim.

Bunun dışında bu **Rootkit Development** serisi hem **Windows** hem **Linux** aynı zamanda da **Mac OS** işletim sistemleri için geçerli olan bilgileri içermektedir.

Yani daha basit bir şekilde **Ortaya karışık birşeyler yap usta** denildikten sonra bu yazıyı yazmış bulunmaktayım.

Seri sonunda **Rootkit Geliştirmek**, **Rootkitleri tanımak**, **Kernel**, **Software Sec**, **Hardware Sec** vs ... gibi cümleler ve kelimelerle daha haşır neşir olacağız.

Ve bunlar dışında **Kernel**, **Hooking**, **Tracing**, **HIDS** gibi anahtar kelimeler ile daha da yakınlaşacağız.

Bu yazıda fazla teknik detaya girmeden aşşağıdaki konuları anlatacağım :

1. **Rootkit Nedir ?**

2. **Rootkit Tipleri Nelerdir ?**

3. **Rootkit Gizlenme Süreçleri Nelerdir ?**
	* **HIDS Nedir ?**
		* **HIDS'ler nasıl bypass edilir ?**
4.  **Logging, Tracing, Hooking Nedir ?**
	* **Hooking Türleri Nelerdir ?**
		* **System Calls**
			* **Hooking System Call** 
			* **System Call Modules**
				* **System Call Function**
				* **sysent Structure**
				* **Offset Value**
				* **modfind Function**
				* **modstat Function**
				* **syscall Function**
		* **Network Connections**
		* **Processes**
		*  **BSD Communication Protocols**
			* **protosw Structure**  
			*  **inetsw[] Switch Table**
			*  **mbuf Structure**
	* **Kernel Process Tracing Nedir ?**
	* **Keystroke Logging**
5. **Kernel Object Nedir ?**
	* **Direct Kernel Object Manipulation**

**Rootkit Development**'in ilk partında yer vereceğim konular bunlar.

Ikinci **Rootkit Development** partında daha da teknik detaya ineceğiz.

# Rootkit Nedir ?

Bir **Rootkit**'e kök kullanıcı takımı denilebilir.

**Rootkit** bulunduğu işletim sisteminin **Kernel API**'sini **Hook** ederek çalışmaktadır genellikle.

Yani **Sistem Çağrı**'larını kendi alehine kullanıp **Dosya**, **Process** vs.. gizleyebilmektedir.

Daha da basit bir şekilde bir **Rootkit** sistem içerisinde **Programları**, **Dosyaları**, **Internet Bağlantılarını**, **Servisleri**, **Driverleri** hatta  **İşletim Sistem**'ini kontrol edebilmektedir.

Bunun yanı sıra sistem içerisinde bulunan **TCP**, **UDP**, **ICMP** vs.. gibi internet protokollerini manipule edebilmektedir.

Ayrıca arkada çalıştırdığı bir **Backdoor**'un dinlediği **Port** adresini **IP** adresini gizleyebilmektedir.

**Mac**, **Windows**, **Linux** işletim sistemlerinde **Rootkit** terimi çokta farklı değildir.

**Rootkit** terimine daha da yakından bakacak olursak şayet :

* Bir **Rootkit** kendisini veyahut **Zararlı Yazılım**'ı gizlemek için kullanılabilir.

* Aynı zamanda bir **C&C** yani **Command and Control** sunucusu olarak sistem içerisinde kullanılabilir. Aşağıdaki resim **rootkit.com** tarafından geliştirilmiş **Win2k Rootkit**'inin komutlarını içermektedir.
	* ![](https://resmim.net/f/MC3Qrx.png)

* Görülebildiği üzere sistem içerisinde komut çalıştırmak ve **Klasör, Process** gizlemek mümkün. Ayrıca **sniffkeys** ile **klavye**'de basılan tuşları yakalamakta mümkün.

* Tabi bunlar bir **Rootkit**'in yapabileceklerinden bir kaç tanesi.

Tabi şöyle bir soru sormak mümkün : **Malware** ile **Rootkit** arasında ne gibi bir fark vardır ?

Bu sorununda cevabı **Rootkit**'in normal bir **Malware**'nin işleyişinden farklı olarak **Sistem Çağrı**'larını **Kancalaması** yani **Hook** etmesi mevcut.

Daha önceki yazım olan [Linux System Call Hooking](https://blacknbunny.github.io/2019/05/07/linux-system-call-hooking.html) yazım içerisinde **Rootkit**'lerin nasıl çalıştığını az çok anlattım.

Yalnız bu ve ileriki yazımda **Rootkit** teriminin daha derinlerine dalacağız.

# Rootkit Tipleri Nelerdir ?

Basit bir şekilde **Rootkit** tipleri :

* **Kernel Rootkit**
	* **Kernel** içerisinde çalışan bir **Rootkit** tipidir. **İşletim Sistemi**'nin **Kaynak Kodunu** değiştirip hatta silebilen bir **Rootkit** tipidir.

* **Hardware or Firmware Rootkit**
	* **Hardware** ya da **Firmware** içerisinde çalışan bir **Rootkit** tipidir. 

* **Hypervizor or virtualized Rootkit**
	* **Hypervizor** içerisinde çalışan aynı zamanda **Sanallaştırılmış Rootkit** tipidir. **Boot-up** kavramında **Kernel Rootkit**'i **Kernel** çalıştıktan sonra çalışır yalnız **Hypervizor** içerisinde ilk önce **Rootkit** çalışır dolayısıyla **Kernel Rootkit**'ten daha güçlüdür. **Hypervizor** içeren herhangi bir durumda kendini gösterebilmektedir.

* **Bootloader Rootkit or Bootkit**
	* **Boot** içerisinde çalışan bir **Rootkit** ve **Bootkit** bizim **İşletim Sistemimiz** ile aynı anda çalışmaya başlar. Kendini **Master Boot Record (MBR)** ya da **Volume Boot Record (VBR)**'a enjekte etmektedir. Dolayısıyla bir **Antivirüs**'ün bu tipte bir **Rootkit**'i yakalaması çok zordur.

* **Memory Rootkit**
	* Bir **Memory Rootkit**'i bizim **RAM**'ımız içerisinde saklanmaktadır. Dolayısıyla **Ram Memory**'si yani **Hafızası** içerisinde manipule edebilme yetkisine sahiptir. Olabilecekleri siz düşünün.

* **User-mode or application rootkit**
	* Bir **User-mode** ya da **Application Rootkit**'inin **Antivirüs** tarafından bulunması kolaydır. Bu tipteki **Rootkit**'ler **Aplikasyon** yani **Yazılım** içerisinde saklanmaktadır. Ya da daha basit bir şekilde **Kullanıcı**'nın ulaşabildiği her kısma ulaşabilmektedir.

![](https://resmim.net/f/vEevRU.png)

Yukarıda ki fotorafta en çok **Yetkilendirilmiş** ve en az **Yetkilendirilmiş** çekirdeğe giden yolu görebiliriz.
 
Basit bir şekilde bir **İşletim Sistemi**'ni **Dünya**'ya benzetmek mümkün.

# Rootkit Gizlenme Süreçleri Nelerdir ?

Bir **Rootkit**'in kendini gizleme süreci aşşağıdaki sıralamadan oluşmaktadır.

*  Örneğin **ls** komutu içerisinde **Çıktı** olarak karşımıza çıkan **Dosyalar** arasında istediğimiz **Dosya**'yı gizlemeye yaramaktadır tabi bu sadece küçük bir örnek. 

*  Bunu yapan basit bir **Rootkit** geliştirmiştim [Linux System Call Hooking](https://blacknbunny.github.io/2019/05/07/linux-system-call-hooking.html) adlı yazımda.

*  Bir **Rootkit** ayrıca **İşletim Sistemi**'nin **Kaynak Kod**'unu değiştirebildiğinden kendini normal bir **Kullanıcı**'nın ulaşamayacağı bir yere ekleyebilmektedir. Daha da basit şekilde **Filesystem**'imizden yani **Dosya Sistemi**'mizden farklı bir noktada çalıştırabilir kendisini.

* **Sistem Çağrıları**'nı değiştirip **İşletim Sistem**'i içerisinde **Kullanılan Portları** göstermekte kullanılan **Komut**'ları manipule edip kendini gizleyebilmektedir.

*  Ayrıca bir **Rootkit** çalıştığı **Process**'i bu **Process**'leri göstermekte kullanılan **Yazılımlar**'dan kendini gizleyebilmektedir.

*  Tabi bunlar bir kaç tanesi. Bir **Rootkit**'in kendini gizlemesi için gerçekleştirebileceği senaryolar çok fazla.

### HIDS Nedir ?

Şimdi diyebilirsiniz ki babacım sen bana **Rootkit** yazmasını göster **HIDS** ne ya geç bunları. Yalnız **Rootkit** çok genel bir terim dolayısıyla içerdiği çoğu konuya değinmek istiyorum bu yazımda. Zaten **Part 2**'de çok çok daha derine inip kendi **Rootkit**'imizi bile geliştirebiliriz.

O yüzden bunları bilmek ileride çok yarayacaktır.

![](https://resmim.net/f/yF2AMg.png)

Açılımı **Host-based Instrusion Detection System** olan **HIDS** genel olarak **Modification**'ları **Filesystem**'de bulunan **Dosya**'lara kayıt edip göndermektedir.

Daha da basit bir şekilde her bir dosyanın **Hash**'ini kendi **Veritabanı**'nda tutup belli bir süre aralığında bu dosyaları eskiden kayıt altına aldığı **Hash**'ler ile karşılaştırıp bir dosya içerisinde **Değişiklik** oldu mu olmadı mı onu bulmak için vardır.

Bunu anlatmamın sebebi ileride biz bir **dosya** gizlemek istersek bu dosya üzerinde değişiklik yaptığımızı **HIDS** anlayıp bunu engelleyecektir dolayısıylada **Rootkit**'imiz **Çalışmak**'ta sıkıntı çekecektir.

Tabi bununda **Bypass** yöntemi mevcut.

### HIDS'ler nasıl bypass edilir?

Bu da işin komik tarafı.

**API Hooking**'i engellemeye çalışırken kendisi **System API**'sini kullanıyor...

Hani dedik ya **Dosya**'larda gerçekleşen değişiklikleri **Hash** karşılaştırması ile buluyor.

İyi güzel kardeşim buluyorsunda benim sorum **Kendine** niye bakmıyorsun.

**HIDS**'leri **Bypass** etmek için içerisinde kullandığı **Sistem Çağrıları**'nı **Hook** edip çalışma şeklini değiştirebiliriz.

Bu şekilde bu **Yazılım** bizim istediğimiz şekilde çalışacaktır.

Ve **Yazılım**'a bu **Dosya**'yı ya da şu **Hash**'i karşılaştırma diyebileceğiz.

**HIDS**'i kullanmakta olan bir sürü yazılım mevcut **Monitoring** için.

Bu yazılımlardan sistem içerisinde bir **Rootkit** mevcut olduğunu karşı tarafın anlamasını engellemek için bu tür **Yazılım**'lar içerisinde değişiklik yapmamız gerekmekte.

# Logging, Tracing, Hooking Nedir ?

Alttaki sıralamada bunların açıklamasını bulabilirsiniz :

* **Logging**
	* Adından da anlaşılabileceği gibi **Kayıt Tutmak**'tır. Yalnız biz **Rootkit**'ler ile **Yasal** yoldan değil **Yasadışı** yoldan kayıt tutmaktayız. Dolayısıyla bir **Rootkit**'in içerisinde olmazsa olmazlardan biri **Kayıt Tutma** işlemidir. Bu **Kayıt Tutma** işlemi **Kurban**'dan alabildiğimiz tüm herşey dahildir. Örneğin **Dosyalar**, **Internet Bilgisi**, **Internet Istekleri** vs...

* **Tracing**
	* **Rootkit**'ler tarafından kullanılan **Basit** bir **Debugging** işlemidir.
	*  **Yazılım** tarafından gerçekleştirilen her bir **Kernel Operasyon**'unu kayıt altına almak denilebilir buna kısaca. **Kernel Operasyon**'larından bazıları :
		* **System Call**
		* **I/O**
		* **Signals**
  *  Yukarıdaki listede bulunan **Operasyon**'ları bir **Rootkit Trace** ederek gözlemleyebilmektedir. Dolayısıyla **Yazılım**'ın nasıl çalıştığını bu şekilde izleyebilmektedir.

* **Hooking**
	* Türkçe meali ile **Kancalama** denilebilir. Bir **Sistem Çağrısı**'nı **Kancalamak** basit bir şekilde o **Sistem Çağrısı**'nın yerine kendi oluşturduğumuz **Sistem Çağrısı**'nı koyup **Manipule** etmektir.

## Hooking Türleri Nelerdir ?

Basit bir şekilde **Hooking Türleri**'ni aşşağıda sıraladım.

* **API Hooking**
	* **API Hooking** kullanılan **İşletim Sistemi**'nin **API**'sinde ki **Fonksiyon**'ları ya da **Kütüphane**'leri **Kancalamaktır**.
	* Basit bir şekilde aşşağıdaki resim **Windows API**'sinin **user32.dll**'ini hook ediyor :
		* ![](https://mk0resourcesinfm536w.kinstacdn.com/wp-content/uploads/APIhook-2-04222014.gif)
	
* **IAT Hooking**
	* **Import Address Table Hooking**'e değinecek olursak şayet. **Portable Executable** yani **Çalıştırılabilir Dosya** içerisinde bulunan **Import Address Table**'yi **Kancalamak**'tır. Daha da basit bir şekilde :
	* **IAT** içerisinden  **Hook** edeceğimiz **Fonksiyon**'u bulduktan sonra bu **Fonksiyon**'un adresini bizim yazdığımız **Fonksiyon**'un adresi ile değiştirmektir.
  * **IAT** basit bir şekilde **PE Header**'i içerisinden bulunabilir. Aşağıda ki resim bunu daha da basit bir şekilde sizlere özetlemektedir.
	* ![](https://resmim.net/f/jlrKbw.png)

* **Function Hooking**
	* Belirlediğimiz **Yazılım**'ın içerisinde ki **Fonksiyon**'u oluşturduğumuz sahte **Kütüphane**'yi içerisine **Load-Time** ya da **Run-Time** zamanında sahte **Fonksiyon**'umuz ile değiştirmektir.
	* Bir önceki blog yazımda bunu anlattım bkz : [Linux Function Hooking](https://blacknbunny.github.io/2019/04/14/Linux-Function-Hooking.html)

* **System Call Hooking**
	* Belirlediğimiz **Yazılım**'ın içerisinde bulunan asıl **Sistem Çağrısı** ile sahte **Sistem Çağrımızı** değiştirmek denilebilir.
	* Bunuda anlattığım blog yazıma sizleri alalım : [Linux System Call Hooking](https://blacknbunny.github.io/2019/05/07/linux-system-call-hooking.html)

### System Calls

Bunlara basit bir şekilde **Sistem Servis İstek**'leri diyebiliriz.

Daha da basitleştirirsek **İşletim Sistemi**'ne özel **Çağrılar** yani **Fonksiyonlar** diyebiliriz.

Sistem çağrıları **Kernel** versiyonuna göre değişsede basit bir şekilde bir kaç tane stabil **Linux Sistem Çağrısı** aşağıdaki resimde bulunabilir :

![](https://resmim.net/f/IzD89k.png)

Bu resimi aldığım web sayfası çoğu **Sistem Çağrısı**'nı içermektedir bakmak isteyenleriniz olursa : [Syscall List](http://asm.sourceforge.net/syscall.html)

#### Hooking System Call

Bir sistem çağrısını **Hook** etmek için basit bir şekilde o **Sistem Çağrısı**'nın bir sahtesini oluşturup yerini değiştirmemiz gerekmektedir.

Yukarıda daha önce yazdığım blog yazılarında bu kısmı daha detaylı anlattım okumayanlarınız varsa.

#### System Call Modules

**Sistem Çağrısı Modül**'leri basit bir şekilde **KLD**'lerdir. **İşletim Sistem**'lerinde **Sistem Çağrı**'ları **Sistem Servis İstekleri**'dir. Basit bir şekilde **Kernel**'den yani **Çekirdek**'ten bir **Yazılım**'ın **İstek**'te bulunmak için kullandığı bir **Mekanizma**'dır.

Her **Sistem Çağrı Modülü** için 3 ayrı öğe vardır. Bunlar **System Call Function**, **sysent structure**, **offset value**'den oluşmaktadır.

#### System Call Function

**<sys/sysent.h>** içerisinde **Prototip**'i bulunan bir **Fonksiyon**'dur bu

**Parametre**'leri ve **Tip**'i yukarıda bahsettiğimiz **sysent.h** başlık içerisinde şu şekildedir :

```
typedef int     sy_call_t(struct thread *, void *);
```

**thread** parametresi çalışmakta olan **Thread**'i **Point** etmektedir.

**void** ise belirtilecek **Sistem Çağrı**'sının **Argüman Yapısı**'nı **Point** yani **İşaret** etmektedir.

Basit bir şekilde bu **Fonksiyon**'un **Örnek** kullanımı aşşağıdaki gibidir :

```
struct sc_example_args {
	char *str;
};
	static int
	sc_example(struct thread *td, void *syscall_args){
		struct sc_example_args *uap;
		uap = (struct sc_example_args *)syscall_args;
		
		printf("%s\n", uap->str);
		
		return(0);
}
```

Bu örnek kısaca bir **Argüman** alıp bunu **Sistem Konsol**'una **Output** ediyor ve **printf** aracılığıyla bunu dışarıya yazdırıyor.

**Sistem Çağrısı Fonksiyon**'ları **Kernel** içerisinde **Alan** ayırarak işleme geçerler.

Ayrıca bu çağrılar genellik ile **User Space** ve **Kernel Space** içerisinde **İstek** beklerler. 

**User Space** içerisinde **User-mode application**'lar çalışmakta olduğu için bu **Application**'lar **User Space** içerisinden sistem çağrılarını alırlar.

**Kernel Space** içerisinde de **LKM**'ler gibi **Kernel Modül**'leri çalışmakta olduğundan bu modüllerde **Kernel-mode application**'lar sayılır ve bu **Application**'lar **Sistem Çağrı**'ları için **Kernel**'den **İstek**'te bulunur.

#### sysent structure

**Sistem Çağrı**'ları basit bir şekilde **Entry**'leri ile bir **sysent** yapısının içerisinde belirtilirler. Ve aşşağıdaki şekilde **<sys/sysent.h>** başlığı içerisinde belirtilmiştir bu **Structure** yani **Yapı**.

```
struct sysent {
	int sy_narg;  /* argüman sayısı */
	sy_call_t *sy_call;  /* sistem çağrısı yada fonksiyon ismi*/
	au_event_t sy_auevent;  /* sistem çağrısı ile ilişkili denetim durumu */
};
```

Örnek bir **Sistem Çağrısı**'nın bu **Yapı** içerisinde belirtilmesi :

```
static struct sysent sc_example_sysent = {
		1,    /* argüman sayısı */
		sc_ornek  /* sistem çağrısı yada fonksiyon ismi */
}
```

Basit bir şekilde içinde **Sistem Çağrı**'larını barındıran bir **Array** diyebiliriz buna **sysent[]**.

#### Offset Value

**Sistem Çağrı**'sının **Sayısı** olarak bilinmektedir.

Benzersiz **0** ile **456** arasında her bir **Sistem Çağrı**'sının kendine özgü bir sayısı mevcuttur.

**offset** değerini **NO_SYSCALL** ile değiştirirsek **sysent** içerisinde ileride bulunan ve kullanılmayan **offset**'e geçiş yaparız oluşturduğumuz yada kullanacağımız **Sistem Çağrı**'sı ile.

Örnek :

```
static int offset = NO_SYSCALL;
```

#### modfind Function

Bir **Kernel Modülü**'nü bulmak için kullanılan **Fonksiyon**'dur.

Örnek :

```
#include <sys/param.h>
#include <sys/module.h>

int
modfind(const char *modname);
```

#### modstat Function

Bir **Kernel Modülü**'nün **Status**'ünü yani **Durumu**'nu döndüren **Fonksiyon**'dur.

```
#include <sys/param.h>
#include <sys/module.h>

int
modstat(int modid, struct module_stat *stat);
```

Dönecek bilgi **stat** argüman'ı içerisinde tutulmaktadır. Bu argüman **<sys/module.h>** başlığında belirtilmiştir.

#### syscall Function

Bir **Sistem Çağrı**'sını çağırmak için kullanılan bir **Fonksiyon**'dur.

Bunuda **Sistem Çağrı**'sının **Offset Value**'sini alarak o çağrıyı çalıştırır.

```
#include <sys/syscall.h>
#include <unistd.h>

int
syscall(int number, ...);
```

Yani **Sistem Çağrı**'sının sayısını **syscall function**'una verdiğimizde o **Sistem Çağrısını** çalıştırır.

### Network Connections

Bir **Rootkit**'in **Internet** altında gerçekleştirdiklerini sırayla altta yazmış bulunmaktayım.

* Bir **Rootkit** çalışma sırasında kendini **Internet** içerisinde gizlemek için **Wireshark**'ın kullandığı **Sistem Çağrı**'ları ile oynayıp **TCP**, **UDP** vs.. gibi **Internet Protokol**'lerinde kendini gizleyebilmektedir. Dolayısıyla **Rootkit**'in gerçekleştirdiği **Request**'ler **Rootkit** tarafından gizlenebilmektedir.
* **Wireshark** bir örnekti başka bir örnek olarak **Linux** içerisinde gerçekleşen ağ izleme için kullanılmakta olan **Yazılım**'lardan kendini gizleyebildiği için sistem içerisinde %100 gizlilik elde edebilmektedir.
* **Rootkit** geliştirmek sadece akılda oluşturulabilecek senaryolarla sınırlıdır. Yani eğer siz bu **Rootkit**'i sistem içerisinde bir dosya olmaktan yada bir **DNS Sunucu**'suna **Request** attığında bu **Request**'i gizlemek bir senaryo olabilir. Dolayısıyla sistem içerisinde yapabileceğiniz tüm değişim, etkileşim aklımızda bitmektedir.
* Sistem içerisinde kullanılan **TCP**, **UDP**, **ICMP** protokolleri bir **Rootkit** tarafından düzenlenebilmektedir.
* Bir **DNS Yazılım**'ının kullandığı **Sistem Çağrısı** bir **Rootkit** tarafından düzenlenebildiği için o **Yazılım** içerisinde kayıt altında tutulan **DNS Request Log**'larından **Rootkit** kendi attığı **DNS Request**'lerini yani **DNS İstek**'lerini gizleyebilmektedir.

![](https://resmim.net/f/edv0td.jpg)

**Sistem Çağrıları**, **Sürücüler**, **Diskler** bunların hepsi içerisinde **Sistem**'den **Çağrı** yani **Fonksiyon** isteğinde bulunduğundan bunlar **Rootkit** tarafından düzenlenebilmektedir.

Bir senaryo olması açısından **Router**'imizin sunucusuna ulaşılırsa şayet içerisine eklenilebilecek bir **Rootkit** ile **ISP** arasında **Giden, Gelen** izlenilebilir.

**Rootkit**'lerin **Backdoor** alması için birçok yol mevcut olmasına rağmen genellik ile **Rootkit**'ler kendi içerisinde en azından aldığı bir **Reverse Shell**'in bile beklemede olduğu **IP:PORT** adreslerini gizleyebilmektedir.

### Processes

**Rootkit**'in **İnternet** içinde gizlenmesinin yanı sıra kendini gizlediği alanlardan biride **Process**'lerdir. Örneğin **Windows**'ta **Görev Yöneticisi**'ni açtığınızda orada **explorer.exe**'yi görebilirsiniz.

Bu **explorer.exe** bir **Rootkit** olsaydı şayet onu orada göremezdiniz sebebide **Görev Yöneticisi** bile **Sistem Çağrı**'larını kullanmaktadır.

**Rootkit** kendini gizleyebildiği gibi bu gizlenmeninde ortaya çıkması için kullanılan methodlar vardır.

Örneğin **Process Hacker** yazılımı içerisinde **Gizlenmiş Process**'leri bulmak mümkün.


![](https://resmim.net/f/mkuzbs.jpg)

Tabi bu **Gizlenmiş Process**'i bulmak için kullanılan methodlarında yapısını tersine kullanan methodlar mevcut.

Dolayısı ile hep bir kaçış dönüyor **Rootkit** kelimesinin derinlerinde.

### BSD Communication Protocols

İsimdende anlaşılabileceği gibi **BSD İletişim Protokolleri**.

Bu **İletişim Protokolleri** kurallardan oluşmuştur ve iki **İletişim** halinde olan **İşlem** tarafından kullanılır.

Buna bir örnek olması için **( TCP/IP Protocol )** öne çıkarılabilir.

**FreeBSD** içerisinde bir **İletişim Protokol**'u **Protocol Switch Table** yani **protosw[]** içerisinde **Kayıt**'ları ile tanımlanır.

Bu **Kayıtlar** düzenlenebildiği için **Rootkit** bunun karşısında eli boş kalmamaktadır.

![](https://resmim.net/f/YdCqXV.jpg)

Ve bu sayede bir **Rootkit**'in birçok **Network Layer**'ini **Manipule** etmesi mümkün.

**Communication Endpoint** tarafından **Gönderilen** ve **Alınan** istekleri bir **Rootkit** düzenleyebilmektedir.

#### protosw Structure

Her bir **Protocol Swich Table** kayıdı **protosw** yapısının içerisinde tutulur.

Bu **Structure**'in yani **Yapı**'nın kaynak kodları ```<sys/protosw.h>``` başlık dosyasında bulunmaktadır.

```
struct protosw {
	short   pr_type;                /* socket tipi */        
	struct  domain *pr_domain;      /* domain protokolü */        
	short   pr_protocol;            /* protokol numarası */        
	short   pr_flags;/* protokol hookları */        
	pr_input_t *pr_input;           /* protokol için input */        
	pr_output_t *pr_output;         /* protokol için output */
	
	pr_ctlinput_t *pr_ctlinput;     /* control input */        
	pr_ctloutput_t *pr_ctloutput;   /* control output */        
	pr_usrreq_t     *pr_ousrreq;/* utility hookları*/       
	pr_init_t *pr_init;        pr_fasttimo_t *pr_fasttimo;     /* hızlı timeout(200 ms)*/        
	pr_slowtimo_t *pr_slowtimo;     /* yavaş timeout(500 ms) */        
	pr_drain_t *pr_drain;           /* mümkün olan fazlalıkları boşaltmak için */        
	struct  pr_usrreqs *pr_usrreqs; /* supersedes pr_usrreq() */
	
	};

```

Örneğin yukarıdaki **Structure**'yi bir **Rootkit** çok basit bir şekilde **Manipule** edebilmektedir yani düzenleyebilmektedir.

#### inetsw[] Switch Table

Her bir **İletişim Protokol**'unun **protosw** yapısı ```/sys/netinet/in_proto.c ``` dosyasında belirlenmiştir. Bu dosyadan bir parça :

![](https://resmim.net/f/DMcOWo.jpg)
![](https://resmim.net/f/tRVlcZ.jpg)

Bir **Rootkit**'in **İletişim Protokol**'leri ile manipulasyon senaryosuna girmemesi için hiçbir neden yok.

Düzenlemeler sonucunda **Protokol** değişimleri incelenebilir olucaktır.

Tabi bu değişiklikleri farkeden bazı **Yazılım**'lar mevcut olduğundan o **Yazılım**'ları atlatmanın yollarıda mevcuttur.

#### mbuf Structure

**Veri ve Kontrol Bilgisi** denilebilir kısaca **mbuf** yapısına.

Aynı zamanda **Network Data** yani **Ağ Verisi** için bir **Memory Buffer** yani **Ara Bellek**'tir.

Aşşağıdaki resimde bu **Yapı**'nın içeriklerini görebiliriz.

![](https://resmim.net/f/Lcus10.jpg)

İki **Communation Process** içerisinde geçen **Veri** ve **Kontrol** bilgisi bu **Yapı** yani **Structure** içerisinde tutulur.

Bu **Structure** yani **Yapı** ```<sys/mbuf.h>``` başlık dosyası içerisinde tanımlanmıştır.

Bu **Veri**'yi **Okumak** ya da **Düzenlemek** için **mbuf Structure** içerisinde bilmemiz gereken iki alan mevcuttur.

1. **m_len**
	* Bu alan **mbuf** içerisinde yer alan ***Veri Miktarı**'nı tutmaktadır.
2. **m_data**
	* Bu alan **mbuf** içerisinde bulunan **Veri**'yi tutar.

Aynı zamanda bir **Rootkit** içerisinde **Communication Protocol**'unu **Hook** etmek istersek bakmamız gereken ilk **Structure**'den biridir **mbuf**.

Yani daha da basit şekilde bir **Rootkit** istediği **İletişim Protokol**'u üzerinde değişiklik yapabilir yada bu **İletişim Protokol**'unun kullanıldığı yerdeki **Veri** akışını **Okuyabilir** ya da **Düzenleyebilir**.

## Kernel Process Tracing Nedir ?

Basit bir şekilde **Kernel** izleme ve hata ayıklama tekniğidir.

**Kernel Operasyon**'larına aşşağıdaki listede yazanları uygulayabiliriz.

* **Kayıt Altında Tutmak ( Logging )**
* **İzlemek, yolunu kesmek ( Intercept )**
* **Ayıklamak ( Debugging )**


Ftrace ile **Kernel**'i debug edip bunu yazıya döken bir ingiliz arkadaşımız : [Debugging the kernel using Ftrace ](https://jvns.ca/blog/2017/03/19/getting-started-with-ftrace/)

Bir **Rootkit**'in bu işlemi gerçekleştirmesinin sebebi musallat olacağı **Yazılım** varsa şayet o **Yazılım**'ın kullandığı **Sistem Çağrı**'larını bulup onlar için birer **Hook** yazmaktır.

![](https://resmim.net/f/TltHyI.jpg)

Daha önceki yazımda **getdirents** sistem çağrısını **Hook** edip **ls** komutundan **Dosya Gizleme**'yi anlatmıştım. Ve küçük bir **Rootkit** yazmıştık o yazımda. Eğer okumadıysanız bu yazıyı okumaya başlamadan önce aşşağıda listelediğim yazılarımı okuyun lütfen.

Çünkü bu yazıda çok **Teknik** detaya girmesemde bazılarımıza çok **Teknik** gelebilir o yüzden **0**'dan başlaması onun için iyi olacaktır.

Yazılarım :

* [LKM Development](https://blacknbunny.github.io/2019/04/22/loadable-kernel-module.html)
* [Linux Function Hooking](https://blacknbunny.github.io/2019/04/14/Linux-Function-Hooking.html)
* [Linux System Call Hooking](https://blacknbunny.github.io/2019/05/07/linux-system-call-hooking.html)

## Keystroke Logging

Basit bir şekilde **Sistem Çağrı**'sını **Hook** ederek **Klavye**'de basılan tuşların kayıtlarını tutabiliriz.

Örneğin **read** sistem çağrısını **Hook** ederek bu işe başlayabiliriz.

Bu **Sistem Çağrı**'sının **C Library** hali şöyle :

```
#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>

ssize_t
read(int fd, void *buf, size_t nbytes);
```

Bu **Sistem Çağrı**'sını kendi yazdığımız **Sahte Sistem Çağrı**'sı ile değiştirirsek şayet ne zaman **read** sistem çağrısı kullanılsa kullanıldığı yeri kaydet diyebiliriz **Rootkit**'imize.

**read** sistem çağrısı **nbytes** kısmından **Veri**'yi alıp bunu **buf** parametresine gönderir.

Bir **Klavye Tuş Vuruşu**'nu yakalamak için **buf** parametresinin **İçeriğini** kaydetmemiz gerekmektedir. Ne zaman **fd** parametresi **Standart Input**'a işaret eder örneğin (file descriptor 0) o zaman **Klavye Tuş Vuruş**'larını yakalayabiliriz demektir.

Aşşağıdaki **Kaynak Kod**'u **read** sistem çağrısını **Hook** edip **Klavye Tuş Vuruş**'larını **Kernel** içerisinde kaydetmek için yazılmıştır.

**read Sistem Çağrısı Hook** : [Pastebin](https://pastebin.com/9hGXGtKL)

Bu **Hook**'u sisteme **Load** ettikten yani **Yükledik**'ten sonra son durum :


```
login: root
Password:
Last login: Mon Feb 9 00:15:22 on ttyv2

root@vvmnx ~# dmesg | tail -n 32
r
o
o
t

s
i
f
r
e
```

Gördüğünüz gibi **Giriş Bilgi**'leri **Kernel** içerisinde kayıt altında tutuldu ve biz **Şifre**'yi bilmesekte göremesekte bu şekilde bulmuş olduk.

Basit bir şekilde **Keystroke Logging**'i gerçekleştirmek için yollardan biri olan **read** sistem çağrısını **Hook** ettik.

# Kernel Object Nedir ?

Bir **Kernel** yani **Çekirdek** geliştiriciye kendisinden birçok özellik sunmaktadır örneğin (Process, Socket, Thread, Mutex) vs... gibi.

**Object**'ler yani **Nesne**'lerde bunlardan biridir.

Bir **Kernel** nesnesi basitce bir **Memory Block**'tur. Yani bir **Structure** yani **Yapı** düşünün ve bu yapının içerisinde **Nesne** yani **Object** hakkında bilgilerin tutulduğunu. Ve bu bilgileri tutan birçok **Alan** olduğunu.

Örneğin **Object**'lere örnek olması için (ID, Process Object) gibi terimler gösterilebilir.

Yada daha güzel bir örnek olması için aşşağıdaki resme bakabiliriz :

![](https://resmim.net/f/4pgDMX.jpg)

Yukarıdaki liste **Windows İşletim Sistemi** içerisindeki **Nesne**'lerdir. Bu **Nesne**'lerin **Manipulasyon**'u mümkündür.

Bu **Manipulasyon** işlemi için aşşağıdaki başlığı inceleyelim.

## Direct Kernel Object Manipulation

Bu **Nesne**'leri **Direkt** olarak **Manipule** etmeye **Direct Kernel Object Manipulation** adı verilir.

Basitçe **Windows** için **Processes**, **Drivers**, **Files** ve **intermediate connection**'ları **Task Manager** ve **Event Scheduler**'den gizlemek içi bir **Rootkit** tekniğidir.

Kısaltması **DKOM**'dur ve ***DKOM**'un içerik listesi aşşağıdaki gibidir :

* **Hide process**
* **Hide drivers**
* **Hide ports**
* **Elevate privilege level of threads and processes**
* **Skew forensics**
* **Full control of system**

**Veri Yapı**'larını yani **Data Structure**'lerini **Manipule** edeceğimizden **DKOM** bize **Process**, **Driver**, **Port** gibi terimleri **İşletim Sistemi** içerisinde gizlememizi sağlayabilir.

İlk üçü bu şekilde. Diğerleri ise isimlerindende anlaşılabileceği gibi **Yetki Seviyesi Yükseltmek**, **Adli Tıp*, **Sistemin Tüm Kontrolu** gibi durumları baz alıyor.

**Data Structure**'lerini **Manipule** ederek **DKOM** sayesinde üstünden gelebileceğimiz çoğu şey böyle.

Daha da basit anlatırsam örneğin **EPROCESS Data Structure**'sini **DKOM** tekniği ile manipule etmek istersek şayet :

![](http://i159.photobucket.com/albums/t141/sovietweasel/plist.jpg)

Yukarıdaki **Data Structure**'deki **Forward link** ve **Back link** kısımlarını **Direkt** olarak **Manipule** edip bizim **Rootkit Process**'imizi **Task Manager** gibi **Process** görüntüleme araçlarından gizleyebiliyoruz.

Bazen **Hooking** tekniği işe yaramadığı zaman bir **Sistem**'de diğer **Rootkit** tekniklerini kullanmamız gerekebiliyor ve bu tekniklerden biride **DKOM**'dur.

Tabi bu kadar ile sınırlı değil. **DKOM**'un daha derinlerine inmek isteyenler ve tekniği çok daha yakından tanımak isteyenlerimiz varsa bir **Wikipedia** kaynağı bırakıyorum alta.

[Direct Kernel Object Manipulation (DKOM) wikipedia](https://en.wikipedia.org/wiki/Direct_kernel_object_manipulation)

# THE END

Bu yazımızında sonuna geldik.

Çok fazla detaya girmeden **Rootkit** serimizin ilk partını bitirdik.

**Part 2**'de daha da teknik detaya gireceğiz. Bir **Rootkit**'i başından sonuna nasıl geliştirebileceğimiz nelere dikkat etmemiz gerektiği gibi konulara ve daha bir çok teknik detaya değineceğiz.

Sorular için : [Twitter @0DAYanc](https://www.twitter.com/0DAYanc)