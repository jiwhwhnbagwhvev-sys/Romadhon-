#!/bin/bash

green='\033[1;32m'
clear
echo -e $green
echo "================================================="
echo "        🌙 RAMADHAN ADVENTURE GAME 🌙"
echo "================================================="

if ! command -v python &> /dev/null
then
echo "pkg install python"
exit
fi

mkdir -p adventure
cd adventure

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ramadhan Adventure</title>

<style>
body{
background:black;
color:lime;
font-family:Arial;
text-align:center;
}

.map{
display:grid;
grid-template-columns:repeat(5,60px);
gap:10px;
justify-content:center;
margin-top:20px;
}

.tile{
width:60px;
height:60px;
border:2px solid lime;
line-height:60px;
font-size:24px;
}

.player{background:lime;color:black;}
.masjid{background:green;}
.pahala{background:yellow;color:black;}

button{
padding:10px 20px;
margin:5px;
background:lime;
border:none;
border-radius:10px;
}
</style>
</head>

<body>

<h1>🌙 RAMADHAN ADVENTURE 🌙</h1>

<p id="info">Kumpulkan pahala dan sampai ke masjid!</p>
<p id="score">Pahala: 0</p>

<div class="map" id="map"></div>

<button onclick="move(1)">➡️</button>
<button onclick="move(-1)">⬅️</button>

<script>

var posisi=0;
var pahala=0;

// buat map
var map=document.getElementById("map");
var tiles=[];

for(i=0;i<25;i++){
var d=document.createElement("div");
d.className="tile";
map.appendChild(d);
tiles.push(d);
}

// lokasi pahala & masjid
var pahalaSpot=[5,9,14,18];
var masjidPos=24;

function draw(){
tiles.forEach(t=>{
t.className="tile";
t.innerHTML="";
});

tiles[posisi].classList.add("player");
tiles[posisi].innerHTML="🙂";

pahalaSpot.forEach(p=>{
if(p!=posisi){
tiles[p].classList.add("pahala");
tiles[p].innerHTML="⭐";
}
});

tiles[masjidPos].classList.add("masjid");
tiles[masjidPos].innerHTML="🕌";

score.innerHTML="Pahala: "+pahala;
}

draw();

// gerak
function move(step){
posisi+=step;

if(posisi<0)posisi=0;
if(posisi>24)posisi=24;

// dapat pahala
if(pahalaSpot.includes(posisi)){
pahala+=10;
alert("Dapat pahala +10 ⭐");
}

// sampai masjid
if(posisi==masjidPos){
alert("Alhamdulillah sampai masjid! +50 pahala");
pahala+=50;
posisi=0;
}

draw();
}

// warna animasi
setInterval(()=>{
var w=["lime","yellow","cyan","white"];
document.body.style.color=
w[Math.floor(Math.random()*w.length)];
},2000);

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
