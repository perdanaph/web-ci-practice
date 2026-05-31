# 🚀 DevOps Foundation Cheatsheet - Perdana

Ringkasan pembelajaran dan kumpulan perintah (commands) penting dari dasar Linux hingga Infrastructure as Code (IaC). Gunakan file ini sebagai panduan cepat saat mempraktikkan DevOps di lingkungan WSL (Ubuntu) dan Docker.

---

## 📁 1. Identifikasi OS & Manajemen WSL
Sebelum memulai, penting untuk mengetahui lingkungan Linux yang sedang dihadapi agar tidak salah menggunakan package manager atau salah eksekusi.
* `cat /etc/os-release` - Mengecek identitas, nama, dan versi distribusi Linux yang sedang berjalan.
* `wsl -l -v` - (*Dijalankan di PowerShell*) Menampilkan semua distribusi Linux yang terinstal di WSL beserta versi dan statusnya (aktif/mati).
* `wsl --set-default Ubuntu` - (*Dijalankan di PowerShell*) Mengatur Ubuntu sebagai distribusi Linux utama ketika memanggil perintah `wsl`.
* `wsl -d Ubuntu` - (*Dijalankan di PowerShell*) Masuk secara paksa ke distribusi Ubuntu tertentu secara langsung.
* `cd ~` - Pulang ke *Home Directory* aman milik Linux (`/home/username`). Selalu kerjakan proyek kodingan di sini, bukan di folder `/mnt/c/`.
* `pwd` - *Print Working Directory*, mengecek lokasi folder aktif tempat terminalmu berdiri saat ini.

---

## 🧹 2. Pembersihan Storage & Maintenance Drive C:
Langkah taktis saat ruang penyimpanan Windows tercekik oleh file *Virtual Disk* (`.vhdx`) milik WSL atau Docker yang sifatnya dinamis (membesar otomatis tapi tidak mengecil otomatis).
* `cleanmgr` - (*Windows Run*) Membuka Disk Cleanup untuk membersihkan sisa *Windows Update Cleanup* (wajib klik tombol *Clean up system files*).
* `%temp%` / `temp` / `prefetch` - (*Windows Run*) Folder *cache* sementara aplikasi Windows yang aman untuk dihapus massal menggunakan kombinasi tombol `Ctrl + A` lalu `Shift + Delete`.
* `powercfg.exe /hibernate off` - (*PowerShell Admin*) Mematikan fitur Hibernate Windows untuk langsung mendapatkan kembali ruang disk berukuran belasan Gigabyte (seukuran RAM).
* `docker system prune -a --volumes` - Senjata pembersih DevOps untuk menghapus seluruh kontainer, jaringan, *image*, dan *volume* Docker yang sedang tidak terpakai.

---

## 🐙 3. Git & Autentikasi GitHub Modern
Mengelola riwayat perubahan kode (*version control*) dan menghubungkannya ke *cloud repository* dengan standar keamanan token baru.
* `git init` - Menginisialisasi folder aktif saat ini menjadi repositori Git lokal.
* `git config --global user.name "NamaKamu"` - Mengatur nama kontributor untuk jejak riwayat Git.
* `git config --global user.email "email@contoh.com"` - Mengatur email kontributor untuk jejak riwayat Git.
* `git config --global credential.helper store` - Menyuruh Git mengingat kredensial (Personal Access Token) secara permanen agar tidak perlu mengetik ulang setiap melakukan push.
* `git add .` - Menandai seluruh file baru atau perubahan file untuk siap dimasukkan ke dalam komit (*staging area*).
* `git commit -m "Pesan Komit"` - Menyimpan perubahan secara permanen ke dalam riwayat Git lokal beserta catatan aktivitasnya.
* `git remote add origin <URL_GITHUB>` - Menghubungkan repositori Git lokalmu ke server cloud GitHub di internet.
* `git push -u origin main` - Mengunggah kode dari lokal ke *branch* utama di GitHub (Gunakan *Personal Access Token* classic berizin `repo` sebagai pengganti password biasa).
* `git log` - Melihat riwayat komit yang sudah dibuat beserta detail pembuat dan waktunya.

---

## 📜 4. Bash Scripting (Otomatisasi Dasar)
Menulis skrip shell (`.sh`) agar server bisa melakukan tugas rutin pemeliharaan secara otomatis tanpa campur tangan manusia.
* `touch backup.sh` - Membuat file skrip baru yang masih kosong.
* `chmod +x backup.sh` - Memberikan izin eksekusi (*execute permission*) pada file agar sistem Linux mengizinkannya berjalan sebagai program/skrip otomatis.
* `./backup.sh` - Menjalankan file skrip yang berada di direktori aktif saat ini.
* `nano nama_file` - Membuka editor teks bawaan Linux di dalam terminal (Simpan: `Ctrl + O` -> `Enter` -> Keluar: `Ctrl + X`).
* `tar -czf nama_arsip.tar.gz file_sumber` - Mengompres file atau folder menjadi dokumen arsip kompak berformat `.tar.gz`.
* `cat /dev/null > nama_file` - Trik mengosongkan isi sebuah file secara instan tanpa menghapus filenya (Sangat penting untuk mereset file log yang membengkak).

---

## 🐳 5. Docker & Docker Compose (Containerization)
Membungkus aplikasi beserta seluruh konfigurasinya menjadi sebuah kotak terisolasi (kontainer) yang anti-drama *"It works on my machine"*.
* `docker --version` - Memeriksa apakah Docker Engine dari Windows sudah berhasil menjembatani mesin WSL Ubuntu-mu.
* `docker build -t nama-image:tag .` - Memasak resep `Dockerfile` menjadi sebuah cetakan (*image*) siap pakai. Jangan lupakan tanda titik `.` di akhir perintah!
* `docker run -d -p port_windows:port_container --name nama_bebas nama_image` - Menjalankan kontainer di latar belakang (`-d`) dengan pemetaan port khusus (`-p`).
* `docker stop nama_kontainer` - Menghentikan kontainer yang sedang berjalan di latar belakang.
* `docker rm nama_kontainer` - Menghapus kontainer dari memori sistem setelah dihentikan.
* `docker compose up -d` - Membaca berkas `docker-compose.yml` untuk membangun, menyambungkan jaringan, dan menyalakan seluruh arsitektur kontainer sekaligus dalam satu perintah pendek.

---

## 🏗️ 6. Terraform (Infrastructure as Code - IaC)
Mendefinisikan, membangun, mendokumentasikan, dan menghancurkan infrastruktur server fisik atau virtual murni menggunakan baris kode.
* `terraform init` - Menginisialisasi ruang kerja Terraform lokal dan mengunduh seluruh *provider plugin* yang didefinisikan (seperti plugin Docker atau AWS).
* `terraform plan` - Melakukan simulasi dan analisis untuk melihat rencana perubahan apa saja (tambah, ubah, hapus) yang *akan* dilakukan pada infrastruktur asli.
* `terraform apply` - Mengeksekusi pembangunan infrastruktur secara nyata di lapangan sesuai instruksi kode berkas `.tf` (Ketik `yes` untuk konfirmasi).
* `terraform destroy` - Ritual bersih-bersih DevOps untuk menghancurkan seluruh infrastruktur yang telah dibangun oleh Terraform guna menghindari pembengkakan tagihan biaya (Ketik `yes` untuk konfirmasi).
