---
title: Spanning Tree Protocol(STP) Saldırı ve Korunma Yöntemleri
layout: post
---

<h1 id="spanning-tree-protocol-stp-nedir--">Spanning Tree Protocol (STP) nedir ? :</h1>

<p>Switching loops yani anahtarlama döngülerini engellemek için geliştirilmiş <a href="https://en.wikipedia.org/wiki/OSI_model" target="_blank">OSI Model’inde</a> bulunan <strong>ikinci katman(layer 2)</strong> içerisinde bulunan bir protokol’dur.</p>

<p>STP barındıran switch’ler kendilerine bir root switch (kök anahtar) seçerler ayrıca her switch’in bir adet <strong>Bridge ID</strong> değeri vardır, bu değer <strong>Bridge Priority</strong> ve <strong>Bridge’nin Mac Adresi</strong> ile oluşur.</p>

<p>En düşük <strong>Bridge ID</strong>‘ye sahip olan <strong>Bridge</strong>, <strong>Root Bridge(Root Switch)</strong> olarak seçilir.<strong>Bridge Priority</strong>‘nin default değeri 32768’dir ve düzenlenebilir’dir.</p>

<p>Bu seçim BPDU aracılığıyla yapılır.Ağa BPDU  üreten bilgisayar bağlanıp, bağlanan bilgisayarın ürettiği BPDU’nun içindeki <strong>Bridge Priority</strong> değeri’de 0 yapılarak, ağa bağladığımız bilgisayarın kök switch yerini almasını sağlayabiliriz.</p>

<h1 id="spanning-tree-protocol-stp-saldırıları-">Spanning Tree Protocol (STP) saldırıları :</h1>
<p>Normal bir ddos veya dos saldırısından örnek vererek yola çıkalım gönderdiğiniz paketler genelde tcp/ip veya udp/ip olarak gider ve tüneli tıkayıp girişleri engeller.</p>

<p>Bu saldırıda ise tcp/ip veya udp/ip yerine <strong>BPDU Configuration</strong> paketleri kullanılıyor.</p>

<p>Çok sayıda giden <strong>BPDU Configuration</strong> paketleri ağı bir zaman’a kadar servis dışı bırakıyor, saldırının asıl amacı ağ içerisindeki haberleşmeyi kesmek.</p>

<p>Bu saldırıyı <strong>İkinci katman (layer 2)</strong> ulaşım ve aynı zamanda saldırı aracı olan <strong>Yersinia</strong> ile yapabiliriz.</p>

<p>Kurduğunuzu varsayarak’tan <code class="highlighter-rouge">yersinia -G</code> ile graphical arayüzünü başlatıyoruz.</p>

<p><img src="https://i.hizliresim.com/ByXO5Q.jpg" alt="" /></p>

<p>Sol üstteki <strong>Launch Attack</strong> kısmın’a tıklayıp sağ taraf’tan <strong>STP</strong>‘yi seçiyoruz ve <strong>Choose Attack</strong> kısmının alt tarafından <strong>sending conf BPDUs</strong>‘ı seçiyoruz ve <strong>OK</strong> diyerek saldırıyı başlatıyoruz.Eğer En düşük <strong>Bridge ID</strong>‘sine sahip olmak istiyorsak <strong>Claiming Root Role</strong>‘u seçebiliriz.Ayrıca tüm trafiği dinlemek istiyorsak <strong>Claiming Root Role with MiTM(man in the middle)</strong>‘ı seçebiliriz..</p>

<p><strong>Wireshark</strong> ile <strong>STP</strong> üzerinde giden tüm request ve response paketlerini görmemiz mümkün.</p>

<p><img src="https://i.hizliresim.com/kXrMPy.png" alt="" /></p>

<h1 id="spanning-tree-protocol-stp-korunma-yöntemi-">Spanning Tree Protocol (STP) korunma yöntemi :</h1>
<p>Saldırı’yı gösterdik ve sıra güvenliğimiz’de.Yukarıda öğrendiğimize göre <strong>BPDU</strong> bize çok büyük sıkıntılar çıkarıyor ve bunun içinde belli başlı komutlarımız var.</p>

<p><br />
<br /></p>

<p><strong>BPDU Koruması</strong> :</p>

<p><strong>Switch</strong>‘te genel olarak <strong>BPDU</strong> Korumasını aktifleştirmek için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#spanning-tree portfast bpduguard default
</code></pre>
</div>

<p><strong>Spesifik switch portun</strong>‘da <strong>PortFast BPDU</strong> Koruması’nı etkinleştirmek için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#spanning-tree bpduguard enable
</code></pre>
</div>

<p><strong>BPDU</strong> Konfigurasyon’unu doğrulamak için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#show spanning-tree summary totals
</code></pre>
</div>
<p><br />
<br /></p>
<hr />

<p><br />
<br />
<strong>BPDU Filtrelemesi</strong> :</p>

<p><strong>Switch</strong>‘te genel olarak <strong>PortFast BPDU</strong> Filterelemesini etkinleştirmek için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#spanning-tree portfast bpdufilter default
</code></pre>
</div>

<p><strong>Spesifik switch portun</strong>‘da <strong>PortFast BPDU</strong> Filtrelemesini etkinleştirmek için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#spanning-tree bpdufilter enable
</code></pre>
</div>

<p><strong>Komutların</strong> Konfigurasyon’unu switch’te doğrulamak için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#show spanning-tree summary totals
</code></pre>
</div>
<p><br />
<br /></p>
<hr />

<p><br />
<br />
<strong>BPDU Root Koruması</strong> :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#spanning-tree rootguard
</code></pre>
</div>