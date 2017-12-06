---
title: Mr-Robot Vulnhub - Walktrough
layout: post
---

<p>Merhaba arkadaşım.Görüşmeyeli uzun süre oldu :D<br />
<br />
neyse yazımıza geçelim.</p>

<p>uzun bir süredir blog’a yazı yazmıyorum buda iyi bir dönüş postu olur umarım.<br />
<br />
MR Robot vulnhub’unu indirmek isteyenler https://www.vulnhub.com/entry/mr-robot-1,151/ buradan indirebilir.<br />
<br />
Çözümüne geçelim öncelikle vulnhub’umuzu indirip kurduk.kurduktan sonra küçük bir arp-scan yapıp vulnhub’un ip’sini bulalım.<br /></p>
<div class="highlighter-rouge"><pre class="highlight"><code>arp-scan -l
</code></pre>
</div>
<p><br />
 
<img src="http://i.imgur.com/wdIjvLb.jpg" alt="" />
<br />
<br />
Vulnhub’un local ip’sini bulduk : 192.168.0.101</p>

<p>sonra vazgeçilmezimiz olan nmap’imiz ile bir tarayalım.<br />
<br />
<a href="https://4.bp.blogspot.com/-8F0YOOeY8s0/WRnvG4_TGAI/AAAAAAAAAYw/lCWzmhV62Ok2zRyyq-VkNIul39BjIYTFgCLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B20-38-17.png" imageanchor="1"><img border="0" height="180" src="https://4.bp.blogspot.com/-8F0YOOeY8s0/WRnvG4_TGAI/AAAAAAAAAYw/lCWzmhV62Ok2zRyyq-VkNIul39BjIYTFgCLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B20-38-17.png" width="320" /></a><br />
<br />
Çıkan portlara baktım 443 portundan birşey çıkmadı 80 zaten sitenin default yayın port’u nmapten birşey çıkartamadık.<br />
<br />
Siteye NİKTO ile bir dizin taraması yaptım sonucunda robots.txt’Ye ulaştım ve vulnhub’un wordpress kullandığını öğrendim duraklamadan direk robots.txt’yi açtım ve içinden 1. flagimiz ve bir wordlist dosyası çıktı.<br />
<br />
<br />
. <a href="https://1.bp.blogspot.com/-lQCa0_--qCc/WRnwWrnTTZI/AAAAAAAAAY0/qqnoeq_CF8cyJKDEvdoS56h2-5aZIL4yQCLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-15-13.png" imageanchor="1"><img border="0" height="180" src="https://1.bp.blogspot.com/-lQCa0_--qCc/WRnwWrnTTZI/AAAAAAAAAY0/qqnoeq_CF8cyJKDEvdoS56h2-5aZIL4yQCLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-15-13.png" width="320" /></a><br />
<br />
<br />
<a href="https://1.bp.blogspot.com/-oC4BVxS2y24/WRnykCe7qxI/AAAAAAAAAZA/dWHf3Q6SV5kBqmfg8cyvQhRZcQMubGCCACLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-24-32.png" imageanchor="1"><img border="0" height="180" src="https://1.bp.blogspot.com/-oC4BVxS2y24/WRnykCe7qxI/AAAAAAAAAZA/dWHf3Q6SV5kBqmfg8cyvQhRZcQMubGCCACLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-24-32.png" width="320" /></a><br />
<br /></p>
<ol>
  <li>flagimizi buldukta wordlist dosyası ne ayak diye bir geçiyor içimizden.<br />
<br />
Neyse diyip yolumuza devam edelim ne demiştik.<br />
<br />
Vulnhub wordpress kullanıyor duraklamadan direk sitenin kenarına /wp-login.php’mizi yazdık zaten nikto ile yaptığımız taramada url çıkmıştı.<br />
<br />
wordlist’imizde hazır vulnhub bağıra bağıra brute force deneyeceksin diyor ama sorun şu ki<br />
wordpress default userleri kabul etmiyor : admin,mrrobot vs.. gibi.<br />
<br />
Bu aşamadan sonra wpscan’ımıza sarıldık ve userimizi bulmaya çalıştık :<br />
wpscan –url http://192.168.0.101 –enumerate u<br />
<br />
<br />
 <a href="https://3.bp.blogspot.com/-aOAOoCyAD5g/WRnzQ9_swEI/AAAAAAAAAZI/3d_ZRFy6MBE_w6MiPMicHPXE2bA_u6J0wCLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-22-55.png" imageanchor="1"><img border="0" height="180" src="https://3.bp.blogspot.com/-aOAOoCyAD5g/WRnzQ9_swEI/AAAAAAAAAZI/3d_ZRFy6MBE_w6MiPMicHPXE2bA_u6J0wCLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-22-55.png" width="320" /></a><br />
<br />
ama nafile buradanda birşey çıkmadı.<br />
<br />
Ama sorun yok elimizde zaten bir wordlist var onu username yerine deniyip buldum elliot çıktı userimiz geriye password kaldı wordlistimizi password yerine verelim wpscan ile ve bize kalan şeyde beklemek olsun.<br />
<br />
wpscan –url 192.168.0.101 –wordlist fsocity.dic –username elliot<br />
<br />
<a href="https://2.bp.blogspot.com/-9JjCZwKWWzs/WRn0OOv4FyI/AAAAAAAAAZM/gev19W9bNGM4BqbJ1VABq39LCruViwJeQCLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-31-48.png" imageanchor="1"><img border="0" height="180" src="https://2.bp.blogspot.com/-9JjCZwKWWzs/WRn0OOv4FyI/AAAAAAAAAZM/gev19W9bNGM4BqbJ1VABq39LCruViwJeQCLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-31-48.png" width="320" /></a><br />
<br />
ve 2 saat sonunda şifremiz : ER28-0652 çıktı</li>
</ol>

<p>hemen wp-login.php’mize giriş yapalım.<br />
elliot &amp; ER28-0652 ile.<br />
<br />
<a href="https://4.bp.blogspot.com/-AHwGYfCCYJc/WRn1f5OA_aI/AAAAAAAAAZY/aLy68X27k7sWUgiz_B5klHxCpt4P9urdACLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-35-36.png" imageanchor="1"><img border="0" height="180" src="https://4.bp.blogspot.com/-AHwGYfCCYJc/WRn1f5OA_aI/AAAAAAAAAZY/aLy68X27k7sWUgiz_B5klHxCpt4P9urdACLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-35-36.png" width="320" /></a><br />
<br />
Girdik’ten sonra Appearance kısmından 404.php dosyasını editleyelim.<br />
<br />
Ben php reverse shell kullanıyorum burda.<br />
<br />
Buradan indirip kendi ip’niz ve portunuza göre editleyebilirsiniz siz : http://pentestmonkey.net/tools/web-shells/php-reverse-shell<br />
<br />
http://192.168.0.101/404.php urlimize girdikten sonra bir backconnect alıyoruz.<br />
<br />
<a href="https://1.bp.blogspot.com/-Yu0HYL8qd-0/WRn2D8fzFYI/AAAAAAAAAZc/A7IQ4k5E-M4pDBbX3bY7-DBth2S115YSACLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-38-33.png" imageanchor="1"><img border="0" height="180" src="https://1.bp.blogspot.com/-Yu0HYL8qd-0/WRn2D8fzFYI/AAAAAAAAAZc/A7IQ4k5E-M4pDBbX3bY7-DBth2S115YSACLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-38-33.png" width="320" /></a><br />
<br />
artık bizim yapmamız gereken diğer keyleri aramak.<br />
<br /></p>
<ol>
  <li>keyimizide bulduk zaten backconnectimiz bizi / dizininde başlattı oradan home’a girerek sonra userimizin dizinine girerek diğer keyimizide bulmuş olduk.<br />
<br />
Ama bir sorunumuz var key’e erişimimiz yok ve keyimizin altındada bir user ve şifrelenmiş bir MD5 dosyası var.<br />
<br />
 <a href="https://2.bp.blogspot.com/-QADMv1fcqVc/WRn21mcTpyI/AAAAAAAAAZg/IJPuA8Wkpjwj70HdG-PZYJB6TBaks7lhgCLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-41-50.png" imageanchor="1"><img border="0" height="180" src="https://2.bp.blogspot.com/-QADMv1fcqVc/WRn21mcTpyI/AAAAAAAAAZg/IJPuA8Wkpjwj70HdG-PZYJB6TBaks7lhgCLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-41-50.png" width="320" /></a><br />
<br />
muhtemelen root kullanıcısı : robot
ve şifrelenmiş MD5 ise robot userinin şifresi.<br />
<br />
Online MD5 decrypter’ler aracılığıyla şifreyi kırdım.<br />
<br />
<a href="https://4.bp.blogspot.com/-8VxRLtP4gIA/WRn3cRNu9WI/AAAAAAAAAZo/zdjVWs1qjlAo5BxbNsxbZXe8GudK4XahACLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-45-41.png" imageanchor="1"><img border="0" height="180" src="https://4.bp.blogspot.com/-8VxRLtP4gIA/WRn3cRNu9WI/AAAAAAAAAZo/zdjVWs1qjlAo5BxbNsxbZXe8GudK4XahACLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-45-41.png" width="320" /></a><br />
<br />
Şifremiz : abcdefghijklmnopqrstuvwxyz çıktı. Hemen robot kullanıcısına deneyelim şifreyi.<br />
<br />
python ile /bin/bash’e spawn olduk : python -c ‘import pty;pty.spawn(“/bin/bash”)’<br />
<br />
su robot diyip şifreyi verdik.<br />
<br />
 <a href="https://2.bp.blogspot.com/-yHByTQV1nbU/WRn4t2bdDuI/AAAAAAAAAZw/Q0kJ9lbJD3keZKkrw2IvMkdzomVt_6igACLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-50-38.png" imageanchor="1"><img border="0" height="180" src="https://2.bp.blogspot.com/-yHByTQV1nbU/WRn4t2bdDuI/AAAAAAAAAZw/Q0kJ9lbJD3keZKkrw2IvMkdzomVt_6igACLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-50-38.png" width="320" /></a><br />
<br />
Ve okuyamadığımız flagimizi robot kullanıcısı sayesinde okuduk.<br />
<br />
<a href="https://3.bp.blogspot.com/-ojiEelauMgQ/WRn5GIG6raI/AAAAAAAAAZ0/JXzWec3pEy0H8eof2fsMPznxuMocYU15ACLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B21-52-57.png" imageanchor="1"><img border="0" height="180" src="https://3.bp.blogspot.com/-ojiEelauMgQ/WRn5GIG6raI/AAAAAAAAAZ0/JXzWec3pEy0H8eof2fsMPznxuMocYU15ACLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B21-52-57.png" width="320" /></a><br />
<br /></li>
  <li>Flagimiz : 822c73956184f694993bede3eb39f959 çıktı.<br />
<br />
Şimdi geldik son flagi bulmaya.<br />
<br />
Root olmadığım için diğer flagi bulamadım uzun bir süre.<br />
<br />
Robot yetkisi ilede flage ulaşabilirmiyiz diye bir permission taraması yaptım 6000’e.<br />
<br />
<a href="https://3.bp.blogspot.com/-Pw15dsOF-pc/WRn7SmlE1nI/AAAAAAAAAZ8/JllmdVjKQ_AoPIqCJ109g35ZBU7PicvPQCLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B22-00-06.png" imageanchor="1"><img border="0" height="180" src="https://3.bp.blogspot.com/-Pw15dsOF-pc/WRn7SmlE1nI/AAAAAAAAAZ8/JllmdVjKQ_AoPIqCJ109g35ZBU7PicvPQCLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B22-00-06.png" width="320" /></a><br />
<br />
sistem üzerinde nmap kullanıldığını gördüm ve hemen sürümüne daldım çünkü bilinen bazı sürümlerde privilege escalation ortaya çıkıyordu.<br />
<br />
<a href="https://3.bp.blogspot.com/-kDZ8lDjYtuw/WRn7nQOFKdI/AAAAAAAAAaA/bmXHzRS9UMcFq4guvt-fNoEr2SMcS9DGQCLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B22-03-34.png" imageanchor="1"><img border="0" height="180" src="https://3.bp.blogspot.com/-kDZ8lDjYtuw/WRn7nQOFKdI/AAAAAAAAAaA/bmXHzRS9UMcFq4guvt-fNoEr2SMcS9DGQCLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B22-03-34.png" width="320" /></a><br />
<br />
nmap versiyonumuz 3.81 çıktı ve hemen google’ye sarıldım ve nmap te default root yetkisi veren bir parametreile karşılaştım.<br />
<br />
–interactive bu komut ile hemen sisteme bir flag taraması yaptırdım.<br />
<br />
Farkettiyseniz her flagte</li>
</ol>

<p>key-1-of-3.txt
key-2-of-3.txt</p>

<p>diye gidiyor her flag değerinde 3 ile karşılaştırılan farklı oluyor</p>

<p>son flagımızda 3. flagımız olduğuna göre ve root yetkisinide elimizde tuttuğumuza göre.<br />
<br />
sistemde / dizinine geçip : find / -name “key-3-of3.txt”</p>

<p>komutu ile son flagimizi arayalım.<br />
<br />
<a href="https://2.bp.blogspot.com/-lcATDS_D8HE/WRn9P00d5VI/AAAAAAAAAaI/pGJxzLbJScY3RhJOKV3oag7BR9WlDm4PwCLcB/s1600/Screenshot%2Bfrom%2B2017-05-15%2B22-10-42.png" imageanchor="1"><img border="0" height="180" src="https://2.bp.blogspot.com/-lcATDS_D8HE/WRn9P00d5VI/AAAAAAAAAaI/pGJxzLbJScY3RhJOKV3oag7BR9WlDm4PwCLcB/s320/Screenshot%2Bfrom%2B2017-05-15%2B22-10-42.png" width="320" /></a><br />
<br />
ve son flagimizide böylelikle buluyoruz. : 04787ddef27c3dee1ee161b21670b4e4</p>

<p>bir dahaki yazımda görüşürüz :)</p>