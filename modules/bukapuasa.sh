#!/bin/bash

# ==========================================
# WARNA
# ==========================================
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
red='\033[1;31m'
nc='\033[0m'

clear
echo -e $green

# ==========================================
# LOGO PANJANG
# ==========================================
echo "======================================================"
echo "              🌙 COUNTDOWN BUKA PUASA 🌙"
echo "======================================================"
echo "       Sabar • Ikhlas • Pahala Besar"
echo "======================================================"
echo ""

# ==========================================
# CEK TERMUX API
# ==========================================
if ! command -v termux-notification &> /dev/null
then
echo -e $red
echo "Termux API belum terpasang!"
echo "Install: pkg install termux-api"
exit
fi

# ==========================================
# INFO WAKTU
# ==========================================
echo -e $yellow
echo "Hari ini: $(date)"
echo ""

# ==========================================
# INPUT WAKTU MAGHRIB
# ==========================================
echo "Set waktu buka puasa (HH:MM)"
echo "Contoh: 18:00"
echo ""
read -p "Masukkan waktu: " buka

target=$(date -d "$buka" +%s 2>/dev/null)

if [ -z "$target" ]; then
echo "Format salah!"
exit
fi

echo ""
echo "Countdown dimulai..."
sleep 2

# ==========================================
# FUNGSI NOTIF
# ==========================================
notif() {

termux-notification \
--title "🌙 WAKTU BERBUKA" \
--content "Saatnya berbuka puasa!" \
--priority high

termux-tts-speak "Waktu berbuka puasa telah tiba"

for i in {1..8}
do
termux-vibrate -d 300
sleep 1
done

}

# ==========================================
# LOOP COUNTDOWN
# ==========================================
while true
do

now=$(date +%s)
diff=$((target-now))

if [ $diff -le 0 ]; then
notif
break
fi

jam=$((diff/3600))
menit=$(( (diff%3600)/60 ))
detik=$((diff%60))

clear
echo -e $cyan
echo "======================================"
echo "       MENUJU WAKTU BERBUKA"
echo "======================================"
echo ""
printf "Sisa waktu: %02d:%02d:%02d\n" $jam $menit $detik
echo ""

# MOTIVASI RANDOM
kata=(
"Puasa melatih kesabaran"
"Allah mencintai orang sabar"
"Pahala puasa tak terhitung"
"Sedikit lagi waktu berbuka"
"Ramadhan bulan berkah"
"Doa orang puasa mustajab"
"Jaga lisan dan hati"
"Puasa menyehatkan tubuh"
)

r=$((RANDOM%8))
echo "🌙 ${kata[$r]}"
echo ""

sleep 1

done

# ==========================================
# TAMPILAN SETELAH BERBUKA
# ==========================================
clear
echo -e $green
echo "======================================"
echo "         🍽️ SELAMAT BERBUKA 🍽️"
echo "======================================"
echo ""

echo "Doa Berbuka:"
echo "Allahumma laka shumtu..."
echo ""

echo "Makanan Sunnah:"
echo "✔️ Kurma"
echo "✔️ Air putih"
echo "✔️ Makan secukupnya"
echo ""

# ==========================================
# STATISTIK BUKA
# ==========================================
file=~/buka_log.txt

if [ ! -f $file ]; then
echo 0 > $file
fi

count=$(cat $file)
count=$((count+1))
echo $count > $file

echo "Total buka tercatat:"
echo "$count hari"
echo ""

# ==========================================
# TIPS PANJANG
# ==========================================
echo -e $yellow
echo "Tips Berbuka Sehat:"
echo "✔️ Jangan berlebihan"
echo "✔️ Hindari gorengan berlebihan"
echo "✔️ Minum cukup air"
echo "✔️ Makan bergizi"
echo "✔️ Tetap sholat Maghrib"
echo ""

echo "Semoga puasamu diterima 🌙"
echo ""

read -p "Enter untuk kembali..."
bash modules/menu.sh
