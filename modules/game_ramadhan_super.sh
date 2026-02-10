#!/bin/bash

green='\033[1;32m'
nc='\033[0m'

clear
echo -e $green
echo "================================================="
echo "        🌙 GAME RAMADHAN SUPER EDITION 🌙"
echo "================================================="

# cek python
if ! command -v python &> /dev/null
then
echo "Install python dulu: pkg install python"
exit
fi

mkdir -p game_super
cd game_super

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Game Ramadhan Super</title>

<style>
body{
background:black;
color:lime;
font-family:Arial;
text-align:center;
transition:0.5s;
}

.card{
border:2px solid lime;
margin:15px;
padding:15px;
border-radius:20px;
box-shadow:0 0 20px lime;
}

button{
padding:10px 20px;
margin:5px;
background:lime;
border:none;
border-radius:10px;
font-size:16px;
}

input{
padding:10px;
border-radius:10px;
}

.grid{
display:grid;
grid-template-columns:repeat(4,70px);
gap:10px;
justify-content:center;
}

.box{
width:70px;
height:70px;
background:lime;
color:black;
font-size:24px;
line-height:70px;
cursor:pointer;
}

</style>
</head>

<body>

<h1>🌙 GAME RAMADHAN SUPER 🌙</h1>

<div class="card">
<h2>Nama Pemain</h2>
<input id="p1" placeholder="Pemain 1">
<input id="p2" placeholder="Pemain 2">
<br><br>
<button onclick="start()">Mulai Game</button>
<p id="turn"></p>
</div>

<div class="card">
<h2>Skor Pahala</h2>
<p id="score"></p>
</div>

<!-- QUIZ -->
<div class="card">
<h2>Quiz Islami</h2>
<p id="q"></p>
<button onclick="jawab(0)">A</button>
<button onclick="jawab(1)">B</button>
<button onclick="jawab(2)">C</button>
</div>

<!-- TAP -->
<div class="card">
<h2>Balap Pahala</h2>
<button onclick="tap()">TAP CEPAT</button>
<p id="tap"></p>
</div>

<!-- TEBAK KATA -->
<div class="card">
<h2>Tebak Kata</h2>
<p id="acak"></p>
<input id="tebak">
<button onclick="cek()">Jawab</button>
</div>

<!-- MEMORY -->
<div class="card">
<h2>Memory Game</h2>
<div class="grid" id="grid"></div>
</div>

<!-- MISI -->
<div class="card">
<h2>Misi Ramadhan</h2>
<p id="misi"></p>
<button onclick="misiDone()">Selesaikan</button>
</div>

<script>

var pemain=[];
var skor=[0,0];
var giliran=0;

// START
function start(){
pemain=[p1.value,p2.value];
update();
quiz();
acakKata();
buatGrid();
misiBaru();
}

// UPDATE
function update(){
score.innerHTML=
pemain[0]+" : "+skor[0]+" pahala<br>"+
pemain[1]+" : "+skor[1]+" pahala";

turn.innerHTML="Giliran: "+pemain[giliran];
}

// ================= QUIZ =================
var soal=[
["Puasa rukun Islam ke?","2","3","4",1],
["Kitab Islam?","Quran","Injil","Taurat",0],
["Sholat malam Ramadhan?","Tarawih","Subuh","Dzuhur",0],
["Zakat fitrah saat?","Ramadhan","Haji","Safar",0],
["Puasa wajib berapa hari?","29-30","10","7",0]
];

var cur;
function quiz(){
cur=Math.floor(Math.random()*soal.length);
q.innerHTML=
soal[cur][0]+"<br>"+
"A."+soal[cur][1]+"<br>"+
"B."+soal[cur][2]+"<br>"+
"C."+soal[cur][3];
}

function jawab(x){
if(x==soal[cur][4]){
alert("Benar +10");
skor[giliran]+=10;
}else{
alert("Salah");
}
giliran=(giliran+1)%2;
update();
quiz();
}

// ================= TAP =================
var tapCount=0;
function tap(){
tapCount++;
skor[giliran]+=1;
tap.innerHTML="Tap: "+tapCount;
update();
}

// ================= TEBAK KATA =================
var words=["PUASA","IMAN","TAQWA","ZAKAT","DOA"];
var ans;

function acakKata(){
ans=words[Math.floor(Math.random()*words.length)];
acak.innerHTML=ans.split('').sort(()=>0.5-Math.random()).join('');
}

function cek(){
if(tebak.value.toUpperCase()==ans){
alert("Benar +15");
skor[giliran]+=15;
acakKata();
update();
}else{
alert("Coba lagi");
}
}

// ================= MEMORY =================
var simbol=["🌙","⭐","🕌","📿","🌙","⭐","🕌","📿"];
simbol.sort(()=>0.5-Math.random());

var first=null;

function buatGrid(){
grid.innerHTML="";
simbol.forEach(s=>{
var d=document.createElement("div");
d.className="box";
d.dataset.val=s;
d.onclick=function(){
this.innerHTML=s;
if(!first){
first=this;
}else{
if(first.dataset.val==this.dataset.val){
skor[giliran]+=5;
}else{
setTimeout(()=>{
this.innerHTML="";
first.innerHTML="";
},500);
}
first=null;
update();
}
};
grid.appendChild(d);
});
}

// ================= MISI =================
var daftarMisi=[
"Baca Qur'an",
"Sedekah",
"Sholat tepat waktu",
"Berbuat baik",
"Membantu orang tua"
];

function misiBaru(){
misi.innerHTML=
daftarMisi[Math.floor(Math.random()*daftarMisi.length)];
}

function misiDone(){
skor[giliran]+=20;
alert("Misi selesai +20");
update();
misiBaru();
}

// ================= WARNA RAMADHAN =================
setInterval(()=>{
var warna=["lime","cyan","yellow","white"];
document.body.style.color=
warna[Math.floor(Math.random()*warna.length)];
},2000);

</script>

</body>
</html>
EOF

echo ""
echo "===================================="
echo "Server aktif di:"
echo "http://localhost:8000"
echo "===================================="
echo ""

python -m http.server 8000
