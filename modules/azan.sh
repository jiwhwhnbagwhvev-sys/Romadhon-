#!/bin/bash

# ==============================
# WARNA
# ==============================
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
nc='\033[0m'

clear
echo -e $green

# ==============================
# LOGO
# ==============================
echo "==============================================="
echo "            🌙 AZAN RAMADHAN 🌙"
echo "==============================================="
echo ""

# ==============================
# CEK TERMUX API
# ==============================
if ! command -v termux-notification &> /dev/null
then
echo "Termux API belum terpasang!"
echo "Install dulu:"
echo "pkg install termux-api"
exit
fi

# ==============================
# WAKTU SEKARANG
# ==============================
waktu=$(date +%H:%M)
tanggal=$(date)

echo -e $yellow
echo "Tanggal: $tanggal"
echo "Jam sekarang: $waktu"
echo ""

# ==============================
# JADWAL SHOLAT
# ==============================
subuh="04:30"
dzuhur="12:00"
ashar="15:30"
maghrib="18:00"
isya="19:15"

echo -e $blue
echo "Jadwal Sholat Hari Ini"
echo "------------------------"
echo "Subuh   : $subuh"
echo "Dzuhur  : $dzuhur"
echo "Ashar   : $ashar"
echo "Maghrib : $maghrib"
echo "Isya    : $isya"
echo ""

# ==============================
# FUNGSI NOTIF
# ==============================
notif() {
termux-notification \
--title "🌙 Waktu Sholat" \
--content "$1 telah tiba" \
--priority high
}

# ==============================
# FUNGSI SUARA
# ==============================
suara() {
termux-tts-speak "$1 telah tiba"
}

# ==============================
# CEK AZAN
# ==============================
if [ "$waktu" == "$subuh" ]; then
echo "🔊 AZAN SUBUH"
notif "Subuh"
suara "Waktu subuh"
fi

if [ "$waktu" == "$dzuhur" ]; then
echo "🔊 AZAN DZUHUR"
notif "Dzuhur"
suara "Waktu dzuhur"
fi

if [ "$waktu" == "$ashar" ]; then
echo "🔊 AZAN ASHAR"
notif "Ashar"
suara "Waktu ashar"
fi

if [ "$waktu" == "$maghrib" ]; then
echo "🔊 AZAN MAGHRIB"
notif "Maghrib"
suara "Waktu maghrib"
fi

if [ "$waktu" == "$isya" ]; then
echo "🔊 AZAN ISYA"
notif "Isya"
suara "Waktu isya"
fi

# ==============================
# FITUR TAMBAHAN
# ==============================
echo ""
echo "Tips Ramadhan Hari Ini:"
echo "✔️ Perbanyak doa"
echo "✔️ Jaga lisan"
echo "✔️ Baca Al-Quran"
echo "✔️ Sedekah walau sedikit"
echo ""

echo "Motivasi:"
echo "Ramadhan adalah bulan ampunan"
echo "Setiap amal dilipatgandakan"
echo ""

# ==============================
# MODE MONITOR
# ==============================
echo "Aktifkan mode monitor azan?"
echo "1. Ya (cek tiap 1 menit)"
echo "2. Tidak"
echo ""
read -p "Pilih: " m

if [ $m == 1 ]; then
echo "Mode monitor aktif..."
while true
do
now=$(date +%H:%M)

if [ "$now" == "$subuh" ]; then notif "Subuh"; suara "Subuh"; fi
if [ "$now" == "$dzuhur" ]; then notif "Dzuhur"; suara "Dzuhur"; fi
if [ "$now" == "$ashar" ]; then notif "Ashar"; suara "Ashar"; fi
if [ "$now" == "$maghrib" ]; then notif "Maghrib"; suara "Maghrib"; fi
if [ "$now" == "$isya" ]; then notif "Isya"; suara "Isya"; fi

sleep 60
done
fi

echo ""
read -p "Enter untuk kembali..."
bash modules/menu.sh
