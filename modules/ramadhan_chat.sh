#!/bin/bash

green='\033[1;32m'
clear
echo -e $green
echo "================================================="
echo "         🌙 RAMADHAN CHAT MULTIPLAYER 🌙"
echo "================================================="

if ! command -v python &> /dev/null
then
echo "pkg install python"
exit
fi

mkdir -p chat_ramadhan
cd chat_ramadhan

cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
<title>Ramadhan Chat</title>

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

input, select, textarea{
padding:10px;
margin:5px;
border-radius:10px;
width:80%;
}
</style>
</head>

<body>

<h1>🌙 RAMADHAN CHAT 🌙</h1>

<div class="card">
<h2>Nama & Negara</h2>
<input id="nama" placeholder="Nama kamu">
<select id="negara">
<option value="ID">Indonesia</option>
<option value="MY">Malaysia</option>
<option value="SG">Singapore</option>
<option value="TR">Turki</option>
<option value="SA">Saudi</option>
</select>
<br>
<button onclick="join()">Gabung Chat</button>
</div>

<div class="card">
<h2>Chat Room</h2>
<textarea id="chatArea" rows="10" readonly></textarea>
<br>
<input id="msg" placeholder="Tulis pesan">
<button onclick="kirim()">Kirim</button>
</div>

<script>

var user="";
var negara="";
var chatArea=document.getElementById("chatArea");

// join
function join(){
user=document.getElementById("nama").value;
negara=document.getElementById("negara").value;
chatArea.value+="["+negara+"] "+user+" bergabung 🌙\n";
}

// kirim pesan
function kirim(){
var m=document.getElementById("msg").value;
if(!m){alert("Tulis pesan dulu 😅"); return;}
chatArea.value+="["+negara+"] "+user+": "+m+"\n";
document.getElementById("msg").value="";
chatArea.scrollTop=chatArea.scrollHeight;
}

// warna animasi
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
echo "Server aktif:"
echo "http://localhost:8000"
echo "===================================="

python -m http.server 8000
