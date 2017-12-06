---
layout: post
title: Cisco Discovery Protocol(CDP) Nedir ? Saldırı yöntemi
---

<h2>Cisco Discovery Protocol(CDP) Nedir ?</h2>
<p><strong>CDP</strong> <a href="https://en.wikipedia.org/wiki/OSI_model" target="_blank">OSI Model’inde</a> <strong>2. Katman(layer 2)</strong>‘de bulunan bir protokoldur.İşlevi ise cisco içerisinde kullanılan herhangi bir cihaz’a direkt olarak bağlı olan misafir cihazları görüntülemektir.</p>

<p>Genellikle <strong>Router</strong>,  <strong>Switch</strong>,  <strong>Access Server</strong>, <strong>Bridge</strong> gibi ağ cihazların’da kullanılır.</p>

<p><strong>CDP</strong>‘nin ayrıca <strong>CDP v2</strong> adında yeni bir sürümü vardır.<a href="https://www.cisco.com/c/en/us/td/docs/ios-xml/ios/cdp/configuration/15-mt/cdp-15-mt-book/nm-cdp-discover.html" target="_blank">Buradan</a> Son güncellenme tarihine ve dökümantasyon’una ulaşabilirsiniz.</p>

<p>İçerisinde <strong>CDP</strong> kapatılmamış her cihaz kendi ağı içerisinde <strong>multicast(çoklu gönderim)</strong> olarak bilgilerini yayınlar.
<br /></p>
<h1 id="cdp-ile-ilgili-bilmeniz-gereken-komutlar-">CDP ile ilgili bilmeniz gereken komutlar :</h1>
<p>Protokol’ü aktifleştirmek ve deaktifleştirmek için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#cdp enable
</code></pre>
</div>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#no cdp enable
</code></pre>
</div>

<p>Protokol’ü genel olarak çalıştırmak  ve kapatmak için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#cdp run
</code></pre>
</div>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#cdp no run
</code></pre>
</div>

<p>CDP trafik sayaçlarını görmek için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#show cdp traffic
</code></pre>
</div>

<p>CDP trafik sayaçlarını temizlemek için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#clear cdp counters
</code></pre>
</div>

<p>Komşuları görmek için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#show cdp neighbors
</code></pre>
</div>

<p>İnterface’leri listelemek için :</p>
<div class="highlighter-rouge"><pre class="highlight"><code>Router#show cdp interfaces
</code></pre>
</div>

<p><br /><br /></p>
<hr />

<p><br /><br /></p>
<h2>Cisco Discovery Protocol (CDP) Saldırı yöntemi Denial Of Service Attack</h2>

<p>Bu saldırıyı İkinci katman (layer 2) ulaşım ve aynı zamanda saldırı aracı olan Yersinia ile yapabiliriz.</p>

<p>Saldırının amacı <strong>Cisco Switch</strong>‘ini <strong>CDP</strong> Flood’ları ile yok etmek.</p>

<p>Öncelikle Yersinia aracımızı <code class="highlighter-rouge">yersinia -G</code> komutu ile açıyoruz.</p>

<p>Sol üst’ten <strong>launch attack</strong> kısmına tıklıyoruz ve <strong>CDP</strong>‘yi seçip <strong>Choose Protocol Attack</strong> kısmının altından <strong>Flooding CDP table</strong> seçeneğini seçip <strong>OK</strong> ile saldırıyı başlatıyoruz.</p>

<p><img src="https://i.hizliresim.com/kXrM5y.jpg" alt="" /></p>

<p><strong>Wireshark</strong> aracı ile giden <strong>CDP</strong> paketlerini görebiliyoruz :</p>

<p><img src="https://i.hizliresim.com/nJPbBR.jpg" alt="" /></p>