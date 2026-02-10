#!/bin/bash

green='\033[1;32m'
nc='\033[0m'

clear
echo -e $green
echo "=============================================="
echo "        🌙 RAMADHAN WEB MEGA 🌙"
echo "=============================================="
echo ""

# ===============================
# CEK PYTHON
# ===============================
if ! command -v python &> /dev/null
then
echo "pkg install python"
exit
fi

mkdir -p ramadhan_web
cd ramadhan_web

# ===============================
# HTML SUPER PANJANG
# ===============================
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ramadhan Mega Dashboard</title>

<style>
body{
background:black;
color:lime;
font-family:Arial;
text-align:center;
}

.card{
border:2px solid lime;
margin:20px;
padding:20px;
border-radius:20px;
box-shadow:0 0 20px lime;
}

h1,h2{
text-shadow:0 0 10px lime;
}

button{
padding:10px 20px;
background:lime;
border:none;
border-radius:10px;
font-size:16px;
}

marquee{
font-size:20px;
color:yellow;
}
</style>
</head>

<body>

<h1>🌙 RAMADHAN MEGA DASHBOARD 🌙</h1>

<marquee>Selamat datang di Bulan Suci Ramadhan 🌙 Semoga ibadah diterima</marquee>

<div class="card">
<h2>🕌 Jadwal Sholat</h2>
<p>Subuh 04:30</p>
<p>Dzuhur 12:00</p>
<p>Ashar 15:30</p>
<p>Maghrib 18:00</p>
<p>Isya 19:15</p>
<p>Tarawih 19:45</p>
</div>

<div class="card">
<h2>📿 Dzikir Digital</h2>
<h1 id="dzikir">0</h1>
<button onclick="dzikir()">Tambah</button>
</div>

<div class="card">
<h2>🌙 Motivasi</h2>
<p id="mot"></p>
<button onclick="mot()">Motivasi Baru</button>
</div>

<div class="card">
<h2>📊 Target Ibadah</h2>
<p>Puasa ✔️</p>
<p>Tarawih ✔️</p>
<p>Tilawah ✔️</p>
<p>Sedekah ✔️</p>
<p>Dzikir ✔️</p>
</div>

<div class="card">
<h2>📅 Kalender Ramadhan</h2>
<p>Hari 1 ✔️</p>
<p>Hari 2 ✔️</p>
<p>Hari 3 ✔️</p>
<p>Hari 4 ✔️</p>
<p>Hari 5 ✔️</p>
<p>Hari 6 ✔️</p>
<p>Hari 7 ✔️</p>
<p>Hari 8 ✔️</p>
<p>Hari 9 ✔️</p>
<p>Hari 10 ✔️</p>
</div>

<div class="card">
<h2>⏳ Hitung Mundur Maghrib</h2>
<h1 id="countdown"></h1>
</div>

<div class="card">
<h2>💚 Pesan Ramadhan</h2>
<p>Perbanyak istighfar</p>
<p>Perbanyak doa</p>
<p>Perbanyak sedekah</p>
<p>Jaga lisan</p>
<p>Jaga hati</p>
</div>

<script>

// DZIKIR
var z=0;
function dzikir(){
z++;
document.getElementById("dzikir").innerHTML=z;
}

// MOTIVASI
var kata=[
"Puasa melatih sabar",
"Ramadhan bulan ampunan",
"Sedekah dilipatgandakan",
"Quran penenang hati",
"Lailatul qadar lebih baik dari 1000 bulan",
"Allah mencintai orang sabar",
"Doa orang puasa mustajab",
"Ramadhan penuh berkah",
"Setiap pahala dilipatgandakan",
"Jangan sia-siakan Ramadhan"
];

function mot(){
document.getElementById("mot").innerHTML=
kata[Math.floor(Math.random()*kata.length)];
}

// COUNTDOWN MAGHRIB
var countDownDate = new Date();
countDownDate.setHours(18,0,0);

var x=setInterval(function(){
var now=new Date().getTime();
var distance=countDownDate-now;

var h=Math.floor((distance%(1000*60*60*24))/(1000*60*60));
var m=Math.floor((distance%(1000*60*60))/(1000*60));
var s=Math.floor((distance%(1000*60))/1000);

document.getElementById("countdown").innerHTML=
h+"j "+m+"m "+s+"d";

},1000);

</script>

</body>
</html>
EOF

echo ""
echo "================================="
echo "Server aktif di:"
echo "http://localhost:8000"
echo "================================="
echo ""
echo "Buka di browser ya 🌙"
echo ""

python -m http.server 8000
