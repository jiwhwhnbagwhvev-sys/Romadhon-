#!/bin/bash

green='\033[1;32m'
nc='\033[0m'

clear
echo -e $green

# =========================================
# LOGO TERMINAL HIJAU BESAR
# =========================================
echo "██████╗  █████╗ ███╗   ███╗"
echo "██╔══██╗██╔══██╗████╗ ████║"
echo "██████╔╝███████║██╔████╔██║"
echo "██╔══██╗██╔══██║██║╚██╔╝██║"
echo "██║  ██║██║  ██║██║ ╚═╝ ██║"
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝"
echo ""
echo "🌙 RAMADHAN TERMINAL MENU 🌙"
echo "========================================"
echo ""

# =========================================
# ANIMASI LOADING
# =========================================
echo "Memuat Menu Ramadhan..."
sleep 1

# =========================================
# MOTIVASI ATAS
# =========================================
echo "• Bulan penuh berkah"
echo "• Pahala dilipatgandakan"
echo "• Waktu terbaik berubah"
echo ""

# =========================================
# MENU PANJANG
# =========================================
echo "1. Niat Puasa"
echo "2. Doa Berbuka"
echo "3. Jadwal Imsak & Buka"
echo "4. Motivasi Ramadhan"
echo "5. Dzikir Digital"
echo "6. Cek Jam Sekarang"
echo "7. Info Ramadhan"
echo "8. Hadis Puasa"
echo "9. Tips Puasa Kuat"
echo "10. Alarm Azan"
echo "11. Web Dakwah (localhost)"
echo "12. Tasbih Otomatis"
echo "13. Kata Islami"
echo "14. Target Ibadah"
echo "15. Pengingat Sholat"
echo "0. Keluar"
echo ""
echo "========================================"

read -p "Pilih menu: " pilih

case $pilih in

1)
echo "Nawaitu shauma ghadin lillahi ta'ala"
read
bash start.sh
;;

2)
echo "Allahumma laka shumtu..."
read
bash start.sh
;;

3)
echo "Imsak 04:30"
echo "Subuh 04:40"
echo "Maghrib 18:00"
read
bash start.sh
;;

4)
echo "Tetap semangat ibadah!"
read
bash start.sh
;;

5)
for i in {1..33}
do
echo "Subhanallah ($i)"
sleep 0.2
done
read
bash start.sh
;;

6)
date +"%H:%M:%S"
read
bash start.sh
;;

7)
echo "Ramadhan bulan ke-9 Islam"
read
bash start.sh
;;

8)
echo "Puasa adalah perisai (HR. Bukhari)"
read
bash start.sh
;;

9)
echo "• Sahur cukup"
echo "• Jangan marah"
echo "• Perbanyak doa"
read
bash start.sh
;;

10)
bash modules/ramadhan_azan.sh
;;

11)
bash modules/web.sh
;;

12)
for i in {1..33}
do
echo "Allahu Akbar ($i)"
sleep 0.2
done
read
bash start.sh
;;

13)
echo "Sabar itu indah"
echo "Ikhlas itu tenang"
read
bash start.sh
;;

14)
echo "Target hari ini:"
echo "✓ Sholat tepat waktu"
echo "✓ Baca Quran"
read
bash start.sh
;;

15)
echo "Jangan lupa sholat 5 waktu!"
read
bash start.sh
;;

0)
exit
;;

*)
echo "Pilihan salah!"
sleep 1
bash modules/menu.sh
;;

esac
