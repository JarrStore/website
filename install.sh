#!/bin/bash

# Memastikan script dijalankan dengan hak akses root
if [ "$(id -u)" -ne 0 ]; then
  echo "Harap jalankan skrip ini sebagai root!"
  exit 1
fi

# Meminta input domain dari pengguna
read -p "Masukkan nama domain (contoh: example.com): " domain


# Menyusun file konfigurasi Nginx
nginx_conf="/etc/nginx/sites-available/$domain"
sites_enabled="/etc/nginx/sites-enabled/$domain"

echo "Menyiapkan konfigurasi Nginx untuk domain $domain..."
cat > $nginx_conf <<EOL
server {
    listen 80;
    server_name $domain;

    root /var/www/$domain;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOL

# Membuat direktori untuk website dan menaruh file HTML
echo "Membuat direktori untuk website dan menambahkan file HTML..."
mkdir -p /var/www/$domain
cat > /var/www/$domain/index.html <<EOL
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width,initial-scale=1" name="viewport">
  <title>Market Kebutuhan Hosting By Fajar Official</title>
  <meta content="Fajar Official menyediakan kebutuhan hosting" name="description">
  <meta content="apikey, bot whatsapp, rest api, vps, panel, samp, minecraft By Fajar Official" name="keywords">
  <link href="images/icon.png" rel="icon">
  <link href="images/icon.png" rel="apple-touch-icon">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="https://api.zeeoneofc.my.id/aos/aos.css" rel="stylesheet">
  <link href="https://api.zeeoneofc.my.id/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://api.zeeoneofc.my.id/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="https://api.zeeoneofc.my.id/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="https://api.zeeoneofc.my.id/remixicon/remixicon.css" rel="stylesheet">
  <link href="https://api.zeeoneofc.my.id/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="https://api.zeeoneofc.my.id/css/style.min.css" rel="stylesheet">
  <link rel="shortcut icon" href="https://telegra.ph/file/89d2ff059e7c2dbebfcc1.jpg">
</head>
<body>
  <!-- Website content goes here -->
</body>
</html>
EOL

# Membuat symlink di sites-enabled untuk mengaktifkan konfigurasi
ln -s $nginx_conf $sites_enabled

# Menguji konfigurasi Nginx
echo "Menguji konfigurasi Nginx..."
nginx -t

if [ $? -eq 0 ]; then
  echo "Konfigurasi Nginx valid. Memulai ulang Nginx..."
  systemctl restart nginx
  echo "Website untuk $domain telah berhasil diinstal dan dapat diakses."
else
  echo "Konfigurasi Nginx tidak valid. Mohon periksa kembali."
  exit 1
fi
