#!/bin/bash

green='\033[1;32m'
clear
echo -e $green
echo "================================================="
echo "         🌙 ULAR TANGGA RAMADHAN 🌙"
echo "================================================="

if ! command -v python &> /dev/null
then
echo "Install python dulu: pkg install python"
exit
fi

mkdir -p snake_ramadhan
cd snake_ramadhan

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ular Tangga Ramadhan</title>

<style>
body{
background:black;
color:lime;
font-family:Arial;
text-align:center;
}

.board{
display:grid;
grid-template-columns:repeat(10,40px);
gap:5px;
justify-content:center;
margin-top:20px;
}

.cell{
width:40px;
height:40px;
border:1px solid lime;
line-height:40px;
font-size:14px;
}

.player1{background:yellow;color:black;}
.player2{background:cyan;color:black;}
.ladder{background:green;}
.snake{background:red;}

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

<h1>🌙 ULAR TANGGA PAHALA 🌙</h1>

<p id="info"></p>
<p id="score"></p>

<div class="board" id="board"></div>

<button onclick="roll()">🎲 Lempar Dadu</button>

<script>

var cells=[];
var board=document.getElementById("board");

// buat papan 1-100
for(let i=1;i<=100;i++){
let d=document.createElement("div");
d.className="cell";
d.innerHTML=i;
board.appendChild(d);
cells.push(d);
}

// posisi pemain
var p1=1;
var p2=1;
var giliran=1;

// tangga & ular
var ladders={
4:14,
9:31,
20:38,
28:84,
40:59,
63:81
};

var snakes={
17:7,
54:34,
62:19,
64:60,
87:24,
95:75,
99:78
};

function draw(){
cells.forEach(c=>c.className="cell");

cells[p1-1].classList.add("player1");
cells[p2-1].classList.add("player2");

for(let l in ladders){
cells[l-1].classList.add("ladder");
}

for(let s in snakes){
cells[s-1].classList.add("snake");
}

score.innerHTML=
"Pemain 1: "+p1+"<br>"+
"Pemain 2: "+p2;

info.innerHTML="Giliran Pemain "+giliran;
}

draw();

// lempar dadu
function roll(){
let d=Math.floor(Math.random()*6)+1;
alert("Dadu: "+d);

if(giliran==1){
p1+=d;

if(ladders[p1]){
alert("Naik tangga! Dapat pahala ⭐");
p1=ladders[p1];
}

if(snakes[p1]){
alert("Kena ular! Kurang pahala 😅");
p1=snakes[p1];
}

if(p1>=100){
alert("Pemain 1 sampai masjid 🕌 Menang!");
p1=1;p2=1;
}

giliran=2;

}else{

p2+=d;

if(ladders[p2]){
alert("Naik tangga! Dapat pahala ⭐");
p2=ladders[p2];
}

if(snakes[p2]){
alert("Kena ular! 😅");
p2=snakes[p2];
}

if(p2>=100){
alert("Pemain 2 sampai masjid 🕌 Menang!");
p1=1;p2=1;
}

giliran=1;
}

draw();
}

// animasi warna
setInterval(()=>{
let w=["lime","yellow","cyan","white"];
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
