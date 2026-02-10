#!/bin/bash

green='\033[1;32m'
clear
echo -e $green
echo "================================================="
echo "          🌙 RAMADHAN STORY MODE 🌙"
echo "================================================="

if ! command -v python &> /dev/null
then
echo "pkg install python"
exit
fi

mkdir -p story_ramadhan
cd story_ramadhan

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ramadhan Story</title>

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
padding:20px;
margin:20px;
border-radius:20px;
box-shadow:0 0 25px lime;
}

button{
padding:10px 20px;
margin:10px;
background:lime;
border:none;
border-radius:10px;
}
</style>
</head>

<body>

<h1>🌙 RAMADHAN STORY 🌙</h1>

<div class="card">
<p id="story"></p>
</div>

<div class="card">
<button onclick="pilih(1)">Pilihan 1</button>
<button onclick="pilih(2)">Pilihan 2</button>
</div>

<div class="card">
<p id="score">Pahala: 0</p>
</div>

<script>

var pahala=0;
var langkah=0;

// cerita
var cerita=[
"Ramadhan tiba. Kamu bangun sahur. Apa yang kamu lakukan?",
"Kamu melihat teman butuh bantuan.",
"Waktu sholat tiba.",
"Kamu punya uang jajan.",
"Malam Lailatul Qadar tiba."
];

var opsi=[
["Makan sahur tepat waktu","Tidur lagi"],
["Membantu teman","Cuekin"],
["Sholat tepat waktu","Tunda"],
["Sedekah","Beli jajan"],
["Ibadah","Main game"]
];

function tampil(){
story.innerHTML=cerita[langkah]+"<br><br>"+
"1. "+opsi[langkah][0]+"<br>"+
"2. "+opsi[langkah][1];
}

tampil();

// pilihan
function pilih(x){

if(x==1){
pahala+=20;
alert("Pilihan baik! +20 pahala ⭐");
}else{
pahala+=5;
alert("Kurang maksimal 😅 +5 pahala");
}

langkah++;

if(langkah>=cerita.length){
ending();
return;
}

score.innerHTML="Pahala: "+pahala;
tampil();
}

// ending
function ending(){
if(pahala>=80){
story.innerHTML="MasyaAllah! Kamu sampai masjid dengan pahala besar 🕌";
}else{
story.innerHTML="Tetap semangat tingkatkan ibadah 🌙";
}
}

// warna animasi
setInterval(()=>{
var w=["lime","yellow","cyan","white"];
document.body.style.color=
w[Math.floor(Math.random()*w.length)];
},1500);

</script>

</body>
</html>
EOF

echo ""
echo "===================================="
echo "Server aktif:"
echo "http://localhost:8000"
echo "===================================="

python -m http.server 8000
