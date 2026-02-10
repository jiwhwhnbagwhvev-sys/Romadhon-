#!/bin/bash

# ===================================================
# WARNA
# ===================================================
green='\033[1;32m'
lime='\033[38;5;82m'
cyan='\033[1;36m'
yellow='\033[1;33m'
nc='\033[0m'

clear
echo -e $green

# ===================================================
# LOGO BESAR
# ===================================================
echo "=============================================================="
echo "████████╗ █████╗ ██████╗  █████╗ ██╗    ██╗██╗██╗  ██╗"
echo "╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██║    ██║██║██║  ██║"
echo "   ██║   ███████║██████╔╝███████║██║ █╗ ██║██║███████║"
echo "   ██║   ██╔══██║██╔══██╗██╔══██║██║███╗██║██║██╔══██║"
echo "   ██║   ██║  ██║██║  ██║██║  ██║╚███╔███╔╝██║██║  ██║"
echo "   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝╚═╝  ╚═╝"
echo "=============================================================="
echo "            🌙 PENGINGAT TARAWIH RAMADHAN 🌙"
echo "=============================================================="
echo ""

# ===================================================
# CEK TERMUX API
# ===================================================
if ! command -v termux-notification &> /dev/null
then
echo "Install dulu:"
echo "pkg install termux-api"
exit
fi

# ===================================================
# TIPS MALAM RAMADHAN
# ===================================================
tips=(
"Sholat tarawih menghapus dosa"
"Ramadhan bulan pahala"
"Malam Ramadhan penuh berkah"
"Sedekah malam lebih utama"
"Perbanyak istighfar"
)

echo -e $lime
echo "🌙 Tips Malam Ini:"
echo "${tips[$RANDOM % ${#tips[@]}]}"
echo ""

# ===================================================
# MENU
# ===================================================
echo -e $yellow
echo "=========== MENU TARAWIH ==========="
echo "1. Set Alarm Tarawih"
echo "2. Dzikir Digital"
echo "3. Mode Malam Tenang"
echo "4. Motivasi Ramadhan"
echo "5. Statistik Ibadah"
echo "0. Kembali"
echo "====================================="
echo ""

read -p "Pilih: " pilih

# ===================================================
# ALARM TARAWIH
# ===================================================
if [ "$pilih" == "1" ]; then

read -p "Jam tarawih (HH:MM): " jam

echo "Menunggu waktu tarawih..."

while true
do
now=$(date +%H:%M)

if [ "$now" == "$jam" ]; then

termux-notification \
--title "🕌 TARAWIH" \
--content "Waktu sholat tarawih tiba"

termux-tts-speak "Waktu sholat tarawih telah tiba"

for i in {1..5}
do
termux-vibrate -d 400
sleep 1
done

echo "🔔 Saatnya ke masjid!"
break
fi

sleep 30
done

fi

# ===================================================
# DZIKIR DIGITAL
# ===================================================
if [ "$pilih" == "2" ]; then

count=0

while true
do
clear
echo -e $green
echo "====== DZIKIR DIGITAL ======"
echo ""
echo "Jumlah: $count"
echo ""
echo "Tekan ENTER tambah"
echo "ketik q lalu ENTER untuk keluar"
echo ""

read input

if [ "$input" == "q" ]; then
break
fi

count=$((count+1))

if [ $((count % 33)) == 0 ]; then
termux-vibrate -d 200
echo "✔️ 33 Dzikir!"
sleep 1
fi

done

fi

# ===================================================
# MODE MALAM TENANG
# ===================================================
if [ "$pilih" == "3" ]; then

clear
echo -e $cyan

kata=(
"Malam Ramadhan indah"
"Hati jadi tenang"
"Langit penuh doa"
"Allah dekat dengan hambaNya"
"Malaikat turun membawa rahmat"
)

for k in "${kata[@]}"
do
echo "🌙 $k"
sleep 3
done

fi

# ===================================================
# MOTIVASI
# ===================================================
if [ "$pilih" == "4" ]; then

clear
for i in {1..10}
do
echo "🌙 Ramadhan penuh ampunan"
sleep 1
done

fi

# ===================================================
# STATISTIK
# ===================================================
if [ "$pilih" == "5" ]; then

clear
echo "===== Statistik Ibadah ====="
echo "Tarawih: ✔️"
echo "Tilawah: ✔️"
echo "Puasa: ✔️"
echo "Sedekah: ✔️"
echo "Dzikir: ✔️"
echo ""

fi

read -p "Enter..."
bash modules/menu.sh
