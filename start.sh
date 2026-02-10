#!/bin/bash

clear

green='\033[1;32m'
nc='\033[0m'

echo -e $green

# ======================================
# ANIMASI LOADING PANJANG
# ======================================
echo "Menghubungkan ke Sistem Ramadhan..."
sleep 1
echo "Memuat database ibadah..."
sleep 1
echo "Menyiapkan terminal hijau..."
sleep 1
echo "Mengaktifkan mode Ramadhan..."
sleep 1
echo "Loading."
sleep 0.3
echo "Loading.."
sleep 0.3
echo "Loading..."
sleep 0.3
echo "Loading...."
sleep 0.3
echo "Loading....."
sleep 0.3

clear
echo -e $green

# ======================================
# LOGO TERMINAL SUPER BESAR
# ======================================
echo "██████╗  █████╗ ███╗   ███╗ █████╗ ██████╗  █████╗ ███╗   ██╗"
echo "██╔══██╗██╔══██╗████╗ ████║██╔══██╗██╔══██╗██╔══██╗████╗  ██║"
echo "██████╔╝███████║██╔████╔██║███████║██║  ██║███████║██╔██╗ ██║"
echo "██╔══██╗██╔══██║██║╚██╔╝██║██╔══██║██║  ██║██╔══██║██║╚██╗██║"
echo "██║  ██║██║  ██║██║ ╚═╝ ██║██║  ██║██████╔╝██║  ██║██║ ╚████║"
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝"
echo ""
echo "🌙🌙🌙 RAMADHAN TERMINAL SYSTEM 🌙🌙🌙"
echo "======================================"
echo ""

# ======================================
# JAM REALTIME
# ======================================
echo "Jam sekarang:"
date +"%H:%M:%S"
echo ""

# ======================================
# DETEKSI WAKTU
# ======================================
jam=$(date +%H)

if [ $jam -ge 4 ] && [ $jam -lt 10 ]; then
  waktu="PAGI"
  pesan="Awali hari dengan niat baik"
elif [ $jam -ge 10 ] && [ $jam -lt 15 ]; then
  waktu="SIANG"
  pesan="Tetap kuat puasanya"
elif [ $jam -ge 15 ] && [ $jam -lt 18 ]; then
  waktu="SORE"
  pesan="Sebentar lagi buka"
else
  waktu="MALAM"
  pesan="Perbanyak ibadah malam"
fi

echo "Waktu terdeteksi: $waktu"
echo "$pesan"
echo ""

# ======================================
# GARIS HIJAU PANJANG
# ======================================
for i in {1..60}
do
echo -n "="
done
echo ""

# ======================================
# MOTIVASI RAMADHAN PANJANG
# ======================================
echo "MOTIVASI RAMADHAN:"
echo "• Puasa melatih kesabaran"
echo "• Ramadhan bulan ampunan"
echo "• Pahala dilipatgandakan"
echo "• Senyum adalah sedekah"
echo "• Sholat tepat waktu"
echo "• Baca Al-Qur'an"
echo "• Jaga lisan"
echo "• Hormati orang tua"
echo "• Hindari marah"
echo "• Perbanyak doa"
echo ""

# ======================================
# EFEK TEKS BERJALAN
# ======================================
teks="Selamat datang di Ramadhan Terminal"
for (( i=0; i<${#teks}; i++ ))
do
echo -n "${teks:$i:1}"
sleep 0.05
done

echo ""
echo ""

# ======================================
# ANIMASI BAR
# ======================================
echo "Memulai sistem:"
for i in {1..30}
do
echo -n "#"
sleep 0.05
done

echo ""
echo ""
echo "Sistem siap digunakan!"
echo ""

read -p "Tekan Enter untuk membuka menu..."

# ======================================
# LOAD MODULES
# ======================================
bash modules/menu.sh
