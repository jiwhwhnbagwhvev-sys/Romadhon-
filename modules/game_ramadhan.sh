#!/bin/bash

green='\033[1;32m'
nc='\033[0m'

clear
echo -e $green
echo "==============================================="
echo "        🌙 GAME RAMADHAN ULTRA 🌙"
echo "==============================================="

# CEK PYTHON
if ! command -v python &> /dev/null
then
echo "pkg install python"
exit
fi

mkdir -p game_ultra
cd game_ultra

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Game Ramadhan Ultra</title>

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

<h1>🌙 GAME RAMADHAN ULTRA 🌙</h1>

<!-- PLAYER -->
<div class="card">
<h2>Setup Pemain</h2>
<input id="p1" placeholder="Pemain 1">
<input id="p2" placeholder="Pemain 2">
<br><br>
<button onclick="start()">Mulai</button>
<p id="turn"></p>
</div>

<!-- SCORE -->
<div class="card">
<h2>Skor Pahala</h2>
<p id="score"></p>
</div>

<!-- QUIZ -->
<div class="card">
<h2>Quiz Ramadhan</h2>
<p id="q"></p>
<button onclick="ans(0)">A</button>
<button onclick="ans(1)">B</button>
<button onclick="ans(2)">C</button>
</div>

<!-- BALAP TAP -->
<div class="card">
<h2>Balap Pahala</h2>
<button onclick="tap()">TAP PAHALA</button>
<p id="tap"></p>
</div>

<!-- TEBAK KATA -->
<div class="card">
<h2>Tebak Kata Islami</h2>
<p id="word"></p>
<input id="guess" placeholder="Jawaban">
<button onclick="check()">Jawab</button>
</div>

<!-- MEMORY GAME -->
<div class="card">
<h2>Memory Pahala</h2>
<div class="grid" id="grid"></div>
</div>

<script>

var pemain=[];
var skor=[0,0];
var giliran=0;

// START
function start(){
pemain[0]=p1.value;
pemain[1]=p2.value;
update();
quiz();
buatGrid();
}

// UPDATE
function update(){
score.innerHTML=
pemain[0]+": "+skor[0]+" pahala<br>"+
pemain[1]+": "+skor[1]+" pahala";

turn.innerHTML="Giliran: "+pemain[giliran];
}

// ================= QUIZ =================
var soal=[
["Puasa rukun Islam ke?","2","3","4",1],
["Kitab Islam?","Quran","Taurat","Zabur",0],
["Sholat malam Ramadhan?","Tarawih","Dhuha","Tahajud",0],
["Zakat fitrah dibayar saat?","Ramadhan","Haji","Idul Adha",0]
];

var cur;
function quiz(){
cur=Math.floor(Math.random()*soal.length);
q.innerHTML=soal[cur][0]+"<br>"+
"A."+soal[cur][1]+"<br>"+
"B."+soal[cur][2]+"<br>"+
"C."+soal[cur][3];
}

function ans(x){
if(x==soal[cur][4]){
alert("Benar +10 pahala");
skor[giliran]+=10;
}else{
alert("Kurang tepat");
}
giliran=(giliran+1)%2;
update();
quiz();
}

// ================= TAP =================
var t=0;
function tap(){
t++;
skor[giliran]+=1;
tap.innerHTML="Tap: "+t;
update();
}

// ================= TEBAK KATA =================
var kata=["PUASA","ZAKAT","IMAN","DOA"];
var jawaban;

function acak(){
jawaban=kata[Math.floor(Math.random()*kata.length)];
word.innerHTML=jawaban.split('').sort(()=>0.5-Math.random()).join('');
}
acak();

function check(){
if(guess.value.toUpperCase()==jawaban){
alert("Benar +15 pahala");
skor[giliran]+=15;
acak();
update();
}else{
alert("Coba lagi");
}
}

// ================= MEMORY =================
var simbol=["🌙","🕌","📿","⭐","🌙","🕌","📿","⭐"];
simbol.sort(()=>0.5-Math.random());

var first=null;

function buatGrid(){
grid.innerHTML="";
simbol.forEach((s,i)=>{
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

// ================= WARNA MERIAH =================
setInterval(()=>{
var warna=["lime","yellow","cyan","white"];
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
echo "Mainkan di browser 🌙"
echo ""

python -m http.server 8000
