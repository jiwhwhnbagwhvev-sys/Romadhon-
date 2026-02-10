#!/bin/bash

# =========================================
# WARNA
# =========================================
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
cyan='\033[1;36m'
red='\033[1;31m'
nc='\033[0m'

file=~/data_puasa.txt

clear
echo -e $green

# =========================================
# LOGO PANJANG
# =========================================
echo "===================================================="
echo "              🌙 TRACKER PUASA RAMADHAN 🌙"
echo "===================================================="
echo "      Pantau Ibadah • Konsisten • Istiqomah"
echo "===================================================="
echo ""

# =========================================
# BUAT FILE JIKA BELUM ADA
# =========================================
if [ ! -f $file ]; then
for i in {1..30}
do
echo "0" >> $file
done
fi

# =========================================
# MENU
# =========================================
echo "1. Tandai puasa hari ini"
echo "2. Lihat progres lengkap"
echo "3. Grafik puasa"
echo "4. Target ibadah"
echo "5. Motivasi panjang"
echo "6. Reset data"
echo "7. Kembali"
echo ""
read -p "Pilih: " pilih

# =========================================
# TANDAI PUASA
# =========================================
if [ $pilih == 1 ]; then

read -p "Hari ke berapa (1-30): " h
sed -i "${h}s/.*/1/" $file

echo ""
echo "✅ Puasa hari ke-$h dicatat!"
sleep 2

fi

# =========================================
# PROGRES LENGKAP
# =========================================
if [ $pilih == 2 ]; then

clear
echo -e $blue
echo "==============================="
echo "        PROGRES PUASA"
echo "==============================="

count=0
hari=1

while read line
do
if [ $line == 1 ]; then
echo "Hari $hari : ✅ Puasa"
count=$((count+1))
else
echo "Hari $hari : ❌ Belum"
fi
hari=$((hari+1))
done < $file

echo ""
echo "Total: $count / 30 hari"
persen=$((count*100/30))
echo "Progres: $persen %"
sleep 5

fi

# =========================================
# GRAFIK TEKS
# =========================================
if [ $pilih == 3 ]; then

clear
echo -e $cyan
echo "==============================="
echo "        GRAFIK PUASA"
echo "==============================="

count=0
while read l
do
if [ $l == 1 ]; then
echo "█"
count=$((count+1))
else
echo "░"
fi
done < $file

echo ""
echo "Legenda:"
echo "█ = Puasa"
echo "░ = Belum"
sleep 5

fi

# =========================================
# TARGET IBADAH
# =========================================
if [ $pilih == 4 ]; then

clear
echo -e $yellow

echo "Target Ramadhan:"
echo "✔️ Sholat 5 waktu"
echo "✔️ Tarawih"
echo "✔️ Baca Quran"
echo "✔️ Sedekah"
echo "✔️ Dzikir"
echo "✔️ Jaga lisan"
echo ""

read -p "Enter..."
fi

# =========================================
# MOTIVASI SUPER PANJANG
# =========================================
if [ $pilih == 5 ]; then

clear
echo -e $green
echo "================================"
echo "       MOTIVASI RAMADHAN"
echo "================================"
echo ""

kata=(
"Ramadhan bulan penuh berkah"
"Setiap amal dilipatgandakan"
"Puasa melatih sabar"
"Allah mencintai orang sabar"
"Sedekah membuka rezeki"
"Baca Quran menenangkan hati"
"Sholat adalah cahaya"
"Ramadhan waktu berubah lebih baik"
"Puasa menyehatkan"
"Doa orang puasa mustajab"
"Jaga lisan dan hati"
"Perbanyak istighfar"
"Ramadhan bulan ampunan"
)

for k in "${kata[@]}"
do
echo "🌙 $k"
sleep 1
done

read -p "Enter..."
fi

# =========================================
# RESET DATA
# =========================================
if [ $pilih == 6 ]; then

rm $file
echo "Data direset!"
sleep 2

fi

# =========================================
# KEMBALI
# =========================================
bash modules/menu.sh
