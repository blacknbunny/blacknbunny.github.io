---
title: CTF Canyoupwn.me Çözümleri
layout: post
---

<p>Merhaba arkadaşlar yine 3,4 hafta MR. ROBOT walktrough’tan sonra hiç birşey yazmadım onun telafisi ve google botlarına ayıp olmasın diye ctf.canyoupwn.me’nin hazırladığı çözdüğüm tüm ctf sorularının nasıl çözüldüğünü anlatan bir blog olacak bu.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-wQAdvE_ktCk/WS-7LC4CjSI/AAAAAAAAAoc/r6plFtC2wmMY17U0BV6HoXBZGfC8r-YPQCLcB/s1600/Screenshot_7.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="514" data-original-width="1041" height="158" src="https://4.bp.blogspot.com/-wQAdvE_ktCk/WS-7LC4CjSI/AAAAAAAAAoc/r6plFtC2wmMY17U0BV6HoXBZGfC8r-YPQCLcB/s320/Screenshot_7.png" width="320" /></a></div>
<p><br />
<br />
Şuan 8.’yim ctf leader board’ında.<br />
<br />
Toplam’da 58 soru çözdüm diğer soruları çözersem eklemeye devam edeceğim.<br />
<br />
ilk olarak bize 10 puan veren ve flaglerin nasıl yazılacağını gösteren bir forum var.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-iRmkXYsyWeA/WSobcVui1rI/AAAAAAAAAag/VoltzzNtzZ41LoM-GYSZIKNnbblstcOMwCLcB/s1600/Screenshot_2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="450" data-original-width="603" height="238" src="https://1.bp.blogspot.com/-iRmkXYsyWeA/WSobcVui1rI/AAAAAAAAAag/VoltzzNtzZ41LoM-GYSZIKNnbblstcOMwCLcB/s320/Screenshot_2.png" width="320" /></a></div>
<p><br />
Soruların çözümüne geçmeden önce canyoupwn.me ekibinin eline sağlık böyle güzel bir capture the flag projesini bize sundukları için.Bazı sorular bizi dertlendirdi(Gerçek anlamda kayahan şarkısı felan :D) bazı sorularda eğlendirdi şarkılarıyla.Çok güzel bir yarışma olmuş.Grafikleri ayrıca beğendim.<br />
<br />
Şimdi sorularımıza geçme zamanı Alttan üste doğru tüm çözümleri anlatmayı planlıyorum.<br />
Başlayalım.<br />
<br />
İlk sorumuz : There is not exist easier than this<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-9sX4L9z_90g/WSocWS5Vz9I/AAAAAAAAAao/tgV_22kqZ28Wy3wajw8mBjWwxj621gqQwCLcB/s1600/Screenshot_3.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="444" data-original-width="599" height="237" src="https://1.bp.blogspot.com/-9sX4L9z_90g/WSocWS5Vz9I/AAAAAAAAAao/tgV_22kqZ28Wy3wajw8mBjWwxj621gqQwCLcB/s320/Screenshot_3.png" width="320" /></a></div>
<p><br />
Bize bir google drive linki vermiş ekibimiz ben başta bir çok şekil şukul denesemde sonunda kendimi paintte resim dosyası ile parlaklık ayarlarını yaparken buldum parlaklığı en az’a çekip kontrastları yüksek yapınca flag gözüküyordu.<br />
<br />
1.sorumuz’un cevabı : cypwn_{cok_gizli}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-j3LSJv-VvBI/WSodLiBcTQI/AAAAAAAAAaw/O7I3g3gx5m8OXG5IK8Xfh4B1ygoUr3dNwCLcB/s1600/Screenshot_4.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="503" data-original-width="599" height="268" src="https://1.bp.blogspot.com/-j3LSJv-VvBI/WSodLiBcTQI/AAAAAAAAAaw/O7I3g3gx5m8OXG5IK8Xfh4B1ygoUr3dNwCLcB/s320/Screenshot_4.png" width="320" /></a></div>
<p><br />
<br />
2.sorumuza geçelim : Ava Giden Avlanır<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-ZZLxbDaL8m0/WSodkbjILSI/AAAAAAAAAa0/lnPibSfi2zsnYsS9NQrAAK28s_6GRu5rACLcB/s1600/Screenshot_5.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="444" data-original-width="599" height="237" src="https://2.bp.blogspot.com/-ZZLxbDaL8m0/WSodkbjILSI/AAAAAAAAAa0/lnPibSfi2zsnYsS9NQrAAK28s_6GRu5rACLcB/s320/Screenshot_5.png" width="320" /></a></div>
<p><br />
<br />
Sorumuz bize bir analiz.rar dosyası veriyor.<br />
<br />
unrar aracılığıyla dosyanın içini açtığımızda karşımıza “skype stelaeri” diye bir dosya çıkıyor bu dosyayı strings ile incelediğimde ise bir kaç flage benzeyen yazı buldum tek tek hepsini deneyince.<br />
<br />
2.sorumuz’un cevabını : cypwn_{capkin_hacker} olarak buluyoruz<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-cSMc9Z02rfc/WSofM0cu7tI/AAAAAAAAAbA/EWQP5Njyht4PqS34Q0Sm-whI3de-OdeoQCLcB/s1600/Screenshot_6.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="245" data-original-width="690" height="113" src="https://1.bp.blogspot.com/-cSMc9Z02rfc/WSofM0cu7tI/AAAAAAAAAbA/EWQP5Njyht4PqS34Q0Sm-whI3de-OdeoQCLcB/s320/Screenshot_6.png" width="320" /></a></div>
<p><br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-12sReZVdaJQ/WSofZdgLh7I/AAAAAAAAAbE/EYWqRomnGoAJpT7vrUy_clZzb05HfYx7gCLcB/s1600/Screenshot_7.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="134" data-original-width="276" src="https://2.bp.blogspot.com/-12sReZVdaJQ/WSofZdgLh7I/AAAAAAAAAbE/EYWqRomnGoAJpT7vrUy_clZzb05HfYx7gCLcB/s1600/Screenshot_7.png" /></a></div>
<p><br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-ycNjIoRPz7Q/WSofmtI1wFI/AAAAAAAAAbI/2kok-UDMQzsSp0lOv7H4AhL0KVhlPyPpgCLcB/s1600/Screenshot_8.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="509" data-original-width="600" height="270" src="https://3.bp.blogspot.com/-ycNjIoRPz7Q/WSofmtI1wFI/AAAAAAAAAbI/2kok-UDMQzsSp0lOv7H4AhL0KVhlPyPpgCLcB/s320/Screenshot_8.png" width="320" /></a></div>
<p><br />
<br />
<br />
3.sorumuza geçelim : Bir türüjan yazmışım moruk<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-UmKwA0d58nU/WSof9t1MctI/AAAAAAAAAbM/uNUQtDKOZu4wv5n0vDhe8fjpqjiUQ275ACLcB/s1600/Screenshot_9.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="444" data-original-width="598" height="237" src="https://4.bp.blogspot.com/-UmKwA0d58nU/WSof9t1MctI/AAAAAAAAAbM/uNUQtDKOZu4wv5n0vDhe8fjpqjiUQ275ACLcB/s320/Screenshot_9.png" width="320" /></a></div>
<p><br />
Bu sorumuzda ekibimiz bize bir “server.rar” dosyası veriyor indirmeye çalıştığımızda ise “chrome” arkadaşımız bize bas bas zararlı bu dosya diye bağırıyor zaten sorumuzun adındanda anlamıştık ne olduğunu :D<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-IljibLd270M/WSohPcu7prI/AAAAAAAAAbY/O940gy5oxaUX13xkUBcs7pcd7uCnZODtACLcB/s1600/Screenshot_10.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="50" data-original-width="305" src="https://1.bp.blogspot.com/-IljibLd270M/WSohPcu7prI/AAAAAAAAAbY/O940gy5oxaUX13xkUBcs7pcd7uCnZODtACLcB/s1600/Screenshot_10.png" /></a></div>
<p><br />
Bu dosyaya online “sandbox” yolu göründü baştan.İndirip “unrar” ile açtığımızda karşımıza “server.exe” isimli bir dosya geliyor.Bu dosyası “file” komutu ile incelediğimize “PE32 executable” dosya olduğunu söylüyor.Bunu hemen vazgeçilmezimiz “virustotal.com”a atıyoruz ve inceliyoruz.İncelerken bu dosyanın daha önceden tarandığını ve bakabileceğimizi söylüyor.<br />
<br />
Daha önceden taranan  “server.exe” dosyamızın ne olduğuna bakmaya çalışırken yorumlarada kaydı gözüm ve flagimiz oradaydı.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-mS0YLHNAhEM/WSoi32u_h-I/AAAAAAAAAbk/nVghukKo-2kBpd5pcNT2Lg--BXF3HzR4gCLcB/s1600/Screenshot_12.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="180" data-original-width="961" height="59" src="https://2.bp.blogspot.com/-mS0YLHNAhEM/WSoi32u_h-I/AAAAAAAAAbk/nVghukKo-2kBpd5pcNT2Lg--BXF3HzR4gCLcB/s320/Screenshot_12.png" width="320" /></a></div>
<p><br />
<br />
3.Sorumuz’un cevabı : cypwn_{capkinhacker.zapto.org}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-u14xV0JdHOs/WSojPkMsEvI/AAAAAAAAAbs/cuyJSU5FmGYL5lKezTp6ijtxkamjWAlBQCLcB/s1600/Screenshot_13.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="504" data-original-width="599" height="269" src="https://3.bp.blogspot.com/-u14xV0JdHOs/WSojPkMsEvI/AAAAAAAAAbs/cuyJSU5FmGYL5lKezTp6ijtxkamjWAlBQCLcB/s320/Screenshot_13.png" width="320" /></a></div>
<p><br />
4.Sorumuza geçelim : TV?<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-XaXooruyvT8/WSojiZYtg4I/AAAAAAAAAbw/Cfh9kclV_nExc8NmiB_cd1XJ88CtSdF0QCLcB/s1600/Screenshot_14.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="520" data-original-width="599" height="277" src="https://4.bp.blogspot.com/-XaXooruyvT8/WSojiZYtg4I/AAAAAAAAAbw/Cfh9kclV_nExc8NmiB_cd1XJ88CtSdF0QCLcB/s320/Screenshot_14.png" width="320" /></a></div>
<p><br />
Bu soruda baya kafa yordum ben.Sebebini az sonra öğrenicez zaten :D<br />
<br />
Öncelikle sorumuz : Hacı geçen canyoupwnme diye bir kanal gördüm onion pi den bahsediyordu, “bin”li bişeler vardı sanki..<br />
<br />
Sorudan dolayı ben hemen “canyoupwn.me” sitesine gittim ve arama bölümüne onion yazdım.Soruda “onion pi ile ilgili bahsediyordu” diyince ilk aklıma sitelerinde aramak geldi.<br />
<br />
Yazıyı baya inceledik’ten sonra sayfanın en altında değişik bir yazı gördüm ilk önce bunun “hash” olabileceğini düşündüm ama değildi.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-IJpgts2Xln0/WSokyW78SCI/AAAAAAAAAb8/h2exHmJCu4IMWtad95nvwmXRzPDY3rNUQCLcB/s1600/Screenshot_15.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="320" data-original-width="845" height="121" src="https://2.bp.blogspot.com/-IJpgts2Xln0/WSokyW78SCI/AAAAAAAAAb8/h2exHmJCu4IMWtad95nvwmXRzPDY3rNUQCLcB/s320/Screenshot_15.png" width="320" /></a></div>
<p><br />
<br />
Pastebin ile arkadaş grubumuzda birşeyler paylaşırken pastebin urlsinin son yazıları çok tanıdık geldi.<br />
<br />
TV? sorusunu tam bırakacakken bu pastebin urlsi yüzünden geri döndüm “onion pi kurulum” yazısına ve o yazıyı pastebinin yanina<br />
<br />
pastebin.com/xvtMaBkU<br />
<br />
olarak yerleştirdim ve flag karşımdaydı.Yazıda çok kolaymış gibi görünüyor ama belkide o pastebini o grupta paylaşmasam bu soruyu çözemeyip yerlerde sürünecektim :D şans işte.<br />
<br />
4.Sorumuz’un cevabı : cypwn_{h4ckm3}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-jlNEFaok90g/WSolfY5jOcI/AAAAAAAAAcE/jMriJq5hheAbMpYSn7rWwJHOGaraszlyQCLcB/s1600/Screenshot_16.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="578" data-original-width="600" height="308" src="https://3.bp.blogspot.com/-jlNEFaok90g/WSolfY5jOcI/AAAAAAAAAcE/jMriJq5hheAbMpYSn7rWwJHOGaraszlyQCLcB/s320/Screenshot_16.png" width="320" /></a></div>
<p><br />
5.Sorumuz’a geçelim : This is Anonymous job!<br />
<br />
Bu soruda merak sınırlarımı iyicebi zorladım hiç bitmeyen merakımı.<br />
<br />
5,6 kişi hariç bu soruyu çözen hiç kimse yok leaderboard’ta.<br />
<br />
İpucu : Selwyn Jamison`ın şirketi saldırıya uğramış parolalar leak olmuş..<br />
<br />
Baya bir uğraştım bu soru için sonunda Sorunun başlığını görünce google’de şöyle bir araştırma sergiledim.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-Px3IUq1Yl5k/WSonqoh0Z5I/AAAAAAAAAcY/RlxwKfQIV4M2rC28KuWTyexRAudRW85wwCLcB/s1600/Screenshot_18.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="663" data-original-width="1350" height="156" src="https://4.bp.blogspot.com/-Px3IUq1Yl5k/WSonqoh0Z5I/AAAAAAAAAcY/RlxwKfQIV4M2rC28KuWTyexRAudRW85wwCLcB/s320/Screenshot_18.png" width="320" /></a></div>
<p><br />
Bu soruda cidden terledim 1 saat ne yemek yedim ne birşey birde şişman adamım ben kalamıyorum öyle :D. Tam bayılıcam derken oradaki hashlere rastladım ve hash-identifier’e attım ama hiçbirşey çıkaramadım.Sonunda aceba hash’lardan birimi lan cevap dayanç ? diye sordum kendime ve yolumu ilk işaretlediğim hash ile buldum :D.<br />
<br />
5.Sorumuz’un cevabı : cypwn_{2dad125c0c244a8cad69951515ecdeb75b0b1daa}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-urNN5b8ebEU/WSooKWiW0dI/AAAAAAAAAcg/cz3SZIrprfseI8hNUOsjW54XVjdE2hfIgCLcB/s1600/Screenshot_19.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="578" data-original-width="599" height="308" src="https://4.bp.blogspot.com/-urNN5b8ebEU/WSooKWiW0dI/AAAAAAAAAcg/cz3SZIrprfseI8hNUOsjW54XVjdE2hfIgCLcB/s320/Screenshot_19.png" width="320" /></a></div>
<p><br />
6.Sorumuz’a geçelim : Social Media<br />
<br />
Bu soruda gerçek bir stalker olduğum kanısına vardım :D<br />
<br />
İlk aracımız tabiki google oldu ismi googlede araştırdığımızda ilk 3 linkte garip geliyor.Hepsini ben tek tek inceledim.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-6Od8ejlxOK4/WSoqAQCeMCI/AAAAAAAAAcs/BxrqNs3sW2sQQcj50Skh4_22UZ7gHrEZQCLcB/s1600/Screenshot_20.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="662" data-original-width="1353" height="156" src="https://4.bp.blogspot.com/-6Od8ejlxOK4/WSoqAQCeMCI/AAAAAAAAAcs/BxrqNs3sW2sQQcj50Skh4_22UZ7gHrEZQCLcB/s320/Screenshot_20.png" width="320" /></a></div>
<p><br />
<br />
2.ve 3. linkte bir “QR CODE” vardı.Yeni sekmede resim’i açıp online bir “QR CODE DECODER” ile flagimizi bulmuş olduk.<br />
<br />
Adımları ve hangi online decoder sitesini kullandığımı tek tek fotoraflar’dan görebilirsiniz.<br />
<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-Skkt05hkQyk/WSoqxVo7lII/AAAAAAAAAc8/h1Z0qRa359wApQ0W1iCevXGMCVtjppzJQCLcB/s1600/Screenshot_21.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="615" data-original-width="1238" height="158" src="https://3.bp.blogspot.com/-Skkt05hkQyk/WSoqxVo7lII/AAAAAAAAAc8/h1Z0qRa359wApQ0W1iCevXGMCVtjppzJQCLcB/s320/Screenshot_21.png" width="320" /></a></div>
<p><br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-5oJhVGUY8sE/WSoqxMnCAhI/AAAAAAAAAc0/igTB9blWrvQzWzWa9UkPYpAqS1tbQzJQwCLcB/s1600/Screenshot_22.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="628" data-original-width="940" height="213" src="https://4.bp.blogspot.com/-5oJhVGUY8sE/WSoqxMnCAhI/AAAAAAAAAc0/igTB9blWrvQzWzWa9UkPYpAqS1tbQzJQwCLcB/s320/Screenshot_22.png" width="320" /></a></div>
<p><br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-I6ysKi5Wo7Q/WSoqxQheLfI/AAAAAAAAAc4/nLuO2xM4qqkSVj2bzd1dNJ61mK4oex6bACLcB/s1600/Screenshot_23.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="610" data-original-width="1220" height="160" src="https://2.bp.blogspot.com/-I6ysKi5Wo7Q/WSoqxQheLfI/AAAAAAAAAc4/nLuO2xM4qqkSVj2bzd1dNJ61mK4oex6bACLcB/s320/Screenshot_23.png" width="320" /></a></div>
<p><br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-1KANq19DjXo/WSoqxiuWEoI/AAAAAAAAAdA/IF_greZJv203scVtqfuXdRrfjWNgjv2rwCLcB/s1600/Screenshot_24.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="397" data-original-width="1212" height="104" src="https://1.bp.blogspot.com/-1KANq19DjXo/WSoqxiuWEoI/AAAAAAAAAdA/IF_greZJv203scVtqfuXdRrfjWNgjv2rwCLcB/s320/Screenshot_24.png" width="320" /></a></div>
<p><br />
6.Sorumuz’un cevabı : cypwn_{Are_you_a_hacker_?}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-OAry--z4k1g/WSorKUOY5ZI/AAAAAAAAAdE/Bhd-ryrt74QXx8LzRp-R-zPL6Pupxt-SQCLcB/s1600/Screenshot_25.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="578" data-original-width="598" height="309" src="https://2.bp.blogspot.com/-OAry--z4k1g/WSorKUOY5ZI/AAAAAAAAAdE/Bhd-ryrt74QXx8LzRp-R-zPL6Pupxt-SQCLcB/s320/Screenshot_25.png" width="320" /></a></div>
<p><br />
7.Sorumuz’a geçelim : Nerd<br />
<br />
İpucu’muz : I need a source code for a domain. But I don’t know what is the domain name! search “ canyoupwn.me “<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-djE_yVkECDw/WSor33eP2zI/AAAAAAAAAdM/wqMZi_GzgMAvIX7fHaZX2t86yj3o9hCFwCLcB/s1600/Screenshot_27.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="473" data-original-width="598" height="253" src="https://3.bp.blogspot.com/-djE_yVkECDw/WSor33eP2zI/AAAAAAAAAdM/wqMZi_GzgMAvIX7fHaZX2t86yj3o9hCFwCLcB/s320/Screenshot_27.png" width="320" /></a></div>
<p><br />
Bu soruya anlam veremedim ben ve yine google’ye sarıldım.<br />
<br />
İpucumuz’da “canyoupwn.me” domainimiz için kaynak kodu aramamız gerekiyor.İpucumuzdaki keywordleri birleştirerek bir google araştırması sergiledim ve 1. URL’mizin açıklamasında source code arayabileceğimiz yazıyordu.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-sjQmrTMEgbA/WSosU41L5TI/AAAAAAAAAdQ/R2ylTl_npjkDuifiQt5LArkWJwK23SqpwCLcB/s1600/Screenshot_26.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="654" data-original-width="1365" height="153" src="https://2.bp.blogspot.com/-sjQmrTMEgbA/WSosU41L5TI/AAAAAAAAAdQ/R2ylTl_npjkDuifiQt5LArkWJwK23SqpwCLcB/s320/Screenshot_26.png" width="320" /></a></div>
<p><br />
Siteye girdiğimizde bizi böyle bir ekran karşıladı.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-irqY0FZkvaQ/WSoshfSwx8I/AAAAAAAAAdU/qISGeBjMBZsuixxWpezJrnMnYyEuMlqpwCLcB/s1600/Screenshot_28.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="690" data-original-width="1241" height="177" src="https://2.bp.blogspot.com/-irqY0FZkvaQ/WSoshfSwx8I/AAAAAAAAAdU/qISGeBjMBZsuixxWpezJrnMnYyEuMlqpwCLcB/s320/Screenshot_28.png" width="320" /></a></div>
<p><br />
Hemen arama bölümüne “canyoupwn.me” yazdım ve bu seferde farklı bir domain çıktı başlık olarak.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-uZVDHIEOMNg/WSosxrrXxeI/AAAAAAAAAdY/876UYoYzZ-8wdRkk0rn8Lq2Zz-N3iVDyACLcB/s1600/Screenshot_29.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="656" data-original-width="1351" height="155" src="https://4.bp.blogspot.com/-uZVDHIEOMNg/WSosxrrXxeI/AAAAAAAAAdY/876UYoYzZ-8wdRkk0rn8Lq2Zz-N3iVDyACLcB/s320/Screenshot_29.png" width="320" /></a></div>
<p><br />
Aceba flag’imiz bu domain olabilirmi diye bir deneme yaptıııııık yapış o yapış.<br />
<br />
7.Sorumuz’un cevabı : cypwn_{erdemoflaz.com}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-0ilv8N1A7JI/WSotFG_krtI/AAAAAAAAAdc/zf6nt68D5hs9l6gh48vdbQfG6ihXKXyKQCLcB/s1600/Screenshot_30.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="530" data-original-width="599" height="283" src="https://4.bp.blogspot.com/-0ilv8N1A7JI/WSotFG_krtI/AAAAAAAAAdc/zf6nt68D5hs9l6gh48vdbQfG6ihXKXyKQCLcB/s320/Screenshot_30.png" width="320" /></a></div>
<p><br />
8.Sorumuz’a geçelim : Secret<br />
<br />
İpucumuz : secret.canyoupwn.me<br />
<br />
İpucunda verilen web siteye girdiğimizde hiçbir türlü cevap gelmiyor server’den.Dns adresi bulunamadı diyor.Bizde hemen bir “DNS KAYIT” lookup’u yapıyoruz.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-rXIW3-zw0Lo/WSo014z0b8I/AAAAAAAAAds/PMSHe5aVitA_qxO3VxGPmCbLe6efPUb6ACLcB/s1600/Screenshot_31.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="430" data-original-width="1238" height="111" src="https://1.bp.blogspot.com/-rXIW3-zw0Lo/WSo014z0b8I/AAAAAAAAAds/PMSHe5aVitA_qxO3VxGPmCbLe6efPUb6ACLcB/s320/Screenshot_31.png" width="320" /></a></div>
<p><br />
Ve işte flag karşımızda.<br />
<br />
8.Sorumuz’un cevabı : cypwn_{kks271723jjjasd9asd771239}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-FX_YMj9UW5k/WSo1EQe-m0I/AAAAAAAAAdw/5BhgTT3YIjYHd5ujby8KlMqeL1cFk2tKgCLcB/s1600/Screenshot_32.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="537" data-original-width="599" height="286" src="https://3.bp.blogspot.com/-FX_YMj9UW5k/WSo1EQe-m0I/AAAAAAAAAdw/5BhgTT3YIjYHd5ujby8KlMqeL1cFk2tKgCLcB/s320/Screenshot_32.png" width="320" /></a></div>
<p><br />
9.Sorumuz’a geçelim : xCyberx<br />
<br />
İpucumuz uzun olduğu için buraya yazmıyorum resimden bakabilirsiniz.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-BX7XPnEJ_p8/WSo1i4aYf8I/AAAAAAAAAd0/moOIbSweBaMW0jFi-OdpMsM1Nr2wf64GgCLcB/s1600/Screenshot_33.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="661" data-original-width="590" height="320" src="https://4.bp.blogspot.com/-BX7XPnEJ_p8/WSo1i4aYf8I/AAAAAAAAAd0/moOIbSweBaMW0jFi-OdpMsM1Nr2wf64GgCLcB/s320/Screenshot_33.png" width="285" /></a></div>
<p><br />
Bu soruda biraz zorlandım bir kaç pdf okumak zorunda bile kaldım :D<br />
<br />
sonunda bir ctf’te uygulanan “steghide” tekniğine baktım uzun araştırmalar sonucu.<br />
<br />
ctf’te resim dosyasının içinden dosya çıkartabiliyorlardı ama bizim dosyamızda biraz farklı oldu çıkarttığımız dosya bizden bir şifre istedi.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-fbM8uGZFmtk/WSo3OU0lWxI/AAAAAAAAAeA/jXTz-KauMWM6JSmUXwziCsiquR2ryReAACLcB/s1600/Screenshot_34.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="187" data-original-width="823" height="72" src="https://4.bp.blogspot.com/-fbM8uGZFmtk/WSo3OU0lWxI/AAAAAAAAAeA/jXTz-KauMWM6JSmUXwziCsiquR2ryReAACLcB/s320/Screenshot_34.png" width="320" /></a></div>
<p><br />
Şifre olarak soru başlığımız olabileceğini düşündüm ve “xcyberx” olarak girdim şifreyi ama başarısız oldum.Farklı kombinasyonlar denerken “xcyberx” ile ilgili şifrenin “cyberx” olduğunu buldum ve resim dosyamızı “steghide” ile açtıktan sonra içinden “hint.txt” diye bir dosya çıktı ve onun içindende bir “yandex dosya” url’si çıktı.<br />
<br />
Bu urlye gittiğimizde içinden bir “QR CODE” gördük ve yine decoder’imize sarıldık.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-7MQBwgJi6YU/WSo4CFqWA_I/AAAAAAAAAeI/VjQoFnMTTb8HpBmIUaSsuFRA2lmDTHg2QCLcB/s1600/Screenshot_35.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="695" data-original-width="1207" height="184" src="https://2.bp.blogspot.com/-7MQBwgJi6YU/WSo4CFqWA_I/AAAAAAAAAeI/VjQoFnMTTb8HpBmIUaSsuFRA2lmDTHg2QCLcB/s320/Screenshot_35.png" width="320" /></a></div>
<p><br />
<br />
Bu “QR CODE”u decode ettiğimizde karşımıza böyle birşey geldi.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-Fj_S6IqcOF0/WSo4UHglOdI/AAAAAAAAAeM/DYEacm3XT6ky46SaZ8K2pdpH3yJyTSQXwCLcB/s1600/Screenshot_36.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="697" data-original-width="1243" height="179" src="https://4.bp.blogspot.com/-Fj_S6IqcOF0/WSo4UHglOdI/AAAAAAAAAeM/DYEacm3XT6ky46SaZ8K2pdpH3yJyTSQXwCLcB/s320/Screenshot_36.png" width="320" /></a></div>
<p>İşaretlediğim yerlerdeki hashlere baktığınızda base64 olduğunu görebilirsiniz bunu base64decoder ile decode ettiğimizde.Karşımıza böyle bir hash geliyor.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-zgPjUscp_Uo/WSo4pNKwInI/AAAAAAAAAeQ/XhoXoGfwL6EUMBctS9xNoHldznD0bH5yQCEw/s1600/Screenshot_37.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="659" data-original-width="1213" height="173" src="https://4.bp.blogspot.com/-zgPjUscp_Uo/WSo4pNKwInI/AAAAAAAAAeQ/XhoXoGfwL6EUMBctS9xNoHldznD0bH5yQCEw/s320/Screenshot_37.png" width="320" /></a></div>
<p><br />
Bunun bir “ROT” olduğunu kolaylıkla anladık tabi hemen “ROT DECODER”imize sarılıp.Karşımıza bu karmaşık yazıları dizdik.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-cHXWYL2pGt8/WSo5M-rtEsI/AAAAAAAAAeY/IDFclyNE3ywOtFIF2dRpR0sybsQxTMrNACLcB/s1600/Screenshot_38.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="541" data-original-width="638" height="271" src="https://4.bp.blogspot.com/-cHXWYL2pGt8/WSo5M-rtEsI/AAAAAAAAAeY/IDFclyNE3ywOtFIF2dRpR0sybsQxTMrNACLcB/s320/Screenshot_38.png" width="320" /></a></div>
<p>Değerler flag’e benzediği için bizim flag başlangıç türümüzü “CTRL + F” ile aradım “cypwn_{}”.<br />
<br />
Ve flagimizi bu şekilde bulduk.<br />
<br />
9.Sorumuz’un cevabı : cypwn_{g00d_j0B_Br0<em>y0u</em>@r3_@_h@ck3R}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-2o3lwE7bcdg/WSo5vPEnfxI/AAAAAAAAAeg/7Ch5prDQQqMzY2jR2v2hRmYmXff0vOB0gCLcB/s1600/Screenshot_39.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="657" data-original-width="599" height="320" src="https://1.bp.blogspot.com/-2o3lwE7bcdg/WSo5vPEnfxI/AAAAAAAAAeg/7Ch5prDQQqMzY2jR2v2hRmYmXff0vOB0gCLcB/s320/Screenshot_39.png" width="291" /></a></div>
<p><br />
10.Sorumuz’a geçelim : Mail<br />
<br />
İpucu : Bu canyoupwn.me mailleri nerede barındırıyor acaba?<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-Ka-p9wQqP2E/WSrrylORZ0I/AAAAAAAAAew/0RPsO3CT4vsfsrgiDTra8KUkevpDtOgcQCLcB/s1600/Screenshot_1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="500" data-original-width="598" height="267" src="https://2.bp.blogspot.com/-Ka-p9wQqP2E/WSrrylORZ0I/AAAAAAAAAew/0RPsO3CT4vsfsrgiDTra8KUkevpDtOgcQCLcB/s320/Screenshot_1.png" width="320" /></a></div>
<p>Bu soruyu görünce aklımıza “dig” gelmiyor değil online bir web sitedende yapabiliriz ama biz “dig” ile ilerleyelim.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-ybId_GwS3yk/WSrsVl5VO_I/AAAAAAAAAe4/3BMCPiRS1Kc4C60jdvodgRB4rHejOtOWgCLcB/s1600/Screenshot_2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="388" data-original-width="684" height="181" src="https://2.bp.blogspot.com/-ybId_GwS3yk/WSrsVl5VO_I/AAAAAAAAAe4/3BMCPiRS1Kc4C60jdvodgRB4rHejOtOWgCLcB/s320/Screenshot_2.png" width="320" /></a></div>
<p><br />
“dig” ile mx taraması yaptığımız’da mail server olarak karşımıza “mx.yandex.net” çıkıyor.Bu olabilirmi diye deniyoruz cevabımızı ve bu soruyuda böylelikle geçmiş oluyoruz.<br />
<br />
10.Sorumuz’un cevabı : cypwn_{mx.yandex.net}<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-ZaWbX7OMlbc/WSrsoxVy-sI/AAAAAAAAAe8/L4Q1W82lwp0eqmCpqHqAvprWE_bYVgR5ACLcB/s1600/Screenshot_3.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="556" data-original-width="597" height="298" src="https://1.bp.blogspot.com/-ZaWbX7OMlbc/WSrsoxVy-sI/AAAAAAAAAe8/L4Q1W82lwp0eqmCpqHqAvprWE_bYVgR5ACLcB/s320/Screenshot_3.png" width="320" /></a></div>
<p><br />
11.Sorumuz’a geçelim : NS<br />
<br />
İpucu : canyoupwn.me ‘nin nameserverlarından birisi?<br />
<br />
İpucumuz açık açık belirtti ne istediğini bizede online veya toollardan birini kullanarak çıkan nameserverleri denemek düşüyor.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-McC_DDf5Gjg/WSrtdtkA9TI/AAAAAAAAAfE/DqE321j3p0gSY_VMDEQSZbW10GzQH2GTwCLcB/s1600/Screenshot_4.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="354" data-original-width="540" height="209" src="https://4.bp.blogspot.com/-McC_DDf5Gjg/WSrtdtkA9TI/AAAAAAAAAfE/DqE321j3p0gSY_VMDEQSZbW10GzQH2GTwCLcB/s320/Screenshot_4.png" width="320" /></a></div>
<p><br />
Online herhangi bir nameserver checker’den bu işlemi yapınca 2 tane “cloudflare” nameserver’i geliyor 1.’si flagimizin cevabı çıktı.<br />
<br />
11.Sorumuz’un cevabı : cypwn_{ada.ns.cloudflare.com}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-j8VIKWJUEXo/WSrt-BvEwLI/AAAAAAAAAfM/TZX2RdkRAM4nSQH-W2LVM14rzgQwWQBygCLcB/s1600/Screenshot_5.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="561" data-original-width="599" height="299" src="https://3.bp.blogspot.com/-j8VIKWJUEXo/WSrt-BvEwLI/AAAAAAAAAfM/TZX2RdkRAM4nSQH-W2LVM14rzgQwWQBygCLcB/s320/Screenshot_5.png" width="320" /></a></div>
<p><br />
12.Sorumuz’a geçelim : Cyrpto Die<br />
<br />
İpucumu : Rardaki dosyayı açarak dosyayı incelememize yardımcı olmalısın.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-6imJePb-0fI/WSruNY_bzYI/AAAAAAAAAfQ/tIACFRumUaoERlLtVx5NDCZwvrvh1YzQgCLcB/s1600/Screenshot_6.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="539" data-original-width="601" height="286" src="https://2.bp.blogspot.com/-6imJePb-0fI/WSruNY_bzYI/AAAAAAAAAfQ/tIACFRumUaoERlLtVx5NDCZwvrvh1YzQgCLcB/s320/Screenshot_6.png" width="320" /></a></div>
<p><br />
Bu soru biraz değişik geçti benim için.<br />
<br />
Sorumuz’un açıklamasında verilen link’ten bir “ctf_canyoupwnme.rar” dosyası indiriyoruz.<br />
bu dosya’yı açtığımız’da içinden “canyoupwnme.rar” ve bir “password.txt” dosyası çıkıyordu.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-5IhgO1CSoB8/WSrvG18FSQI/AAAAAAAAAfY/L6O79EjwWyskdkUxzU6RBr_Bk0MicLQpgCLcB/s1600/Screenshot_7.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="296" data-original-width="717" height="132" src="https://1.bp.blogspot.com/-5IhgO1CSoB8/WSrvG18FSQI/AAAAAAAAAfY/L6O79EjwWyskdkUxzU6RBr_Bk0MicLQpgCLcB/s320/Screenshot_7.png" width="320" /></a></div>
<div class="separator" style="clear: both; text-align: center;">
<br /></div>
<p>Hash’imiz “MD5” çıkıyor online bir “MD5 Decrypter” ile bu hash’i çözdüğümüzde karşımıza “<b style="background-color: #0e0e0e; color: limegreen; font-family: Abel, sans-serif; font-size: 18px; text-align: center;">eHh4eHh4</b>” isimli bir yazı geliyor.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-wDOr5sebUTM/WSrvt6dU7TI/AAAAAAAAAfg/vJ_iN9b1w2YSd9nR5epxHO7kDo7m7gYOACLcB/s1600/Screenshot_8.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="646" data-original-width="1338" height="154" src="https://3.bp.blogspot.com/-wDOr5sebUTM/WSrvt6dU7TI/AAAAAAAAAfg/vJ_iN9b1w2YSd9nR5epxHO7kDo7m7gYOACLcB/s320/Screenshot_8.png" width="320" /></a></div>
<p><br />
Bu çıkan sonuçtaki yazı base64 çıkıyor ve bu base64 hash’ini online bir web sitede decode ettiğimizde karşımıza “xxxxxx” isimli bir yazı geliyor.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-iih8hFUPluE/WSrwF3yU9zI/AAAAAAAAAfk/_vOScyAix88UOx-QpicR7rpEgH5udtqOACLcB/s1600/Screenshot_9.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="542" data-original-width="1031" height="168" src="https://1.bp.blogspot.com/-iih8hFUPluE/WSrwF3yU9zI/AAAAAAAAAfk/_vOScyAix88UOx-QpicR7rpEgH5udtqOACLcB/s320/Screenshot_9.png" width="320" /></a></div>
<p><br />
Aceba bu “password.txt”den önce gelen rar’ın şifresi olabilirmi diye bir deniyoruz.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-ikQo1Szad9s/WSrwbm6LjOI/AAAAAAAAAfo/gS7Xzda51-shHvDBnetrBgtlgNN-JW3pwCLcB/s1600/Screenshot_10.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="290" data-original-width="914" height="101" src="https://3.bp.blogspot.com/-ikQo1Szad9s/WSrwbm6LjOI/AAAAAAAAAfo/gS7Xzda51-shHvDBnetrBgtlgNN-JW3pwCLcB/s320/Screenshot_10.png" width="320" /></a></div>
<p><br />
Veee flag karşımızda.<br />
<br />
12.Sorumuz’un cevabı : cypwn_{ctf_akiyo_mansallah}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-eddJ3KH72fI/WSrwrpqS9QI/AAAAAAAAAfs/9tfM6TJqJhwapV2qLHxltl6eABtIViHhwCLcB/s1600/Screenshot_11.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="599" data-original-width="598" height="320" src="https://4.bp.blogspot.com/-eddJ3KH72fI/WSrwrpqS9QI/AAAAAAAAAfs/9tfM6TJqJhwapV2qLHxltl6eABtIViHhwCLcB/s320/Screenshot_11.png" width="319" /></a></div>
<p><br />
13.Sorumuz’a geçelim : Memory Dump<br />
<br />
İpucumuz : Ram Imajından flag ı çıkart.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-shj3-wkrsIg/WSr0aQW_cPI/AAAAAAAAAf4/Lv4nyXQ9fF0NFgsoyRGcLyMvW__A548LgCLcB/s1600/Screenshot_12.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="538" data-original-width="596" height="288" src="https://3.bp.blogspot.com/-shj3-wkrsIg/WSr0aQW_cPI/AAAAAAAAAf4/Lv4nyXQ9fF0NFgsoyRGcLyMvW__A548LgCLcB/s320/Screenshot_12.png" width="320" /></a></div>
<p><br />
Sorun’un ipucundanda bize gelen “rar” dosyasının bir ram imajı olduğunu açık açık belirtiyor herhangi bir ram imaj analizi yapan bir tool ile bu işi kolayca halledebiliriz.Ben “volatility” kullanıyorum bunu çözmek için.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-gVTI6dip_RE/WSr126xfJYI/AAAAAAAAAgE/pWDYrQuY-fM9y2Mboh8dVFzsnXl6xdk5gCLcB/s1600/Screenshot_13.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="335" data-original-width="744" height="143" src="https://2.bp.blogspot.com/-gVTI6dip_RE/WSr126xfJYI/AAAAAAAAAgE/pWDYrQuY-fM9y2Mboh8dVFzsnXl6xdk5gCLcB/s320/Screenshot_13.png" width="320" /></a></div>
<p><br />
Unrar ile rar dosyamızın içinden çıkardığımız “canyoupwnme.mem” dosyasını resimde gördüğünüz parametreler ile açtığımızda karşımıza “FLG : Y3lwd25fe21lbW9fZmxhZ19idWx1bmR1fQ==” isimli base64lü bir hash geliyor.Online bir web sitede decode ettiğimizde flage ulaşıyoruz.<br />
<br />
<br />
13.Sorumuz’un cevabı : cypwn_{memo_flag_bulundu}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-8awrU85wFpw/WSr2ZJyU8BI/AAAAAAAAAgM/VWW9zl_5n3kdPTGAKmdoK6PZd_kSayNrQCLcB/s1600/Screenshot_14.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="597" data-original-width="594" height="320" src="https://4.bp.blogspot.com/-8awrU85wFpw/WSr2ZJyU8BI/AAAAAAAAAgM/VWW9zl_5n3kdPTGAKmdoK6PZd_kSayNrQCLcB/s320/Screenshot_14.png" width="318" /></a></div>
<p><br />
14.Sorumuz’a geçelim : L-P<br />
<br />
İpucumuz : Parolayı bul<br />
<br />
Bu soru benim için biraz karmaşık oldu.Öncelikle verilen “rar” linkinden dosyamızı indiriyoruz.<br />
<br />
Herzamanki gibi “unrar e findpassword.rar” yazarak dosyamızı açıyoruz.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-jkvW6qyaiw0/WSr9GinzffI/AAAAAAAAAgc/nz9esSBhZj4-k8J3IIz0-r7BJoAddByLACLcB/s1600/Screenshot_2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="307" data-original-width="795" height="123" src="https://1.bp.blogspot.com/-jkvW6qyaiw0/WSr9GinzffI/AAAAAAAAAgc/nz9esSBhZj4-k8J3IIz0-r7BJoAddByLACLcB/s320/Screenshot_2.png" width="320" /></a></div>
<p><br />
İndirdikten sonra “file” komutumuz ile dosyamızın ne olduğunu inceliyoruz ve bize “MİNİDUMP Crash Report Data” olduğunu söylüyor.Daha önceden “mimikatz” kullanan varsa aranızda anlamıştır olayı zaten :D<br />
<br />
Windows için “mimikatz” indirmek için : https://github.com/gentilkiwi/mimikatz/releases/tag/2.1.1-20170508<br />
<br />
“findpassword” dosyamızı mimikatz’ın içine atıyoruz.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-RfkL0vnoCrA/WSr91DJURxI/AAAAAAAAAgk/igjEhwiLRxMcl8AXElNirheZ_lPvOwFlgCLcB/s1600/Screenshot_3.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="385" data-original-width="644" height="191" src="https://1.bp.blogspot.com/-RfkL0vnoCrA/WSr91DJURxI/AAAAAAAAAgk/igjEhwiLRxMcl8AXElNirheZ_lPvOwFlgCLcB/s320/Screenshot_3.png" width="320" /></a></div>
<p>Attıktan sonra mimikatz’ı çalıştırıp “findpassword” dosyamızı seçip tüm password’leri dump etmesini şu parametreler ile sağlıyoruz :<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-gNkcnuPp_IM/WSr_JQvERNI/AAAAAAAAAgw/vE77q1_KPbw_AXBfiPKINzFL4_BSaHvTgCLcB/s1600/Screenshot_4.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="356" data-original-width="891" height="127" src="https://3.bp.blogspot.com/-gNkcnuPp_IM/WSr_JQvERNI/AAAAAAAAAgw/vE77q1_KPbw_AXBfiPKINzFL4_BSaHvTgCLcB/s320/Screenshot_4.png" width="320" /></a></div>
<p><br />
“findpassword MİNİ DUMP” dosyamızın içindeki “login passwordleri” çıkardığımızda ahmet gürel kullanıcısı için bir çok password türü çıkıyor deneyip yanıldıktan sonra asıl “flag” cevabımızın ahmet gürel kullanıcısının şifresi olan “canyoupwnmectf” olduğunu buluyoruz.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-zlD7UoEs-eI/WSr_d1wi89I/AAAAAAAAAg0/3DCUgjRO46cgNlHOLWSralY0MMIb6cGUACLcB/s1600/Screenshot_1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="498" data-original-width="941" height="169" src="https://2.bp.blogspot.com/-zlD7UoEs-eI/WSr_d1wi89I/AAAAAAAAAg0/3DCUgjRO46cgNlHOLWSralY0MMIb6cGUACLcB/s320/Screenshot_1.png" width="320" /></a></div>
<p><br />
14.Sorumuz’un cevabı : cypwn_{canyoupwnmectf}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-1WQPlIa5sf4/WSr_w5vFfKI/AAAAAAAAAg4/EKO_8OjszO4E4PoW978A7FfQc6ofCALqgCLcB/s1600/Screenshot_5.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="594" data-original-width="598" height="317" src="https://4.bp.blogspot.com/-1WQPlIa5sf4/WSr_w5vFfKI/AAAAAAAAAg4/EKO_8OjszO4E4PoW978A7FfQc6ofCALqgCLcB/s320/Screenshot_5.png" width="320" /></a></div>
<p><br />
15.Sorumuz’a geçelim : Attack Type<br />
<br />
İpucumuz : Pcap dosyasında bir saldırı gerçekleşmektedir.Hangi zafiyet exploit edilmeye çalışılmıştır?<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-90xL554JrOU/WSssrEvDjHI/AAAAAAAAAhI/Z8LqbCFyYawxFsL6Uw-irDiSdm6Y06DkQCLcB/s1600/Screenshot_6.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="568" data-original-width="598" height="303" src="https://2.bp.blogspot.com/-90xL554JrOU/WSssrEvDjHI/AAAAAAAAAhI/Z8LqbCFyYawxFsL6Uw-irDiSdm6Y06DkQCLcB/s320/Screenshot_6.png" width="320" /></a></div>
<p><br />
İndirdiğimiz “rar” dosyasından bir adet .pcap dosyası çıktı ve gözümüz wireshark’a kaydı başlayalım incelemeye.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-3Ci0vdqM_0I/WSstO5t0DtI/AAAAAAAAAhQ/E_Zzmu3TeasMmpsxNNvE7zcn83H_p8wogCLcB/s1600/Screenshot_7.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="718" data-original-width="1361" height="168" src="https://3.bp.blogspot.com/-3Ci0vdqM_0I/WSstO5t0DtI/AAAAAAAAAhQ/E_Zzmu3TeasMmpsxNNvE7zcn83H_p8wogCLcB/s320/Screenshot_7.png" width="320" /></a></div>
<p><br />
Çoğu paket’ten smb portları gözüktü microsoft-ds portları gözüktü azıcık bir gözümüz açıldı.<br />
<br />
Ama wireshark ile birşey bulamadık biz birde “NetworkMiner” aracı ile göz atalım ama bir sorunumuz var “NetworkMiner” sadece .pcap dosyalarını kabul ediyor bize gelen dosya .pcapng bunu .pcap yapmamız gerek yada para verip”NetworkMiner”in sürümünü yükseltmemiz gerek.<br />
<br />
http://pcapng.com/ ile pcapng dosyamızı .pcap’e çevirdik ve network miner ile dosyamızı açtık.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-0m0Dk5r-F08/WSsv4t-vThI/AAAAAAAAAhc/a2HjKCOUGxUlSv7ylB1nXS_Q7wg3QeMPwCLcB/s1600/Screenshot_8.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="665" data-original-width="1341" height="158" src="https://3.bp.blogspot.com/-0m0Dk5r-F08/WSsv4t-vThI/AAAAAAAAAhc/a2HjKCOUGxUlSv7ylB1nXS_Q7wg3QeMPwCLcB/s320/Screenshot_8.png" width="320" /></a></div>
<p><br />
<br />
Sorumuzu kavradığımız için bizden zaafiyet tipini istiyor. netbios-ssn için vuln sürümlerine bakıp deneyip yanıldığımızda.Bunun MS08-067 olduğunu buluyoruz.<br />
<br />
15.Sorumuz’un cevabı : cypwn_{MS08-067}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-8sUOvqA9no8/WSswObsfdzI/AAAAAAAAAhg/3UTIgijfhfA24pMqZiXHsoki1AfdZRldQCLcB/s1600/Screenshot_9.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="587" data-original-width="593" height="316" src="https://1.bp.blogspot.com/-8sUOvqA9no8/WSswObsfdzI/AAAAAAAAAhg/3UTIgijfhfA24pMqZiXHsoki1AfdZRldQCLcB/s320/Screenshot_9.png" width="320" /></a></div>
<p><br />
16.Sorumuz’a geçelim : Imaj Tools<br />
<br />
İpucumuz : Ram Imajı alınırken hangi araç kullanıldığını bulmamıza yardım et !<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-n2K0lLrvSy4/WSsz3QX2hAI/AAAAAAAAAhs/MDISwtwm0tYzQN8jkEQcy8J21Z4PrZtAgCLcB/s1600/Screenshot_10.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="537" data-original-width="597" height="287" src="https://1.bp.blogspot.com/-n2K0lLrvSy4/WSsz3QX2hAI/AAAAAAAAAhs/MDISwtwm0tYzQN8jkEQcy8J21Z4PrZtAgCLcB/s320/Screenshot_10.png" width="320" /></a></div>
<p><br />
Bu soruda biraz arada kaldım çünkü “volatility” olabilirdi cevabı ama sonradan ram imaj almak için kullanılan toolları incelerken “RamCapture”ye denk geldim ve cevapta tahmin ettiğim gibi çıktı.<br />
<br />
16.Sorumuz’un cevabı : cypwn_{RamCapture}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-HHGpox-N0ZA/WSs1y8ZptEI/AAAAAAAAAh4/tB-pRL4vuqwMuWAVdVJ-ma8M-0ncmT63wCLcB/s1600/Screenshot_11.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="583" data-original-width="586" height="318" src="https://3.bp.blogspot.com/-HHGpox-N0ZA/WSs1y8ZptEI/AAAAAAAAAh4/tB-pRL4vuqwMuWAVdVJ-ma8M-0ncmT63wCLcB/s320/Screenshot_11.png" width="320" /></a></div>
<p><br />
17.Sorumuz’a geçelim : Change is good<br />
<br />
Bu soruda ipucumuz yok.Herşeyi devletten beklememek lazım :D<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-edpGWwd7VSE/WSs3mMN0_BI/AAAAAAAAAiE/gYi1bk3_S3IpvI043lu5V23oVsP1s4YkwCLcB/s1600/Screenshot_12.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="444" data-original-width="599" height="237" src="https://3.bp.blogspot.com/-edpGWwd7VSE/WSs3mMN0_BI/AAAAAAAAAiE/gYi1bk3_S3IpvI043lu5V23oVsP1s4YkwCLcB/s320/Screenshot_12.png" width="320" /></a></div>
<p><br />
Bu soruda baya bir uğraştım son pes edecekken hex ile bakayım dedim ve yolumu oradan çizip bu soruyu çözdüm.<br />
<br />
öncelikle linux’ta default olarak gelen “hexdump”u kullanıp dosyayı açtım.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-yVrBBZL7fzY/WSs4xHgMF7I/AAAAAAAAAiQ/a6nlKQLMwNcGOgx_m6usQ3HG1bG4BBHSwCLcB/s1600/Screenshot_13.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="396" data-original-width="962" height="131" src="https://1.bp.blogspot.com/-yVrBBZL7fzY/WSs4xHgMF7I/AAAAAAAAAiQ/a6nlKQLMwNcGOgx_m6usQ3HG1bG4BBHSwCLcB/s320/Screenshot_13.png" width="320" /></a></div>
<p><br />
Garip bir şekilde dosyamızın headerleri yok’tu yani dosyanın ne olduğu belirtilmemişti.<br />
<br />
http://www.garykessler.net/library/file_sigs.html<br />
<br />
Bu siteyi kullanarak dosya headerlerine ulaştım ama dosyaya hangi headeri vereceğimi bilmiyordum.<br />
<br />
“strings” komutu ile dosyayı baya bir inceledikten sonra dosyanın içinde pdf yazılarının geçtiğini gördüm.<br />
<br />
Hemen sitemizden “PDF” headerlerini alıp dosyayı yeniden düzenliyecektik.<br />
<br />
Hex editörümüz ile dosyayı açıp işlemlere başladık.<br />
<br />
PDF Header intleri : <span style="background-color: white; font-family: &quot;courier&quot;;">25 50 44 46</span><br />
<span style="background-color: white; font-family: &quot;courier&quot;;"><br /></span>
<span style="background-color: white; font-family: &quot;courier&quot;;">Nopların yerine “00 00 00 00” PDF headerlerimizi koyacaktık.</span><br />
<span style="background-color: white; font-family: &quot;courier&quot;;"><br /></span>
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-8oMZ1wmo7XI/WSs51NZJAPI/AAAAAAAAAiY/YevgVA5Aa0k1Dsb96Ts2I9LG3sSRI7V2ACLcB/s1600/Screenshot_14.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="511" data-original-width="999" height="163" src="https://2.bp.blogspot.com/-8oMZ1wmo7XI/WSs51NZJAPI/AAAAAAAAAiY/YevgVA5Aa0k1Dsb96Ts2I9LG3sSRI7V2ACLcB/s320/Screenshot_14.png" width="320" /></a></div>
<p><br />
Dosyamızı pdf olarak editledik’ten sonra açınca karşımıza böyle bir yazı çıktı :<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-AzmFpxG0YcU/WSs6LQYQxNI/AAAAAAAAAic/9a9Rkx-Jy2csDGXzrHq62rRGtLdqIpQgQCLcB/s1600/Screenshot_15.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="521" data-original-width="1177" height="141" src="https://2.bp.blogspot.com/-AzmFpxG0YcU/WSs6LQYQxNI/AAAAAAAAAic/9a9Rkx-Jy2csDGXzrHq62rRGtLdqIpQgQCLcB/s320/Screenshot_15.png" width="320" /></a></div>
<p><br />
Sorumuzun cevabını “interesting” olarak girince sonuca ulaşmış olduk.<br />
<br />
17.Sorumuz’un cevabı : cypwn_{interesting}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-92ZDQ3-rTls/WSs6dqj7bcI/AAAAAAAAAig/mJDX8eDcGlcNd-tRgLd0q4iBWiwCb87MwCLcB/s1600/Screenshot_16.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="498" data-original-width="598" height="266" src="https://2.bp.blogspot.com/-92ZDQ3-rTls/WSs6dqj7bcI/AAAAAAAAAig/mJDX8eDcGlcNd-tRgLd0q4iBWiwCb87MwCLcB/s320/Screenshot_16.png" width="320" /></a></div>
<p><br />
18.Sorumuz’a geçelim : Miyav<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-eYw8D5jtIsU/WSs8fA_TxmI/AAAAAAAAAis/lIUDFfOc38si6m2B900suiu6rt8-dcLHgCLcB/s1600/Screenshot_17.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="442" data-original-width="598" height="236" src="https://1.bp.blogspot.com/-eYw8D5jtIsU/WSs8fA_TxmI/AAAAAAAAAis/lIUDFfOc38si6m2B900suiu6rt8-dcLHgCLcB/s320/Screenshot_17.png" width="320" /></a></div>
<p><br />
Bu sorumuzda bizi şirin bir kedi karşılıyor.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-rEvwAHKMWVo/WStCFkRBPkI/AAAAAAAAAjU/ymU7-MyaAPQ1qiFpTZB8ziA7dOZ0ADkNgCLcB/s1600/Screenshot_23.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="484" data-original-width="792" height="195" src="https://4.bp.blogspot.com/-rEvwAHKMWVo/WStCFkRBPkI/AAAAAAAAAjU/ymU7-MyaAPQ1qiFpTZB8ziA7dOZ0ADkNgCLcB/s320/Screenshot_23.png" width="320" /></a></div>
<p><br />
<br />
Kedimizi “file” komutu ile bir inceliyoruz.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-xCzUfZUsaLY/WSs8-9L_fxI/AAAAAAAAAi0/z_idcFCgE38yzFnPR_LSaZwokUnMMgKWACLcB/s1600/Screenshot_18.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="176" data-original-width="963" height="58" src="https://3.bp.blogspot.com/-xCzUfZUsaLY/WSs8-9L_fxI/AAAAAAAAAi0/z_idcFCgE38yzFnPR_LSaZwokUnMMgKWACLcB/s320/Screenshot_18.png" width="320" /></a></div>
<p><br />
Kedimizin .jpg değilde .jpeg olduğunu söylüyor komutumuz bize değiştirip baktığımızda herhangi bir flag türü birşey göremiyoruz aklımız ne kadar “steganography”ye kaysada arkada başka birşeyler var diyip “binwalk” toolumuzu kullanıyoruz.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-gn_PJ1PKOFY/WStAfmaDZgI/AAAAAAAAAjA/TIVKB-6OLpcc7ZkWuxibHs7CIu-bITIEgCLcB/s1600/Screenshot_19.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="335" data-original-width="961" height="111" src="https://2.bp.blogspot.com/-gn_PJ1PKOFY/WStAfmaDZgI/AAAAAAAAAjA/TIVKB-6OLpcc7ZkWuxibHs7CIu-bITIEgCLcB/s320/Screenshot_19.png" width="320" /></a></div>
<p><br />
“binwalk”ın yanında kullandığım -e parametresi “extract” anlamına geliyor.<br />
<br />
Şirin kedimizin içinden 1 adet “zip” dosyası 2 adette “ASCII” yani text dosyası çıkardık.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-_fQWfHrCUPM/WStBpoPpt2I/AAAAAAAAAjM/gncQD1A1dUMxZuiRmdmNm2Hd79S0Jtf3ACLcB/s1600/Screenshot_21.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="277" data-original-width="993" height="89" src="https://1.bp.blogspot.com/-_fQWfHrCUPM/WStBpoPpt2I/AAAAAAAAAjM/gncQD1A1dUMxZuiRmdmNm2Hd79S0Jtf3ACLcB/s320/Screenshot_21.png" width="320" /></a></div>
<p><br />
“ASCII” dosyalarımızı açtığımızda içinden “ameno” yazan bir yazı çıkıyor.<br />
<br />
Sorumuza cevap olarak bunu denediğimizde flag answerimizi buluyoruz.<br />
<br />
18.Sorumuz’un cevabı : cypwn_{ameno}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-GwsO35MFTFU/WStBzvgBr-I/AAAAAAAAAjQ/AZjKXhvUhCMxxIE94aHDo4JtZ8YprkFIgCLcB/s1600/Screenshot_22.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="496" data-original-width="594" height="267" src="https://1.bp.blogspot.com/-GwsO35MFTFU/WStBzvgBr-I/AAAAAAAAAjQ/AZjKXhvUhCMxxIE94aHDo4JtZ8YprkFIgCLcB/s320/Screenshot_22.png" width="320" /></a></div>
<p><br />
19.Sorumuz’a geçelim : Attack IP<br />
<br />
İpucumuz : pcap dosyasında bir saldırı gerçekleşmektedir.Saldırganın IP sini bulmamıza yardım etmelisin.<br />
<br />
İpucumuz’dan anladığınız gibi bir pcap dosyasını analiz edip flag değerine saldırganın ip’sini vermemiz gerek.<br />
<br />
İndirdiğimiz atak.pcap dosyasını incelediğimizde :<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-VHzKXRW-dFc/WStNxuHyAzI/AAAAAAAAAjk/kcsIPTd36hw2b6e5wLe_CY6Pud9BTpavwCLcB/s1600/Screenshot_25.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="690" data-original-width="1349" height="163" src="https://2.bp.blogspot.com/-VHzKXRW-dFc/WStNxuHyAzI/AAAAAAAAAjk/kcsIPTd36hw2b6e5wLe_CY6Pud9BTpavwCLcB/s320/Screenshot_25.png" width="320" /></a></div>
<p><br />
Request’i gönderen ip’nin ve alan ip’nin değiştiğini ama genelde aynı olduğunu görebiliyoruz.<br />
<br />
Elimizde 4 ip var ve içlerinden biri bizim flag answerimiz çıkacak deniyip gördüğümüzde, cevabımızın “192.168.237.128” local ip’si olduğunu görebiliyoruz.<br />
<br />
19.Sorumuz’un cevabı : cypwn_{192.168.237.128}<br />
<br />
                                 <a href="https://4.bp.blogspot.com/-X9QsTPK7ag8/WStOqg5mFEI/AAAAAAAAAjs/EE2KsFeddm4cDWx8T00OaqM8xPxoc-H8ACLcB/s1600/Screenshot_26.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em; text-align: center;"><img border="0" data-original-height="617" data-original-width="590" height="320" src="https://4.bp.blogspot.com/-X9QsTPK7ag8/WStOqg5mFEI/AAAAAAAAAjs/EE2KsFeddm4cDWx8T00OaqM8xPxoc-H8ACLcB/s320/Screenshot_26.png" width="305" /></a><br />
<br />
20.Sorumuz’a geçelim : Is Empty?<br />
<br />
İpucumuz : Daha dün baktım burdaydı ama şimdi bulamıyorum?<br />
<br />
Bu sorumuz’da zip dosyamızı hash’e çevirmemiz gerekiyor bunun için arkadaşlar çok güzel bir makale hazırlamış incelemek isterseniz ingilizcesi olana güzel :/ : https://blog.sleeplessbeastie.eu/2015/05/25/how-to-crack-archive-password-faster/<br />
<br />
Öncelikle zip dosyamızı “zip2john” ile hash’e çeviriyoruz :<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-sG4vONUaXWo/WSuHUUnHvWI/AAAAAAAAAj8/7x8QlG2tqmYglcoDOoU70sj1OI_DG46NwCLcB/s1600/Screenshot_1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="465" data-original-width="972" height="152" src="https://4.bp.blogspot.com/-sG4vONUaXWo/WSuHUUnHvWI/AAAAAAAAAj8/7x8QlG2tqmYglcoDOoU70sj1OI_DG46NwCLcB/s320/Screenshot_1.png" width="320" /></a></div>
<p><br />
Sonra hash dosyamızı “rockyou.txt” wordlist’i ile şifresini çözmek için döngüye sokuyoruz ve bulduğumuz şifreyi okuyoruz :<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-blNe4gYpIuE/WSuIOJpO03I/AAAAAAAAAkE/LROd7OFLOpoVAZewg8bUoeJC0-FmeMSEACLcB/s1600/Screenshot_2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="149" data-original-width="752" height="63" src="https://3.bp.blogspot.com/-blNe4gYpIuE/WSuIOJpO03I/AAAAAAAAAkE/LROd7OFLOpoVAZewg8bUoeJC0-FmeMSEACLcB/s320/Screenshot_2.png" width="320" /></a></div>
<p><br />
Şifremiz : 12345 çıktı :P<br />
<br />
Dosyamızı açtıktan sonra incelemeye başlıyoruz flag bulabilecekmiyiz diye.<br />
<br />
uzun bir süreden sonra(25 dk xD) bir github linkine denk geliyoruz.<br />
<br />
“.git/” dizinin içindeki “config” dosyasında.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-YCNqwwiTYkU/WSuJz9tJz7I/AAAAAAAAAkQ/Se1up6yoGLo-KIlUq5atam_o3ftCTr5LgCLcB/s1600/Screenshot_3.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="513" data-original-width="999" height="164" src="https://4.bp.blogspot.com/-YCNqwwiTYkU/WSuJz9tJz7I/AAAAAAAAAkQ/Se1up6yoGLo-KIlUq5atam_o3ftCTr5LgCLcB/s320/Screenshot_3.png" width="320" /></a></div>
<p><br />
<br />
github linkine gittiğimizde bizi “relevant” isimli bir dosya bekliyor.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-pCOUM2Qankg/WSuKMEu4ZoI/AAAAAAAAAkU/nFk8VLiLBgAgW9k8APhunbUcQG-7QybSACLcB/s1600/Screenshot_4.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="460" data-original-width="1325" height="111" src="https://2.bp.blogspot.com/-pCOUM2Qankg/WSuKMEu4ZoI/AAAAAAAAAkU/nFk8VLiLBgAgW9k8APhunbUcQG-7QybSACLcB/s320/Screenshot_4.png" width="320" /></a></div>
<p><br />
 İçine girdiğimizde ise bizi flagimiz bekliyor. :)<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-zp7JIf48ADc/WSuKYKJSf8I/AAAAAAAAAkY/Xh6Z9U1Gc4AIrIrSJJHbY4WkNrOJdX6VACLcB/s1600/Screenshot_5.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="502" data-original-width="1329" height="120" src="https://2.bp.blogspot.com/-zp7JIf48ADc/WSuKYKJSf8I/AAAAAAAAAkY/Xh6Z9U1Gc4AIrIrSJJHbY4WkNrOJdX6VACLcB/s320/Screenshot_5.png" width="320" /></a></div>
<p><br />
20.Sorumuz’un cevabı : cypwn_{easy_peasy_lemon_squeezy}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-azMcdXx542Y/WSuPT2PqvCI/AAAAAAAAAks/5kZ-q0md5RQ2BCuhSeUd2HZkXdAR9fKKQCLcB/s1600/Screenshot_6.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="586" data-original-width="600" height="312" src="https://4.bp.blogspot.com/-azMcdXx542Y/WSuPT2PqvCI/AAAAAAAAAks/5kZ-q0md5RQ2BCuhSeUd2HZkXdAR9fKKQCLcB/s320/Screenshot_6.png" width="320" /></a></div>
<p><br />
21.Sorumuz’a geçelim : Flog<br />
<br />
İpucumuz : Flag’ı bul<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-rELaJIcNOGs/WSuPeWFpaWI/AAAAAAAAAkw/j-zQD-7BAGQQ3Ln6kelRK3LrkKJW3SRFQCLcB/s1600/Screenshot_7.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="537" data-original-width="597" height="287" src="https://2.bp.blogspot.com/-rELaJIcNOGs/WSuPeWFpaWI/AAAAAAAAAkw/j-zQD-7BAGQQ3Ln6kelRK3LrkKJW3SRFQCLcB/s320/Screenshot_7.png" width="320" /></a></div>
<p><br />
Bize bir rar dosyası ve içinde “canyoupwnme.log” dosyası veriyor.<br />
<br />
“canyoupwnme.log” dosyasının içini biraz gezdikten sonra sıkılıp flag değerimizin başı olan “cypwn_{“i aradım ben dosya içinde ve flag’imiz karşımızdaydı :<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-GB1lZ0B5EJg/WSuQIuGPHpI/AAAAAAAAAk4/pcZhubnXPcI3OVM2fkfcoiw44POYNiH6ACLcB/s1600/Screenshot_8.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="512" data-original-width="1007" height="162" src="https://1.bp.blogspot.com/-GB1lZ0B5EJg/WSuQIuGPHpI/AAAAAAAAAk4/pcZhubnXPcI3OVM2fkfcoiw44POYNiH6ACLcB/s320/Screenshot_8.png" width="320" /></a></div>
<p><br />
21.Sorumuz’un cevabı : cypwn_{canyoupwnme_log}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-fq6xZKV8Fzc/WSuQgb2w9fI/AAAAAAAAAk8/3Oc3KvYTprEBMH2groCRf-kSyLL7Lk0uACLcB/s1600/Screenshot_9.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="597" data-original-width="597" height="320" src="https://3.bp.blogspot.com/-fq6xZKV8Fzc/WSuQgb2w9fI/AAAAAAAAAk8/3Oc3KvYTprEBMH2groCRf-kSyLL7Lk0uACLcB/s320/Screenshot_9.png" width="320" /></a></div>
<p><br />
22.Sorumuz’a geçelim : Rev1<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-V1reK8X1US4/WSzedLdelzI/AAAAAAAAAlM/pJgPvncE18YRCdpN0rgU-aj8mCis7mHrwCLcB/s1600/Screenshot_1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="442" data-original-width="596" height="237" src="https://3.bp.blogspot.com/-V1reK8X1US4/WSzedLdelzI/AAAAAAAAAlM/pJgPvncE18YRCdpN0rgU-aj8mCis7mHrwCLcB/s320/Screenshot_1.png" width="320" /></a></div>
<p><br />
Sevdiğim “reverse” sorularına geçtik :D<br />
<br />
Bu soruda ne kadar derinlere insemde sonum “strings” komutu ile bitti.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-3Gp_eprtlnE/WSze79JNG3I/AAAAAAAAAlU/Io5eYHHwBAYIIBKdEAjTCkspBDh9P5hpACLcB/s1600/Screenshot_1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="480" data-original-width="962" height="159" src="https://1.bp.blogspot.com/-3Gp_eprtlnE/WSze79JNG3I/AAAAAAAAAlU/Io5eYHHwBAYIIBKdEAjTCkspBDh9P5hpACLcB/s320/Screenshot_1.png" width="320" /></a></div>
<p><br />
Program içindeki stringleri incelediğimizde parola için kullanılan “BATLAMYUS” cevabını görebiliyoruz.<br />
<br /></p>
<ol>
  <li>Sorumuz’un cevabı : cypwn_{BATLAMYUS}<br />
<br /></li>
</ol>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-DBlTX1_1nKc/WSzfUaRkH6I/AAAAAAAAAlY/w6Rhi9Oj0DkV7GP9nnVYdHtt7Gvjuz4sgCLcB/s1600/Screenshot_2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="502" data-original-width="598" height="268" src="https://3.bp.blogspot.com/-DBlTX1_1nKc/WSzfUaRkH6I/AAAAAAAAAlY/w6Rhi9Oj0DkV7GP9nnVYdHtt7Gvjuz4sgCLcB/s320/Screenshot_2.png" width="320" /></a></div>
<p><br />
<br />
23.Sorumuz’a geçelim : Rev2<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-gwko6xIc7Kg/WSzfn7xFhcI/AAAAAAAAAlc/dEOW0skON2IgW3pn7r8s3JEmyVYDzHfRACLcB/s1600/Screenshot_3.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="438" data-original-width="598" height="234" src="https://1.bp.blogspot.com/-gwko6xIc7Kg/WSzfn7xFhcI/AAAAAAAAAlc/dEOW0skON2IgW3pn7r8s3JEmyVYDzHfRACLcB/s320/Screenshot_3.png" width="320" /></a></div>
<p><br />
Bize bir “ELF-32 bit” dosyası veriyor. dosyaya yetkiyi verip açtığımızda bir pincode istiyor bizden.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-dzqW7YYBCXs/WSzh-q3RY2I/AAAAAAAAAlo/e3y4zxDKb9UvEdpf-aBBhyLjA4XN5sw1QCLcB/s1600/Screenshot_4.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="168" data-original-width="446" height="120" src="https://2.bp.blogspot.com/-dzqW7YYBCXs/WSzh-q3RY2I/AAAAAAAAAlo/e3y4zxDKb9UvEdpf-aBBhyLjA4XN5sw1QCLcB/s320/Screenshot_4.png" width="320" /></a></div>
<p><br />
 “GDB” debugger’i aracılığıyla bu dosyayı debug ettiğimizde girdiğimiz pinkodumuz’un doğru pinkodumuz ile “cmp” komutu vasıtasıyla karşılaştırıldığını görebiliyoruz.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-pfZQALCF2xM/WSzlpDwJy1I/AAAAAAAAAmQ/oYPPojU1dzE0lht46eeB318-IokYDB4rACLcB/s1600/Screenshot_7.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="392" data-original-width="643" height="195" src="https://4.bp.blogspot.com/-pfZQALCF2xM/WSzlpDwJy1I/AAAAAAAAAmQ/oYPPojU1dzE0lht46eeB318-IokYDB4rACLcB/s320/Screenshot_7.png" width="320" /></a></div>
<p><br />
<br />
İlerideki yazımda belki “debugger” ve “assembly” olayını biraz daha açabilirim diye düşünüyorum.<br />
<br />
Çıkan “hexadecimal” değerimiz yani doğru pinkodumuz’u ASCII(text)’e online bir servis aracılığıyla çevirelim.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-QT3-EXSHQwE/WSzmHfJxLyI/AAAAAAAAAmY/rn9inh9HFr0zXqi-mJbtAwcfz3fqB9AggCLcB/s1600/Screenshot_9.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="414" data-original-width="1158" height="114" src="https://1.bp.blogspot.com/-QT3-EXSHQwE/WSzmHfJxLyI/AAAAAAAAAmY/rn9inh9HFr0zXqi-mJbtAwcfz3fqB9AggCLcB/s320/Screenshot_9.png" width="320" /></a></div>
<p><br />
Doğru pinkodum’uz “1423”ü “ELF” dosyamıza deniyelim.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-5DDPtfP5dFM/WSzms29PLCI/AAAAAAAAAmg/AiwsF0_Mdw4dLsJopy5V_rYLLONCB-00ACLcB/s1600/Screenshot_10.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="417" data-original-width="659" height="202" src="https://1.bp.blogspot.com/-5DDPtfP5dFM/WSzms29PLCI/AAAAAAAAAmg/AiwsF0_Mdw4dLsJopy5V_rYLLONCB-00ACLcB/s320/Screenshot_10.png" width="320" /></a></div>
<p><br />
23.Sorumuz’un cevabı : cypwn_{1423}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-eZ0Q7US7O20/WSznkgvY88I/AAAAAAAAAmo/2EUdEZpk66wf3diVOTel28Ss20ajT-ikwCLcB/s1600/Screenshot_11.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="499" data-original-width="598" height="267" src="https://4.bp.blogspot.com/-eZ0Q7US7O20/WSznkgvY88I/AAAAAAAAAmo/2EUdEZpk66wf3diVOTel28Ss20ajT-ikwCLcB/s320/Screenshot_11.png" width="320" /></a></div>
<p><br />
<br />
24.Sorumuz’a geçelim : Rev3<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-JnBrdlACfio/WSzoQbazdHI/AAAAAAAAAmw/Qix76hXyqjgeSYYacP3cXLGzSg_kRCmTQCLcB/s1600/Screenshot_12.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="437" data-original-width="598" height="233" src="https://4.bp.blogspot.com/-JnBrdlACfio/WSzoQbazdHI/AAAAAAAAAmw/Qix76hXyqjgeSYYacP3cXLGzSg_kRCmTQCLcB/s320/Screenshot_12.png" width="320" /></a></div>
<p><br />
<br />
Bu sorumuz’da yukarıdaki gibi aynı mantıkta.Bizden bir pinkod istiyor.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-1ohLJxGwKPU/WSzosfrqwMI/AAAAAAAAAm0/rFKkxA6ZGvMLwDyeX3BJnSQ2DymLsRXlACLcB/s1600/Screenshot_13.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="390" data-original-width="648" height="192" src="https://1.bp.blogspot.com/-1ohLJxGwKPU/WSzosfrqwMI/AAAAAAAAAm0/rFKkxA6ZGvMLwDyeX3BJnSQ2DymLsRXlACLcB/s320/Screenshot_13.png" width="320" /></a></div>
<p><br />
Değerimizi online bir “hexadecimal to ascii” servisi ile çözdüğümüzde değerimiz “3454” çıkıyor.<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-G22QD57zJqc/WSzpMbAyy4I/AAAAAAAAAm8/FQ9obonVpqIy4vDjJUj024hxHBPFRjG3QCLcB/s1600/Screenshot_14.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="413" data-original-width="659" height="200" src="https://1.bp.blogspot.com/-G22QD57zJqc/WSzpMbAyy4I/AAAAAAAAAm8/FQ9obonVpqIy4vDjJUj024hxHBPFRjG3QCLcB/s320/Screenshot_14.png" width="320" /></a></div>
<p><br />
24.Sorumuz’un cevabı : cypwn_{3454}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-2LB3GKmcNq4/WSzpcnPIVCI/AAAAAAAAAnA/fiOpHNxEA5wGFcZGgdQIY7JBwODDaADxACLcB/s1600/Screenshot_15.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="501" data-original-width="597" height="268" src="https://1.bp.blogspot.com/-2LB3GKmcNq4/WSzpcnPIVCI/AAAAAAAAAnA/fiOpHNxEA5wGFcZGgdQIY7JBwODDaADxACLcB/s320/Screenshot_15.png" width="320" /></a></div>
<p><br />
<br />
25.Sorumuz’a geçelim : Yeşil Erik<br />
<br />
İpucumuz : Yeşil eriğin tadı da bir başkadır :) \n bubirsecret<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-feKCQesZ7Ic/WSzs7r3-MOI/AAAAAAAAAnM/-dlX9-eggxonZXQ9HluIKLWFKjdegMRpACLcB/s1600/Screenshot_16.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="471" data-original-width="597" height="252" src="https://1.bp.blogspot.com/-feKCQesZ7Ic/WSzs7r3-MOI/AAAAAAAAAnM/-dlX9-eggxonZXQ9HluIKLWFKjdegMRpACLcB/s320/Screenshot_16.png" width="320" /></a></div>
<p><br />
<br />
Evet arkadaşlar 400 Puanlık uzmanlık sorusu karşınızzdaaa.<br />
<br />
İnanın ne kadar zor bir soru olarak gelsede size çok kolay.<br />
<br />
Alt satır’da verilen “bubirsecret” yazısını google’de “intext:bubirsecret” olarak aratınca ilk url’den olayı çözmüş oluyorsunuz tam olarak sayılmasada.<br />
<br />
intext google’de text aramak için bir method’dur.<br />
<br />
<br />
<br />
İlk url’miz olan ekşisözlük forum’una girdiğimiz’de bizi böyle bir sayfa karşılıyor :<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-paVQc7HU5n4/WSztiU02k5I/AAAAAAAAAnU/JFve3Zl4oB0NNor7bbj99anAg7C2pgx2gCLcB/s1600/Screenshot_18.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="576" data-original-width="1176" height="156" src="https://2.bp.blogspot.com/-paVQc7HU5n4/WSztiU02k5I/AAAAAAAAAnU/JFve3Zl4oB0NNor7bbj99anAg7C2pgx2gCLcB/s320/Screenshot_18.png" width="320" /></a></div>
<p><br />
Buradaki cipher’in “vigenere” olduğunu az çok anlayan olmuştur fakat yanındaki “sır” ne diyecek olursanız bizim anahtarımız.Yanlış duymadınız gerçekten anahtarımız :D<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-rWmyLVYDRsY/WSzt9Hw1ulI/AAAAAAAAAnY/XoinamH7vu8JAa0q7IHZdmzAFR2FEfoQQCLcB/s1600/Screenshot_20.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="509" data-original-width="984" height="165" src="https://2.bp.blogspot.com/-rWmyLVYDRsY/WSzt9Hw1ulI/AAAAAAAAAnY/XoinamH7vu8JAa0q7IHZdmzAFR2FEfoQQCLcB/s320/Screenshot_20.png" width="320" /></a></div>
<p><br />
cipher’imiz olarak bulduğumuz articlede’ki “vcpkmjauzczzhbfdwaa”yı kullandığımızda ve anahtar’a “Bakınız : sır” köşesindeki sır’ı yazdığımızda flag’imizi bulmuş oluyoruz.<br />
<br /></p>
<ol>
  <li>Sorumuz’un cevabı : cypwn_{duysesimikriptoloji}<br />
<br /></li>
</ol>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-UVNIcj772FQ/WSzucRxjgpI/AAAAAAAAAng/bTXdFC7osw4p93v_m15THhNElMpTAJNqQCLcB/s1600/Screenshot_21.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="527" data-original-width="593" height="284" src="https://1.bp.blogspot.com/-UVNIcj772FQ/WSzucRxjgpI/AAAAAAAAAng/bTXdFC7osw4p93v_m15THhNElMpTAJNqQCLcB/s320/Screenshot_21.png" width="320" /></a></div>
<p><br />
<br />
26.Sorumuz’a geçelim : This is LEAK!<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-Q3p3Qtdi71I/WS4OcUv9ByI/AAAAAAAAAnw/_h2Ug3Oam6cQGtkW7DMjBhevxertPm_3ACLcB/s1600/Screenshot_1.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="486" data-original-width="598" height="260" src="https://3.bp.blogspot.com/-Q3p3Qtdi71I/WS4OcUv9ByI/AAAAAAAAAnw/_h2Ug3Oam6cQGtkW7DMjBhevxertPm_3ACLcB/s320/Screenshot_1.png" width="320" /></a></div>
<p><br />
<br />
Bu soru cidden çok alakasızdı fotoraf ile.<br />
<br />
Soru’nun cevabı şansımın yaver gitmesi oldu.<br />
<br />
Canyoupwn.me sitesini gezinirken “WebRTC IP Leak” isimli bir post’a denk geldim.<br />
<br />
Cevap olarak konu başlığındaki herşeyi denedim “WebRTC_IP_Leak” olsun “IP” olsun.Sonunda sorunun cevabını “webrtc” olarak buldum.<br />
<br />
<br />
26.Sorumuz’un cevabı : cypwn_{webrtc}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-k_gtLPe3xcY/WS4PWjVDeQI/AAAAAAAAAn4/kghcyTbKdmAAF20xUj5_XTl14Sls0zVVACLcB/s1600/Screenshot_2.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="488" data-original-width="599" height="260" src="https://1.bp.blogspot.com/-k_gtLPe3xcY/WS4PWjVDeQI/AAAAAAAAAn4/kghcyTbKdmAAF20xUj5_XTl14Sls0zVVACLcB/s320/Screenshot_2.png" width="320" /></a></div>
<p><br />
<br />
27.Sorumuz’a geçelim : Sen Görürsün Sevgilim<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://2.bp.blogspot.com/-W0uYKBEazak/WS4PprW0vFI/AAAAAAAAAn8/Soukdke_P3oulYWqXuFDnSepDs8u9FeEQCLcB/s1600/Screenshot_3.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="509" data-original-width="600" height="270" src="https://2.bp.blogspot.com/-W0uYKBEazak/WS4PprW0vFI/AAAAAAAAAn8/Soukdke_P3oulYWqXuFDnSepDs8u9FeEQCLcB/s320/Screenshot_3.png" width="320" /></a></div>
<p><br />
Soru’da verilen yazının açıkca “BrainFuck” olduğu görünebiliyordu online bir brainfuck to text sitesinde sorumuz’un cevabını bulduk.<br />
<br />
27.Sorumuz’un cevabı : cypwn_{sokrates}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://1.bp.blogspot.com/-RkhS6xAfDvw/WS4QIwyQABI/AAAAAAAAAoE/EB2M65wg6dgftjwLtbw4tRyhSjF97BhJQCLcB/s1600/Screenshot_4.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="505" data-original-width="598" height="270" src="https://1.bp.blogspot.com/-RkhS6xAfDvw/WS4QIwyQABI/AAAAAAAAAoE/EB2M65wg6dgftjwLtbw4tRyhSjF97BhJQCLcB/s320/Screenshot_4.png" width="320" /></a></div>
<p><br />
<br />
28.Sorumuz’a geçelim : Sevgilimden Trip Yedim Ne Diyo bu ya?<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://4.bp.blogspot.com/-q3t84rMrLPk/WS4QX_2qTQI/AAAAAAAAAoI/aenHsBvJHpYVgO4tT3nFHpCqwNIf7pKAwCLcB/s1600/Screenshot_5.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="630" data-original-width="533" height="320" src="https://4.bp.blogspot.com/-q3t84rMrLPk/WS4QX_2qTQI/AAAAAAAAAoI/aenHsBvJHpYVgO4tT3nFHpCqwNIf7pKAwCLcB/s320/Screenshot_5.png" width="270" /></a></div>
<p><br />
<br />
Yukarıdaki sorumuz gibi bunuda online bir “Ook! to text” sitesini kullanarak çözebiliyoruz.<br />
<br />
28.Sorumuz’un cevabı : cypwn_{platon}<br />
<br /></p>
<div class="separator" style="clear: both; text-align: center;">
<a href="https://3.bp.blogspot.com/-9xfPKRxAXU0/WS4QxD3uLNI/AAAAAAAAAoM/eJzxh1IVZVstX70qvr9jOrwI0etftHS3wCLcB/s1600/Screenshot_6.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="523" data-original-width="508" height="320" src="https://3.bp.blogspot.com/-9xfPKRxAXU0/WS4QxD3uLNI/AAAAAAAAAoM/eJzxh1IVZVstX70qvr9jOrwI0etftHS3wCLcB/s320/Screenshot_6.png" width="310" /></a></div>
<p><br />
<br /></p>

<p>29.Sorumuz’a geçelim : Is This Love ?</p>

<p>Sorumuz’da bize bir rar dosyası veriliyor “love” parolası ile içini açtığımızda içinden bir rar dosyası daha çıkıyor ve onun içindende altta gördüğünüz dosyalar.</p>

<p><img src="http://i.imgur.com/IqEHqlD.jpg" alt="" /></p>

<p>Rar’ımızın içinden çıkan resim dosyalarına ne kadar “steg” vs.. denesekde sonucu bulamadık.Sonunda bir gimp ile el atmaya karar verdik.</p>

<p>Biraz oynayınca içinden 2 adet “QR Code” Çıkardık.QR’ları online bir decoder ile çözdüğümüzde çıkan sonuçlar bunlar oldu :</p>

<p>ctf , ypbitrghkrpsgkxehr</p>

<p>2sinide flag’e denedik ama hiçbir sonuç elde edemedik.</p>

<p>Sonunda aklıma “ypbitrghkrpsgkxehr” vigenere bir cipher olabileceği geldi online bir vigenere decoder ile çözmeye çalıştık anahtarımız’ında ctf “string”i olduğunu bulunca cevap’a ulaştık. :</p>

<p><img src="http://i.imgur.com/R7ydx1T.jpg" alt="" width="450" /></p>

<p>29.Sorumuz’un cevabı : cypwn_{wwwgameofpwnerscom}</p>

<p><img src="http://i.imgur.com/PjudIuf.jpg" alt="" width="450" /></p>

<p>30.Sorumuz’a geçelim :  Not deleted, Can not be deleted!!!</p>

<p><img src="http://i.imgur.com/vhzlaDb.jpg" alt="" width="450" /></p>

<p>Bu sorumuz aslında ctf mantığını ortaya koymuş xD</p>

<p>Verilen github repository’sine gittiğimizde :</p>

<p><img src="http://i.imgur.com/UtgmoeJ.jpg" alt="" width="1000" /></p>

<p>Readme kısmında arkadaşlar ipucu vermiş gibi görünüyor birazcık.</p>

<p>Repository üzerinde yapılan değişikliklere baktığımız’da “secrets.yml” isimli bir dosya geliyor karşımıza tabi 5,6 dosya daha inceledim ben sonunda farkettim bunu.</p>

<p><img src="http://i.imgur.com/bKUlj4J.jpg" alt="" width="800" /></p>

<p>Silinen ve güncelleştirilen iki secret dosyamızdada flag görünüyordu.</p>

<p><img src="http://i.imgur.com/txNAD1O.jpg" alt="" width="700" /></p>

<p>30.Sorumuz’un cevabı : cypwn_{dikkat_etmek_ve_detayli_incelemek_butun_hersey_bu}</p>

<p><img src="http://i.imgur.com/IRXeK02.jpg" alt="" width="450" /></p>

<p>31.Sorumuz’a geçelim : Mr.Robot</p>

<p><img src="http://i.imgur.com/dvrWwGf.jpg" alt="" width="450" /></p>

<p>Sorumuz’dan bir adet html dosyası çıkıyor.Dosyayı açtığımızda çok garip birşey çıkıyor dosyaya türlü şeyi denettirdi bana o mr robot ismi ama sonunda tüm dizileri replace ederek cevabı buldum :</p>

<p><img src="http://i.imgur.com/wxXrfxh.jpg" alt="" width="450" /></p>

<p>31.Sorumuz’un cevabı : cypwn_{matrixhacker}</p>

<p><img src="http://i.imgur.com/7RCEcPg.jpg" alt="" width="450" /></p>

<p>32.Sorumuz’a geçelim : (D)emand (B)rogress</p>

<p><img src="http://i.imgur.com/TtwSqPe.jpg" alt="" width="450" /></p>

<p>Bu soru en zor sorulardan bir tanesiydi firefox, bing, google gezdim gezdim anam gezdim sonunda yazı ile benzerlik taşıyan “pacer veritabanı leak”ına denk geldim flag olarak pacer’i denediğimde soruyu geçecektim.</p>

<p>32.Sorumuz’un cevabı : cypwn_{pacer}</p>

<p><img src="http://i.imgur.com/nJNfkga.jpg" alt="" width="450" /></p>