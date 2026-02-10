#!/bin/bash

green='\033[1;32m'
nc='\033[0m'

clear
echo -e $green
echo "====================================================="
echo "           🌙 RAMADHAN SULTAN ULTRA 🌙"
echo "====================================================="

# =============================
# CEK PYTHON
# =============================
if ! command -v python &> /dev/null
then
echo "Install python dulu:"
echo "pkg install python"
exit
fi

mkdir -p sultan_ultra
cd sultan_ultra

# =============================
# HTML SUPER PANJANG
# =============================
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ramadhan Sultan Ultra</title>

<style>
body{
background:black;
color:lime;
font-family:Arial;
text-align:center;
transition:1s;
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
margin:5px;
}

input{
padding:10px;
border-radius:10px;
width:80%;
}

.chatbox{
height:150px;
overflow:auto;
border:1px solid lime;
padding:10px;
}

.progress{
width:100%;
background:#222;
border-radius:10px;
}

.bar{
height:20px;
background:lime;
width:50%;
}

h1,h2{
text-shadow:0 0 10px lime;
}
</style>
</head>

<body>

<h1>🌙 RAMADHAN SULTAN ULTRA 🌙</h1>

<!-- LOGIN -->
<div class="card">
<h2>Login Sultan</h2>
<input id="nama" placeholder="Nama kamu">
<br><br>
<button onclick="login()">Masuk</button>
<p id="halo"></p>
</div>

<!-- JAM -->
<div class="card">
<h2>Jam Ramadhan</h2>
<h1 id="jam"></h1>
</div>

<!-- DZIKIR -->
<div class="card">
<h2>Tasbih Digital</h2>
<h1 id="dz">0</h1>
<button onclick="tambah()">Tambah</button>
<button onclick="reset()">Reset</button>
</div>

<!-- TARGET IBADAH -->
<div class="card">
<h2>Progress Ibadah</h2>
Puasa
<div class="progress"><div class="bar" style="width:90%"></div></div>
Tilawah
<div class="progress"><div class="bar" style="width:70%"></div></div>
Sedekah
<div class="progress"><div class="bar" style="width:60%"></div></div>
</div>

<!-- RADIO QURAN -->
<div class="card">
<h2>Radio Quran</h2>
<audio controls autoplay>
<source src="https://stream.radiojar.com/8s5u5tpdtwzuv">
</audio>
</div>

<!-- MOTIVASI -->
<div class="card">
<h2>Motivasi Ramadhan</h2>
<p id="mot"></p>
<button onclick="mot()">Motivasi Baru</button>
</div>

<!-- GAME PAHALA -->
<div class="card">
<h2>Game Pahala</h2>
<p id="game"></p>
<button onclick="game()">Ambil Pahala</button>
</div>

<!-- CHAT -->
<div class="card">
<h2>Chat Ramadhan</h2>
<div class="chatbox" id="chat"></div>
<input id="pesan" placeholder="Tulis pesan...">
<button onclick="kirim()">Kirim</button>
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
<p>Hari 16 ✔️</p>
<p>Hari 17 ✔️</p>
<p>Hari 18 ✔️</p>
<p>Hari 19 ✔️</p>
<p>Hari 20 ✔️</p>
<p>Hari 21 ✔️</p>
<p>Hari 22 ✔️</p>
<p>Hari 23 ✔️</p>
<p>Hari 24 ✔️</p>
<p>Hari 25 ✔️</p>
<p>Hari 26 ✔️</p>
<p>Hari 27 ✔️</p>
<p>Hari 28 ✔️</p>
<p>Hari 29 ✔️</p>
<p>Hari 30 ✔️</p>
</div>

<script>

// LOGIN
function login(){
var n=document.getElementById("nama").value;
document.getElementById("halo").innerHTML=
"Selamat datang "+n+" 🌙";
}

// JAM REALTIME
setInterval(function(){
var d=new Date();
document.getElementById("jam").innerHTML=
d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
},1000);

// DZIKIR
var z=0;
function tambah(){
z++;
document.getElementById("dz").innerHTML=z;
if(z%33==0){
alert("✔️ 33 Dzikir!");
}
}
function reset(){
z=0;
document.getElementById("dz").innerHTML=z;
}

// MOTIVASI
var kata=[
"Puasa melatih sabar",
"Ramadhan bulan ampunan",
"Sedekah dilipatgandakan",
"Doa mustajab",
"Quran penenang hati",
"Perbanyak dzikir",
"Jaga lisan",
"Jaga hati",
"Lailatul Qadar lebih baik",
"Gunakan waktu baik",
"Ramadhan cepat berlalu",
"Pahala dilipatgandakan"
];

function mot(){
document.getElementById("mot").innerHTML=
kata[Math.floor(Math.random()*kata.length)];
}

// GAME PAHALA
function game(){
var p=Math.floor(Math.random()*200);
document.getElementById("game").innerHTML=
"Kamu dapat "+p+" pahala!";
}

// CHAT
function kirim(){
var p=document.getElementById("pesan").value;
var c=document.getElementById("chat");
c.innerHTML += "<p>🌙 "+p+"</p>";
}

// MODE SIANG MALAM
var h=new Date().getHours();
if(h>=6 && h<18){
document.body.style.background="#002200";
}else{
document.body.style.background="black";
}

// WARNA BERKEDIP
setInterval(function(){
var warna=["lime","yellow","cyan","white"];
document.body.style.color=
warna[Math.floor(Math.random()*warna.length)];
},3000);

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
