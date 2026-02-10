#!/bin/bash

green='\033[1;32m'
clear
echo -e $green
echo "================================================="
echo "          🌙 RAMADHAN AZAN MODE 🌙"
echo "================================================="

if ! command -v python &> /dev/null
then
echo "pkg install python"
exit
fi

mkdir -p azan_ramadhan
cd azan_ramadhan

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ramadhan Azan Mode</title>

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

select{
padding:10px;
border-radius:10px;
margin:5px;
}
</style>
</head>

<body>

<h1>🌙 RAMADHAN AZAN MODE 🌙</h1>

<div class="card">
<h2>Pilih Adzan</h2>
<select id="azanSelect">
<option value="fajr">Subuh</option>
<option value="dhuhr">Dzuhur</option>
<option value="asr">Ashar</option>
<option value="maghrib">Maghrib</option>
<option value="isha">Isya</option>
</select>
<br>
<button onclick="playAzan()">🔔 Mainkan Azan</button>
</div>

<div class="card">
<h2>Tebak Suara Adzan</h2>
<button onclick="tebak()">🎵 Dengarkan dan Tebak</button>
<p id="score">Skor: 0</p>
</div>

<script>

var score=0;

// daftar suara azan (contoh: link mp3 lokal)
var azanSounds={
"fajr":"https://www.islamicfinder.org/azan/audio/fajr.mp3",
"dhuhr":"https://www.islamicfinder.org/azan/audio/dhuhr.mp3",
"asr":"https://www.islamicfinder.org/azan/audio/asr.mp3",
"maghrib":"https://www.islamicfinder.org/azan/audio/maghrib.mp3",
"isha":"https://www.islamicfinder.org/azan/audio/isha.mp3"
};

// mainkan azan
function playAzan(){
var sel=document.getElementById("azanSelect").value;
var audio=new Audio(azanSounds[sel]);
audio.play();
alert("Azan "+sel+" dimainkan 🔔");
}

// tebakan
function tebak(){
var keys=Object.keys(azanSounds);
var rand=keys[Math.floor(Math.random()*keys.length)];
var audio=new Audio(azanSounds[rand]);
audio.play();
var ans=prompt("Tebak azan yang dimainkan: (fajr/dhuhr/asr/maghrib/isha)");
if(ans==rand){
alert("Benar! +10 poin ⭐");
score+=10;
}else{
alert("Salah 😅 Jawaban benar: "+rand);
}
document.getElementById("score").innerHTML="Skor: "+score;
}

// animasi warna
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
