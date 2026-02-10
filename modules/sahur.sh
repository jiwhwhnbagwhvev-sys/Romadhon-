#!/bin/bash

# =====================================
# WARNA
# =====================================
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
red='\033[1;31m'
nc='\033[0m'

clear
echo -e $green

# =====================================
# LOGO PANJANG
# =====================================
echo "===================================================="
echo "              🌙 ALARM SAHUR RAMADHAN 🌙"
echo "===================================================="
echo "      Bangun Sahur • Ibadah Lancar • Puasa Kuat"
echo "===================================================="
echo ""

# =====================================
# CEK TERMUX API
# =====================================
if ! command -v termux-notification &> /dev/null
then
echo -e $red
echo "Termux API belum terinstall!"
echo "Install dulu:"
echo "pkg install termux-api"
exit
fi

# =====================================
# TANGGAL & JAM
# =====================================
echo -e $yellow
echo "Hari ini: $(date)"
echo ""

# =====================================
# INPUT WAKTU SAHUR
# =====================================
echo -e $blue
echo "Set Alarm Sahur"
echo "Format 24 jam (HH:MM)"
echo "Contoh: 03:30"
echo ""

read -p "Masukkan waktu sahur: " sahur

echo ""
echo "Alarm disetel jam $sahur"
echo ""

# =====================================
# HITUNG MUNDUR
# =====================================
target=$(date -d "$sahur" +%s 2>/dev/null)

if [ -z "$target" ]; then
echo "Format salah!"
exit
fi

echo "Mengaktifkan hitung mundur..."
sleep 2

# =====================================
# FUNGSI ALARM
# =====================================
alarm_sahur() {

clear
echo -e $green
echo "================================"
echo "       🔔 WAKTU SAHUR 🔔"
echo "================================"
echo ""

termux-notification \
--title "🌙 SAHUR" \
--content "Bangun sahur sekarang!" \
--priority high

termux-tts-speak "Bangun sahur sekarang. Waktu sahur telah tiba"

for i in {1..10}
do
termux-vibrate -d 400
sleep 1
done

echo ""
echo "Minum air yang cukup"
echo "Niat puasa ya!"
echo ""
}

# =====================================
# LOOP MONITOR
# =====================================
while true
do

now=$(date +%s)
diff=$((target-now))

if [ $diff -le 0 ]; then
alarm_sahur
break
fi

jam=$((diff/3600))
menit=$(( (diff%3600)/60 ))
detik=$((diff%60))

clear
echo -e $green
echo "======================================"
echo "        HITUNG MUNDUR SAHUR"
echo "======================================"
echo ""
echo "Menuju sahur:"
printf "%02d jam %02d menit %02d detik\n" $jam $menit $detik
echo ""
echo "Tetap semangat puasa!"
echo ""

sleep 1

done

# =====================================
# MOTIVASI PANJANG
# =====================================
clear
echo -e $yellow

echo "======================================"
echo "        MOTIVASI SAHUR"
echo "======================================"
echo ""

motivasi=(
"Sahur itu berkah"
"Puasa melatih kesabaran"
"Ramadhan bulan ampunan"
"Allah mencintai orang sabar"
"Puasa menyehatkan tubuh"
"Setiap amal dilipatgandakan"
)

for m in "${motivasi[@]}"
do
echo "✔️ $m"
sleep 1
done

echo ""
echo "======================================"
echo "STATISTIK PUASA"
echo "======================================"
echo ""

# =====================================
# TRACKER SEDERHANA
# =====================================
file=~/puasa.txt

if [ ! -f $file ]; then
echo 0 > $file
fi

count=$(cat $file)
count=$((count+1))
echo $count > $file

echo "Total sahur tercatat:"
echo "$count hari"
echo ""

# =====================================
# TIPS SEHAT
# =====================================
echo "Tips Sahur Sehat:"
echo "✔️ Karbohidrat kompleks"
echo "✔️ Protein cukup"
echo "✔️ Kurangi gula berlebih"
echo "✔️ Perbanyak air putih"
echo "✔️ Buah dan sayur"
echo ""

# =====================================
# DOA
# =====================================
echo "Doa Sahur:"
echo "Nawaitu shauma ghodin..."
echo ""

echo "Semoga puasamu lancar 🌙"
echo ""

read -p "Enter untuk kembali..."
bash modules/menu.sh
