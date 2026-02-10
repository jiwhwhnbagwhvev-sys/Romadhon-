# apa fungsi fitur ini ???
Romadhon — Ultimate Ramadhan Toolkit
Romadhon adalah sebuah proyek Termux‑based Ramadhan Toolkit yang berisi lebih dari 20 modul interaktif untuk meningkatkan pengalaman kamu selama bulan suci Ramadhan. Ini bukan hanya satu aplikasi — tapi sebuah ecosystem penuh fitur yang dirancang untuk belajar, bermain, beribadah, dan bersosialisasi di dunia digital.
Repo ini mencakup:
✨ Reminder ibadah
📢 Notifikasi azan otomatis
🎮 Mini‑games Ramadhan yang seru
💬 Chat lokal simulasi internasional
🕌 Dashboard Ramadhan lengkap
📊 Tracker ibadah harian
🌐 Web localhost multi‑fitur
🧠 Quiz, Story mode, Adventure, Ular Tangga Ramadhan
📈 Leaderboard & sistem poin pahala
🔔 Banyak fitur lainnya
📌 Fitur Utama
🕰️ Reminder & Azan
Notifikasi waktu sholat
Suara azan otomatis via termux-api
Pilih azan sesuai jadwal
Mode Azan Tebak Suara untuk latihan pendengaran spiritual

# 🌙 Web Dashboard
Halaman web lokal dengan:
Jam realtime
Motivasi harian
Dzikir counter
Target ibadah
Kalender Ramadhan
Semua dibuka lewat browser pada localhost:PORT

# 🎮 Mini‑Games Interaktif
Quiz Ramadhan (tentang Islam & puasa)
Balap Pahala – tekan cepat untuk kumpulkan poin
Memory Game penuh simbol Islami
Tebak Kata Islami
Ular Tangga Pahala – sampai ke masjid 🕌
Petualangan Ramadhan – jalan di map dan kumpulkan pahala
Story Mode – menentukan pilihan baik / kurang baik
Dan masih banyak lainnya

# 💬 Chat Lokal
Chat room sederhana simulatif
Pilih nama & negara ketika bergabung
Tulis pesan bertema Ramadhan

# 🏆 Leaderboard & Progress
Skor pahala disimpan sementara
Ranking pemain
Level & XP sistem
Event harian pahala

# 🧠 Pembelajaran & Hiburan
Story Mode edukatif
Quiz Kilat
Motivasi Harian
Radio Quran live (di browser)


# 📂 Struktur Proyek
```
romadhan_hub/
├─ modules/
│   ├─ menu.sh
│   ├─ web.sh
│   ├─ ramadhan_sultan.sh
│   ├─ game_ramadhan.sh
│   ├─ ramadhan_adventure.sh
│   ├─ ramadhan_snake.sh
│   ├─ ramadhan_story.sh
│   ├─ ramadhan_azan.sh
│   ├─ ramadhan_chat.sh
│   ├─ ramadhan_hub.sh
│   └─ ... lainnya (file 11–20)
├─ README.md
├─ start.sh             ← script utama
└─ assets/              ← (opsional) suara/mp3/gambar

```
# 💡 Cara Pakai (Termux)
```
pkg update
pkg upgrade 
pkg install termux-api
git clone https://github.com/jiwhwhnbagwhvev-sys/Romadhon-
cd Romadhon-/modules
chmod +x *.sh
bash menu.sh
bash web.sh
