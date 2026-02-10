#!/bin/bash

# ==================================================
# WARNA
# ==================================================
green='\033[1;32m'
lime='\033[38;5;82m'
cyan='\033[1;36m'
yellow='\033[1;33m'
nc='\033[0m'

clear
echo -e $green

# ==================================================
# LOGO BESAR RAMADHAN
# ==================================================
echo "============================================================"
echo " ███╗   ███╗██╗   ██╗██████╗ ██████╗  ██████╗ ████████╗ █████╗ ██╗"
echo " ████╗ ████║██║   ██║██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔══██╗██║"
echo " ██╔████╔██║██║   ██║██████╔╝██████╔╝██║   ██║   ██║   ███████║██║"
echo " ██║╚██╔╝██║██║   ██║██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══██║██║"
echo " ██║ ╚═╝ ██║╚██████╔╝██║  ██║██║  ██║╚██████╔╝   ██║   ██║  ██║██║"
echo " ╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚═╝"
echo "============================================================"
echo "              🌙 RAMADHAN QURAN PLAYER 🌙"
echo "============================================================"
echo ""

# ==================================================
# CEK PACKAGE
# ==================================================
if ! command -v mpv &> /dev/null
then
echo "Install mpv dulu:"
echo "pkg install mpv"
exit
fi

# ==================================================
# TIPS RAMADHAN
# ==================================================
tips=(
"Puasa melatih kesabaran"
"Quran adalah penenang hati"
"Sedekah di Ramadhan dilipatgandakan"
"Sholat tepat waktu itu indah"
"Ramadhan bulan ampunan"
)

echo -e $lime
echo "🌙 Tips Ramadhan Hari Ini:"
echo "${tips[$RANDOM % ${#tips[@]}]}"
echo ""

# ==================================================
# MENU UTAMA
# ==================================================
echo -e $yellow
echo "========== MENU MURROTAL =========="
echo "1. Al-Fatihah"
echo "2. Yasin"
echo "3. Ar-Rahman"
echo "4. Al-Mulk"
echo "5. Al-Ikhlas"
echo "6. An-Nas"
echo "7. Playlist Otomatis"
echo "8. Statistik Ibadah"
echo "9. Motivasi Ramadhan"
echo "0. Kembali"
echo "===================================="
echo ""

read -p "Pilih: " pilih

# ==================================================
# LINK AUDIO
# ==================================================
case $pilih in

1) link="https://server8.mp3quran.net/afs/001.mp3";;
2) link="https://server8.mp3quran.net/afs/036.mp3";;
3) link="https://server8.mp3quran.net/afs/055.mp3";;
4) link="https://server8.mp3quran.net/afs/067.mp3";;
5) link="https://server8.mp3quran.net/afs/112.mp3";;
6) link="https://server8.mp3quran.net/afs/114.mp3";;

# ==================================================
# PLAYLIST MODE
# ==================================================
7)
playlist=(
"https://server8.mp3quran.net/afs/001.mp3"
"https://server8.mp3quran.net/afs/036.mp3"
"https://server8.mp3quran.net/afs/055.mp3"
"https://server8.mp3quran.net/afs/067.mp3"
)

echo "Mode Playlist Aktif..."
for surah in "${playlist[@]}"
do
termux-notification --title "Murrotal" --content "Memutar playlist Quran"
mpv "$surah"
done

read -p "Enter..."
bash modules/menu.sh
exit
;;

# ==================================================
# STATISTIK IBADAH
# ==================================================
8)
clear
echo -e $cyan
echo "===== Statistik Ibadah Ramadhan ====="
echo ""

hari=$(date +%d)
echo "Hari Ramadhan ke: $hari"
echo "Target tilawah: $((hari)) juz"
echo "Sholat wajib: 5/5"
echo "Tarawih: ✔️"
echo "Sedekah: ✔️"
echo ""

read -p "Enter..."
bash modules/menu.sh
exit
;;

# ==================================================
# MOTIVASI
# ==================================================
9)
clear
echo -e $green
kata=(
"Allah mencintai orang yang membaca Quran"
"Setiap ayat adalah cahaya"
"Puasa adalah perisai"
"Ramadhan datang setahun sekali"
"Gunakan waktu sebaik mungkin"
)

for k in "${kata[@]}"
do
echo "🌙 $k"
sleep 2
done

read -p "Enter..."
bash modules/menu.sh
exit
;;

0)
bash modules/menu.sh
exit
;;

esac

# ==================================================
# NOTIF PUTAR
# ==================================================
termux-notification \
--title "Murrotal Quran" \
--content "Bacaan Quran diputar"

# ==================================================
# TIMER MODE
# ==================================================
echo ""
read -p "Aktifkan timer berhenti? (y/n): " t

if [ "$t" = "y" ]; then
read -p "Berapa menit?: " menit
(sleep $(($menit*60)) && pkill mpv) &
fi

# ==================================================
# PUTAR AUDIO
# ==================================================
echo ""
echo "Memutar Quran..."
mpv "$link"

# ==================================================
# PENUTUP
# ==================================================
echo ""
echo -e $lime
echo "Semoga hati tenang 🌙"
echo "Terima kasih sudah tilawah"
echo ""

read -p "Enter..."
bash modules/menu.sh
