#!/bin/bash

green='\033[1;32m'
clear
echo -e $green
echo "================================================="
echo "         🌙 RAMADHAN ULTIMATE HUB 🌙"
echo "================================================="

if ! command -v python &> /dev/null
then
echo "Install python dulu: pkg install python"
exit
fi

mkdir -p ramadhan_hub
cd ramadhan_hub

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ramadhan Ultimate Hub</title>

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
padding:15px;
margin:15px;
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

input, select, textarea{
padding:10px;
margin:5px;
border-radius:10px;
width:80%;
}
</style>
</head>

<body>

<h1>🌙 RAMADHAN ULTIMATE HUB 🌙</h1>

<div class="card">
<h2>Mini-Games</h2>
<button onclick="loadGame('story')">Story Mode</button>
<button onclick="loadGame('snake')">Ular Tangga</button>
<button onclick="loadGame('adventure')">Petualangan</button>
<button onclick="loadGame('quiz')">Quiz Kilat</button>
</div>

<div class="card">
<h2>Chat Room</h2>
<input id="nama" placeholder="Nama">
<select id="negara">
<option value="ID">Indonesia</option>
<option value="MY">Malaysia</option>
<option value="SG">Singapore</option>
<option value="TR">Turki</option>
<option value="SA">Saudi</option>
</select>
<br>
<textarea id="chatArea" rows="10" readonly></textarea>
<br>
<input id="msg" placeholder="Tulis pesan">
<button onclick="kirim()">Kirim</button>
</div>

<div class="card">
<h2>Leaderboard</h2>
<p id="leaderboard"></p>
</div>

<div class="card">
<h2>Azan Mode</h2>
<select id="azanSelect">
<option value="fajr">Subuh</option>
<option value="dhuhr">Dzuhur</option>
<option value="asr">Ashar</option>
<option value="maghrib">Maghrib</option>
<option value="isha">Isya</option>
</select>
<button onclick="playAzan()">🔔 Mainkan Azan</button>
</div>

<script>

// =================== MINI GAMES ===================
function loadGame(g){
alert("Memuat game: "+g+" 🌙");
// Bisa dikembangkan ke iframe atau popup mini-game
}

// =================== CHAT ===================
var chatArea=document.getElementById("chatArea");
var user="";
var negara="";
function kirim(){
if(!user){
user=document.getElementById("nama").value;
negara=document.getElementById("negara").value;
if(!user){alert("Isi nama dulu 😅"); return;}
chatArea.value+="["+negara+"] "+user+" bergabung 🌙\n";
}
var m=document.getElementById("msg").value;
if(!m){alert("Tulis pesan 😅"); return;}
chatArea.value+="["+negara+"] "+user+": "+m+"\n";
document.getElementById("msg").value="";
chatArea.scrollTop=chatArea.scrollHeight;
}

// =================== LEADERBOARD ===================
var leaderboardData=[
{name:"Pemain1",pahala:120},
{name:"Pemain2",pahala:80},
{name:"Pemain3",pahala:60},
{name:"Pemain4",pahala:40}
];

function updateLeaderboard(){
leaderboardData.sort((a,b)=>b.pahala-a.pahala);
var text="";
leaderboardData.forEach((p,i)=>{
text+=(i+1)+". "+p.name+" | "+p.pahala+" pahala\n";
});
document.getElementById("leaderboard").innerText=text;
}
updateLeaderboard();

// =================== AZAN ===================
var azanSounds={
"fajr":"https://www.islamicfinder.org/azan/audio/fajr.mp3",
"dhuhr":"https://www.islamicfinder.org/azan/audio/dhuhr.mp3",
"asr":"https://www.islamicfinder.org/azan/audio/asr.mp3",
"maghrib":"https://www.islamicfinder.org/azan/audio/maghrib.mp3",
"isha":"https://www.islamicfinder.org/azan/audio/isha.mp3"
};

function playAzan(){
var sel=document.getElementById("azanSelect").value;
var audio=new Audio(azanSounds[sel]);
audio.play();
alert("Azan "+sel+" dimainkan 🔔");
}

// =================== WARNA NEON ===================
setInterval(()=>{
var w=["lime","yellow","cyan","white"];
document.body.style.color=w[Math.floor(Math.random()*w.length)];
},1500);

</script>

</body>
</html>
EOF

echo ""
echo "===================================="
echo "SERVER ULTIMATE HUB AKTIF 🌙"
echo "http://localhost:8000"
echo "===================================="

python -m http.server 8000
