---
title: 'Hackfest2016: Quaoar - Walkthrough'
layout: post
---

<h1 style="color:red;">Bu yazı içerisindeki fotoraflar imgur.com sitesine yüklüdür ve bu site türkiyede engellidir fotorafları görmek için proxy kullanınız !</h1>

<p>Yeniden merhaba uzun bir süredir blog yazmıyordum yine google botlarına ayıp olmasın ve geride okuyabileceğim birşeyler bırakayım diye çözdüğüm vulnhub’u paylaşmak istedim.</p>

<p>Öncelikle vulnhub’u indirip kurduktan sonra bizi böyle bir ekran karşılıyor çok garipsedim bu ekranı nedenide şu vulnhub’u çözdükten sonra farkettim açılış penceresinde aslında kısaca neler yapılacak yazılmış onları görsem daha kolay ve kısa sürebilirdi aslında.Siz siz olun girişleri okuyun xD.</p>

<p><img src="http://i.imgur.com/FtBUx76.jpg" alt="" /></p>

<p>Bize verilen local ip’ye girdiğimiz’de bizi böyle bir ekran karşılıyor :</p>

<p><img src="http://i.imgur.com/FRDKDI1.jpg" alt="" /></p>

<p>Kaynak kodlarını ne kadar incelesemde resimlerden başka birşey çıkmadı, ikinci olarak klasik bir nmap taraması yaptım ve sonuçlar :</p>

<p><img src="http://i.imgur.com/EX1Mjtz.jpg" alt="" /></p>

<p>Çıkan sonuçlardaki versiyonlar’a yönelik bir sürü cve docsları var ama hemen onlarla uğraşmak istemedim.Eğer sonuç çıkmazsa yapacağım son şey olarak onu belirlemiştim, ama ondan önce bir dizin taraması yaptım dirbuster aracımızla :</p>

<p><img src="http://i.imgur.com/hSx0n5W.jpg" alt="" /></p>

<p>Ve aniden elime 2 koz geçti ya wordpress’ten yürüyecektim yada upload dizininden.Öncelikle kolaylık olsun diye upload dizinine baktım ama oradan birşey çıkartamadım, ve wordpress dizinine girdim :</p>

<p><img src="http://i.imgur.com/fvNpdyj.jpg" alt="" /></p>

<p>Bu şekilde bir sayfa bizi karşıladı klasik wordpress templatesi ve bir wikipedia linki, türkçe versiyonunu incelediğimde yeni bir bilgi öğrenmiştim ama hala vulnhub için elimde bir sonuç yoktu.</p>

<p>Ama sonuçta wordpress ve bizim wpscan aracımız var.Yapılan tarama sonucu</p>

<p><img src="http://i.imgur.com/2VZZQSo.jpg" alt="" /></p>

<p>Wpscan’ımız aynı zamanda userimizin default olduğunu söyledi. kullanıcı adı ve şifreyi “192.168.0.122/wordpress/wp-login”e girdiğimizde kendimizi içeride buluyorduk.</p>

<p><img src="http://i.imgur.com/3rfraYy.jpg" alt="" /></p>

<p>Artık geriye bash’imize erişmek kalıyor, ben template içinde 404.php’ye atmaya karar verdim shell’imi :</p>

<p><img src="http://i.imgur.com/oX7IiIa.jpg" alt="" /></p>

<p>Ve erişimimiz geldi :</p>

<p><img src="http://i.imgur.com/YWR9kOt.jpg" alt="" /></p>

<p>Bundan sonra yapmamız gereken root erişimini almak ve flagimizi bulmak.</p>

<p>Küçük bir ‘config.php’ araştırması ile root şifremize ulaşabilirdik. Araştırmada kullanılan komut :</p>

<div class="highlighter-rouge"><pre class="highlight"><code>find / -name "config.php"
</code></pre>
</div>

<p>Araştırma sonucu baştada bulduğumuz ‘/upload’ dizininden bir ‘config.php’ dosyası çıktı.</p>

<p><img src="http://i.imgur.com/AH4qBHs.jpg" alt="" /></p>

<p>İçini açtığımızda karşımıza “mysql database” şifreleri çıktı :</p>

<p><img src="http://i.imgur.com/vTEanP2.jpg" alt="" /></p>

<p>Merakıma yenik düşüp oradaki database şifresini root kullanıcımıza denemek istedim ama hiçbir sudo komutunu kabul etmedi :</p>

<p><img src="http://i.imgur.com/ZmurLHe.jpg" alt="" /></p>

<p>Küçük bir google aramasından sonra bu sorunun python’daki pty modülü ile kolayca çözülebileceğini öğrendim ama bunu yazmak için ne python’u açabiliyordum nede nano ve onun gibi editörleri çalıştırabiliyordum.</p>

<p><img src="http://i.imgur.com/daCoe30.jpg" alt="" /></p>

<p>Bu sorunuda echo ile /tmp(temporary) dizinine script kodlarımızı direkt yazarak çözdüm :</p>

<div class="highlighter-rouge"><pre class="highlight"><code>echo "import pty; pty.spawn('/bin/bash')" &gt; /tmp/fuckbody.py
</code></pre>
</div>

<p>Son olarak sadece script’imizi çalıştırmak ve şifremizi denemek vardı :</p>

<p><img src="http://i.imgur.com/c0hgjJd.jpg" alt="" /></p>

<p>Ve root’uz. Artık zaman flagimizi avlama zamanı.İlk olarak klasik home dizinine baktım ve 1. flagimiz oradaydı :</p>

<p><img src="http://i.imgur.com/7M4wLJx.jpg" alt="" /></p>

<p>1.Flag : 2bafe61f03117ac66a73c3c514de796e</p>

<p>Ama bir sorun vardı bu flag’in yetkilerine baktığımda normal bir userde görebiliyordu aynı zamanda (/home/admin) dizinlerede girebiliyor’du, bende farklı flag arayışlarına çıktım.İlk flagimiz “flag.txt” olduğuna göre  diğeride ya flag2.txt yada flag.txt diye başka bir dizinde olacaktı hiç uğraşmadan aşşağıdaki simple find command’ı yazıp iki farklı flagi’de aradım :</p>

<div class="highlighter-rouge"><pre class="highlight"><code>find / -name "flag2.txt" &amp;&amp; find / -name "flag.txt"
</code></pre>
</div>

<p>Ve /root dizinimizde bir flag daha bulduk :</p>

<p><img src="http://i.imgur.com/3DaO8pS.jpg" alt="" /></p>

<p>2.Flag : 8e3f9ec016e3598c5eec11fd3d73f6fb</p>

<p>Google botlarına teşekkürler iyi günler :)</p>