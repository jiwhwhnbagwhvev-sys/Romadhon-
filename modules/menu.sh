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

# ================= LOOP MENU =================
while true; do
    echo ""
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
        1) bash modules/niat_puasa.sh ;;
        2) bash modules/bukapuasa.sh ;;
        3) bash modules/jadwal_imsak.sh ;;
        4) bash modules/motivasi_ramadhan.sh ;;
        5) bash modules/dzikir_digital.sh ;;
        6) bash modules/cek_jam.sh ;;
        7) bash modules/info_ramadhan.sh ;;
        8) bash modules/hadis_puasa.sh ;;
        9) bash modules/tips_puasa.sh ;;
        10) bash modules/ramadhan_azan.sh ;;
        11) bash modules/web.sh ;;         # atau webdash.sh jika itu yang dimaksud
        12) bash modules/tasbih_otomatis.sh ;;
        13) bash modules/kata_islami.sh ;;
        14) bash modules/target_ibadah.sh ;;
        15) bash modules/pengingat_sholat.sh ;;
        16) bash modules/ramadhan_sultan.sh ;;
        17) bash modules/game_ramadhan.sh ;;
        18) bash modules/ramadhan_adventure.sh ;;
        19) bash modules/ramadhan_snake.sh ;;
        20) bash modules/ramadhan_hub.sh ;;
        0) echo "Keluar..."; exit ;;
        *) echo "Pilihan salah!"; sleep 1 ;;
    esac

    # Bersihkan layar & tampilkan logo lagi sebelum menu berikutnya
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
