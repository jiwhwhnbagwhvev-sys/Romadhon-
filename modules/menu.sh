#!/bin/bash

green='\033[1;32m'
nc='\033[0m'

clear
echo -e $green

# ================= LOGO TERMINAL =================
echo "██████╗  █████╗ ███╗   ███╗"
echo "██╔══██╗██╔══██╗████╗ ████║"
echo "██████╔╝███████║██╔████╔██║"
echo "██╔══██╗██╔══██║██║╚██╔╝██║"
echo "██║  ██║██║  ██║██║ ╚═╝ ██║"
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝"
echo ""
echo "🌙 ROMADHON TERMINAL MENU 🌙"
echo "========================================"
echo ""

while true; do
    # ================= MENU PANJANG =================
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
    # Tambahkan modul 16–20 sesuai repo
    echo "16. Ramadhan Sultan"
    echo "17. Game Ramadhan"
    echo "18. Ramadhan Adventure"
    echo "19. Ramadhan Snake"
    echo "20. Ramadhan Hub (Ultimate)"
    echo "0. Keluar"
    echo ""
    echo "========================================"

    read -p "Pilih menu: " pilih

    case $pilih in
    1) echo "Nawaitu shauma ghadin lillahi ta'ala"; read ;;
    2) echo "Allahumma laka shumtu..."; read ;;
    3) echo "Imsak 04:30, Subuh 04:40, Maghrib 18:00"; read ;;
    4) echo "Tetap semangat ibadah!"; read ;;
    5) for i in {1..33}; do echo "Subhanallah ($i)"; sleep 0.2; done; read ;;
    6) date +"%H:%M:%S"; read ;;
    7) echo "Ramadhan bulan ke-9 Islam"; read ;;
    8) echo "Puasa adalah perisai (HR. Bukhari)"; read ;;
    9) echo "• Sahur cukup"; echo "• Jangan marah"; echo "• Perbanyak doa"; read ;;
    10) bash modules/ramadhan_azan.sh ;;
    11) bash modules/web.sh ;;
    12) for i in {1..33}; do echo "Allahu Akbar ($i)"; sleep 0.2; done; read ;;
    13) echo "Sabar itu indah"; echo "Ikhlas itu tenang"; read ;;
    14) echo "Target hari ini:"; echo "✓ Sholat tepat waktu"; echo "✓ Baca Quran"; read ;;
    15) echo "Jangan lupa sholat 5 waktu!"; read ;;
    16) bash modules/ramadhan_sultan.sh ;;
    17) bash modules/game_ramadhan.sh ;;
    18) bash modules/ramadhan_adventure.sh ;;
    19) bash modules/ramadhan_snake.sh ;;
    20) bash modules/ramadhan_hub.sh ;;
    0) echo "Keluar..."; exit ;;
    *) echo "Pilihan salah!"; sleep 1 ;;
    esac

    # Bersihkan layar sebelum loop ulang
    clear
    echo -e $green
    echo "██████╗  █████╗ ███╗   ███╗"
    echo "██╔══██╗██╔══██╗████╗ ████║"
    echo "██████╔╝███████║██╔████╔██║"
    echo "██╔══██╗██╔══██║██║╚██╔╝██║"
    echo "██║  ██║██║  ██║██║ ╚═╝ ██║"
    echo "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝"
    echo ""
    echo "🌙 ROMADHON TERMINAL MENU 🌙"
    echo "========================================"
done
