#!/bin/bash

green='\033[1;32m'
nc='\033[0m'

clear
echo -e $green
echo "=============================================="
echo "        🌙 RAMADHAN ULTRA SYSTEM 🌙"
echo "=============================================="

# ==========================
# CEK PYTHON
# ==========================
if ! command -v python &> /dev/null
then
echo "pkg install python"
exit
fi

mkdir -p ultra_ramadhan
cd ultra_ramadhan

# ==========================
# HTML SUPER PANJANG ULTRA
# ==========================
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ramadhan Ultra</title>

<style>
body{
background:black;
color:lime;
font-family:Arial;
text-align:center;
}

.card{
border:2px solid lime;
padding:20px;
margin:20px;
border-radius:20px;
box-shadow:0 0 20px lime;
}

button{
padding:10px 20px;
background:lime;
border:none;
border-radius:10px;
font-size:16px;
}

input{
padding:10px;
border-radius:10px;
}

h1,h2{
text-shadow:0 0 10px lime;
}

.progress{
width:100%;
background:#222;
border-radius:10px;
}

.bar{
width:50%;
height:20px;
background:lime;
}
</style>
</head>

<body>

<h1>🌙 RAMADHAN ULTRA 🌙</h1>

<!-- LOGIN -->
<div class="card">
<h2>Login</h2>
<input id="nama" placeholder="Nama">
<br><br>
<button onclick="login()">Masuk</button>
<p id="out"></p>
</div>

<!-- JAM -->
<div class="card">
<h2>Jam Digital</h2>
<h1 id="jam"></h1>
</div>

<!-- DZIKIR -->
<div class="card">
<h2>Dzikir Digital</h2>
<h1 id="z">0</h1>
<button onclick="t()">Tambah</button>
<button onclick="r()">Reset</button>
</div>

<!-- TARGET -->
<div class="card">
<h2>Progress Ibadah</h2>
<p>Puasa</p>
<div class="progress"><div class="bar"></div></div>
<p>Tilawah</p>
<div class="progress"><div class="bar" style="width:70%"></div></div>
<p>Sedekah</p>
<div class="progress"><div class="bar" style="width:80%"></div></div>
</div>

<!-- RADIO -->
<div class="card">
<h2>Radio Quran</h2>
<audio controls autoplay>
<source src="https://stream.radiojar.com/8s5u5tpdtwzuv">
</audio>
</div>

<!-- MOTIVASI -->
<div class="card">
<h2>Motivasi</h2>
<p id="mot"></p>
<button onclick="mot()">Motivasi</button>
</div>

<!-- KALENDER -->
<div class="card">
<h2>Kalender Ramadhan</h2>
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
<p>Hari 11 ✔️</p>
<p>Hari 12 ✔️</p>
<p>Hari 13 ✔️</p>
<p>Hari 14 ✔️</p>
<p>Hari 15 ✔️</p>
</div>

<script>

// LOGIN
function login(){
var n=document.getElementById("nama").value;
document.getElementById("out").innerHTML=
"Selamat datang "+n+" 🌙";
}

// JAM
setInterval(function(){
var d=new Date();
document.getElementById("jam").innerHTML=
d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
},1000);

// DZIKIR
var c=0;
function t(){
c++;
document.getElementById("z").innerHTML=c;
if(c%33==0){
alert("33 Dzikir ✔️");
}
}
function r(){
c=0;
document.getElementById("z").innerHTML=c;
}

// MOTIVASI
var kata=[
"Puasa melatih sabar",
"Ramadhan penuh berkah",
"Sedekah dilipatgandakan",
"Quran penenang hati",
"Doa mustajab",
"Ramadhan cepat berlalu",
"Perbanyak dzikir",
"Perbanyak doa",
"Perbanyak sedekah",
"Jaga lisan",
"Jaga hati",
"Lailatul qadar lebih baik",
"Setiap pahala dilipatgandakan",
"Ramadhan bulan ampunan",
"Gunakan waktu baik"
];

function mot(){
document.getElementById("mot").innerHTML=
kata[Math.floor(Math.random()*kata.length)];
}

</script>

</body>
</html>
EOF

echo ""
echo "==================================="
echo "Server aktif di:"
echo "http://localhost:8000"
echo "==================================="
echo ""

python -m http.server 8000
