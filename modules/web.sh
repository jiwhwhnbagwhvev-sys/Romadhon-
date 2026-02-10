#!/bin/bash

green='\033[1;32m'
nc='\033[0m'

clear
echo -e $green
echo "================================================"
echo "         🌙 WEB RAMADHAN SUPER 🌙"
echo "================================================"
echo ""

# ==============================
# CEK PYTHON
# ==============================
if ! command -v python &> /dev/null
then
echo "Python belum terinstall!"
echo "pkg install python"
exit
fi

# ==============================
# FOLDER WEB
# ==============================
mkdir -p ~/ramadhan_web
cd ~/ramadhan_web

# ==============================
# HTML SUPER PANJANG
# ==============================
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ramadhan Mubarak</title>

<style>
body{
background:black;
color:lime;
font-family:Arial;
text-align:center;
}

.box{
border:2px solid lime;
padding:20px;
margin:20px;
border-radius:15px;
box-shadow:0 0 15px lime;
}

h1{
text-shadow:0 0 20px lime;
}

button{
padding:10px;
background:lime;
border:none;
cursor:pointer;
margin:5px;
}

marquee{
color:yellow;
font-size:20px;
}
</style>
</head>

<body>

<h1>🌙 RAMADHAN MUBARAK 🌙</h1>

<marquee>Selamat datang di Web Ramadhan • Bulan penuh berkah • Tingkatkan ibadahmu</marquee>

<div class="box">
<h2>Jam Sekarang</h2>
<p id="jam"></p>
</div>

<script>
function waktu(){
let d=new Date();
document.getElementById("jam").innerHTML=d.toLocaleTimeString();
}
setInterval(waktu,1000);
</script>

<div class="box">
<h2>Checklist Ibadah</h2>
<p><input type="checkbox"> Sholat 5 waktu</p>
<p><input type="checkbox"> Puasa</p>
<p><input type="checkbox"> Tarawih</p>
<p><input type="checkbox"> Tadarus</p>
<p><input type="checkbox"> Sedekah</p>
</div>

<div class="box">
<h2>Dzikir Counter</h2>
<p id="z">0</p>
<button onclick="t()">Tambah Dzikir</button>
<script>
let a=0;
function t(){
a++;
document.getElementById("z").innerHTML=a;
}
</script>
</div>

<div class="box">
<h2>Motivasi Ramadhan</h2>
<p>Puasa melatih kesabaran</p>
<p>Ramadhan bulan ampunan</p>
<p>Setiap amal dilipatgandakan</p>
<p>Doa orang puasa mustajab</p>
<p>Perbanyak istighfar</p>
<p>Baca Al-Quran setiap hari</p>
<p>Jaga lisan dan hati</p>
<p>Ramadhan waktu berubah lebih baik</p>
</div>

<div class="box">
<h2>Target Ramadhan</h2>
<p>✔️ Khatam Quran</p>
<p>✔️ Sedekah rutin</p>
<p>✔️ Sholat tepat waktu</p>
<p>✔️ Perbaiki akhlak</p>
</div>

<div class="box">
<h2>Pesan Ramadhan</h2>
<p>Semoga puasamu lancar</p>
<p>Semoga ibadah diterima</p>
<p>Semoga hatimu tenang</p>
<p>Semoga hidupmu berkah</p>
</div>

<div class="box">
<h2>Doa Harian</h2>
<p>Allahumma innaka 'afuwwun...</p>
<p>Rabbana atina fid dunya...</p>
</div>

<div class="box">
<h2>Info Ramadhan</h2>
<p>Ramadhan bulan ke-9 Hijriyah</p>
<p>Puasa wajib bagi muslim</p>
<p>Lailatul Qadar lebih baik dari 1000 bulan</p>
</div>

<div class="box">
<h2>Animasi Bintang</h2>
<p>⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐</p>
</div>

</body>
</html>
EOF

# ==============================
# JALANKAN SERVER
# ==============================
echo ""
echo "Server aktif!"
echo "Buka di browser:"
echo "http://localhost:8080"
echo ""

python -m http.server 8080
