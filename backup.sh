#!/bin/bash

# 1. Tentukan nama file backup menggunakan format tanggal hari ini
WAKTU=$(date +%Y-%m-%d-%H%M%S)
NAMA_FILE="backup-log-${WAKTU}.tar.gz"

echo "=== MEMULAI PROSES BACKUP LOG ==="

# 2. Kompres file app.log menjadi tar.gz dan simpan di folder logs
tar -czf logs/$NAMA_FILE logs/app.log

echo "Berhasil mengompres log menjadi: $NAMA_FILE"

# 3. Kosongkan isi file app.log yang asli agar disk space kembali lega
cat /dev/null > logs/app.log

echo "File logs/app.log telah dikosongkan untuk menerima log baru."
echo "=== PROSES SELESAI SNGGAT AMAN ==="

