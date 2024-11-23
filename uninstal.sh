#!/bin/bash

# Meminta domain dari pengguna
echo "Masukkan domain yang ingin dihapus:"
read DOMAIN

# Menghapus file website
WEB_DIR="/var/www/html/samp_website"
echo "Menghapus direktori website..."
sudo rm -rf $WEB_DIR

# Menghapus konfigurasi Nginx
echo "Menghapus konfigurasi Nginx..."
sudo rm /etc/nginx/sites-available/samp_website
sudo rm /etc/nginx/sites-enabled/samp_website
sudo systemctl restart nginx

# Menghapus SSL
echo "Menghapus sertifikat SSL..."
sudo certbot revoke --cert-path /etc/letsencrypt/live/$DOMAIN/fullchain.pem
sudo certbot delete --cert-name $DOMAIN

# Menampilkan pesan sukses
echo "Website dan konfigurasi SSL berhasil dihapus."
