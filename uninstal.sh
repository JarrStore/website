#!/bin/bash

# Memastikan script dijalankan dengan hak akses root
if [ "$(id -u)" -ne 0 ]; then
  echo "Harap jalankan skrip ini sebagai root!"
  exit 1
fi

# Meminta input domain dari pengguna
read -p "Masukkan nama domain yang akan dihapus (contoh: example.com): " domain

# Menghapus konfigurasi Nginx
echo "Menghapus konfigurasi Nginx untuk domain $domain..."
rm -f /etc/nginx/sites-available/$domain
rm -f /etc/nginx/sites-enabled/$domain

# Menghapus file website
echo "Menghapus file website di /var/www/$domain..."
rm -rf /var/www/$domain

# Memuat ulang Nginx
echo "Memuat ulang Nginx..."
nginx -t
if [ $? -eq 0 ]; then
  systemctl reload nginx
  echo "Website untuk $domain berhasil dihapus."
else
  echo "Ada masalah saat memuat ulang Nginx. Periksa konfigurasi Nginx."
  exit 1
fi
