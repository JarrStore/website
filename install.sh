#!/bin/bash

# Meminta domain dari pengguna
echo "Masukkan domain website (contoh: example.com):"
read DOMAIN

# Koneksi ke database admin
DB_HOST="178.128.17.191"
DB_USERNAME="u5_FBmTrzUtQS"
DB_PASSWORD="ux+exilNb^sfk066PX!6kNkS"
DB_NAME="s5_admin"

# Menyiapkan direktori web
WEB_DIR="/var/www/html/samp_website"
sudo mkdir -p $WEB_DIR

# Menyalin file website ke direktori
echo "Menyalin file website..."
cat <<EOF > $WEB_DIR/index.php
<?php
echo "<html lang='id'>";
echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Website Reseller Samp</title><style>body{font-family:Arial,sans-serif;text-align:center;padding-top:50px;background-color:#f0f0f0;}.token-input{margin:20px;padding:10px;font-size:18px;}.btn-login{padding:10px 20px;background-color:#28a745;color:white;border:none;cursor:pointer;}.admin-button{padding:10px 20px;background-color:#007bff;color:white;border:none;cursor:pointer;}</style></head>";
echo "<body><h1>SELAMAT DATANG DI RESELLER SAMP</h1><h2>Silakan Masukkan Token di Bawah Ini</h2>";
echo "<input type='text' class='token-input' id='token' placeholder='Masukkan Token' />";
echo "<button class='btn-login' onclick='checkToken()'>Login</button><br><br>";
echo "<button class='admin-button' onclick='location.href=\"admin.php\"'>Halaman Admin</button>";
echo "<script>function checkToken(){const token=document.getElementById('token').value;if(token==='fajarsamp'){window.location.href='login.php';}else{alert('Token Salah!');}}</script></body></html>";
?>
EOF

# Menyiapkan file halaman login
echo "Membuat halaman Login..."
cat <<EOF > $WEB_DIR/login.php
<?php
echo "<html lang='id'>";
echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Login Pterodactyl</title><style>body{font-family:Arial,sans-serif;text-align:center;padding-top:50px;}.input{margin:10px;padding:10px;font-size:16px;}.btn{padding:10px 20px;background-color:#007bff;color:white;border:none;cursor:pointer;}</style></head>";
echo "<body><h2>Login Pterodactyl</h2>";
echo "<input type='text' class='input' id='username' placeholder='Username' />";
echo "<input type='password' class='input' id='password' placeholder='Password' />";
echo "<button class='btn' onclick='loginPterodactyl()'>Login</button>";
echo "<script>function loginPterodactyl(){const username=document.getElementById('username').value;const password=document.getElementById('password').value;if(username==='pterodactyl_user'&&password==='pterodactyl_pass'){window.location.href='dashboard.php';}else{alert('Username atau password salah!');}}</script>";
echo "</body></html>";
?>
EOF

# Menyiapkan file halaman dashboard
echo "Membuat halaman Dashboard..."
cat <<EOF > $WEB_DIR/dashboard.php
<?php
echo "<html lang='id'>";
echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Dashboard Reseller Samp</title><style>body{font-family:Arial,sans-serif;text-align:center;padding-top:50px;background-color:#f8f9fa;}.btn{padding:10px 20px;background-color:#28a745;color:white;border:none;cursor:pointer;}</style></head>";
echo "<body><h2>RESELLER SAMP BY FAJAR OFFICIAL</h2><p>Silakan tekan tombol di bawah ini:</p>";
echo "<button class='btn' onclick='window.location.href=\"create_samp.php\"'>TOMBOL CREATE SAMP</button><br><br>";
echo "<button class='btn' onclick='window.location.href=\"create_panel.php\"'>TOMBOL CREATE PANEL</button><br><br>";
echo "<button class='btn' onclick='window.location.href=\"https://wa.me/+6283157602477\"'>WhatsApp Support</button><br><br>";
echo "<button class='btn' onclick='window.location.href=\"https://mail.google.com/mail/?view=cm&fs=1&to=fajarstore709@gmail.com\"'>Email Support</button><br><br>";
echo "<button class='btn' onclick='window.location.href=\"admin.php\"'>Halaman Admin</button>";
echo "</body></html>";
?>
EOF

# Menyiapkan file halaman admin
echo "Membuat halaman Admin..."
cat <<EOF > $WEB_DIR/admin.php
<?php
echo "<html lang='id'>";
echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Admin Panel</title><style>body{font-family:Arial,sans-serif;text-align:center;}.input{margin:10px;padding:10px;font-size:16px;}.btn{padding:10px 20px;background-color:#007bff;color:white;border:none;cursor:pointer;}</style></head>";
echo "<body><h2>Halaman Admin</h2>";
echo "<button class='btn' onclick='location.href=\"settings.php\"'>Settings</button>";
echo "</body></html>";
?>
EOF

# Menyiapkan file settings.php untuk pengaturan domain, ptla, ptlc, egg_id
echo "Membuat halaman Settings..."
cat <<EOF > $WEB_DIR/settings.php
<?php
echo "<html lang='id'>";
echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Settings Panel</title><style>body{font-family:Arial,sans-serif;text-align:center;padding-top:50px;}.input{margin:10px;padding:10px;font-size:16px;}.btn{padding:10px 20px;background-color:#007bff;color:white;border:none;cursor:pointer;}</style></head>";
echo "<body><h3>Masukkan Data untuk Panel Pterodactyl</h3>";
echo "<form method='POST' action='admin_process.php'>";
echo "<input type='text' class='input' name='domain' placeholder='Masukkan Domain' required /><br><br>";
echo "<input type='text' class='input' name='ptla' placeholder='Masukkan PTLA' required /><br><br>";
echo "<input type='text' class='input' name='ptlc' placeholder='Masukkan PTLC' required /><br><br>";
echo "<input type='text' class='input' name='egg_id' placeholder='Masukkan Egg ID' required /><br><br>";
echo "<button class='btn' type='submit'>Simpan Pengaturan</button>";
echo "</form>";
echo "</body></html>";
?>
EOF

# Menyiapkan file create_panel.php untuk membuat panel
echo "Membuat file create_panel.php..."
cat <<EOF > $WEB_DIR/create_panel.php
<?php
echo "<html lang='id'>";
echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Panel Pterodactyl</title><style>body{font-family:Arial,sans-serif;text-align:center;padding-top:50px;}.input{margin:10px;padding:10px;font-size:16px;}.btn{padding:10px 20px;background-color:#007bff;color:white;border:none;cursor:pointer;}</style></head>";
echo "<body><h3>Masukkan Data untuk Membuat Panel</h3>";
echo "<form method='POST' action='create_panel_process.php'>";
echo "<input type='text' class='input' name='domain' placeholder='Masukkan Domain' required /><br><br>";
echo "<input type='text' class='input' name='ptla' placeholder='Masukkan PTLA' required /><br><br>";
echo "<input type='text' class='input' name='ptlc' placeholder='Masukkan PTLC' required /><br><br>";
echo "<input type='text' class='input' name='egg_id' placeholder='Masukkan Egg ID' required /><br><br>";
echo "<button class='btn' type='submit'>Buat Panel</button>";
echo "</form>";
echo "</body></html>";
?>
EOF

# Menyiapkan file create_samp.php untuk membuat server SAMP
echo "Membuat file create_samp.php..."
cat <<EOF > $WEB_DIR/create_samp.php
<?php
echo "<html lang='id'>";
echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Create SAMP Server</title><style>body{font-family:Arial,sans-serif;text-align:center;padding-top:50px;}.input{margin:10px;padding:10px;font-size:16px;}.btn{padding:10px 20px;background-color:#007bff;color:white;border:none;cursor:pointer;}</style></head>";
echo "<body><h3>Masukkan Data untuk Membuat Server SAMP</h3>";
echo "<form method='POST' action='create_samp_process.php'>";
echo "<input type='text' class='input' name='username' placeholder='Masukkan Username' required /><br><br>";
echo "<input type='text' class='input' name='server_name' placeholder='Masukkan Nama Server' required /><br><br>";
echo "<button class='btn' type='submit'>Buat Server SAMP</button>";
echo "</form>";
echo "</body></html>";
?>
EOF

# Mengonfigurasi Nginx untuk domain ini
echo "Mengonfigurasi Nginx untuk domain $DOMAIN..."
sudo cat <<EOF > /etc/nginx/sites-available/samp_website
server {
    listen 80;
    server_name $DOMAIN;

    root $WEB_DIR;
    index index.php;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.3-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF

# Mengaktifkan situs Nginx
sudo ln -s /etc/nginx/sites-available/samp_website /etc/nginx/sites-enabled/
sudo systemctl restart nginx

# Mengaktifkan SSL menggunakan Certbot
echo "Mengaktifkan SSL untuk domain $DOMAIN menggunakan Certbot..."
sudo certbot --nginx -d $DOMAIN --non-interactive --agree-tos --email fajarstore709@gmail.com

# Menampilkan pesan sukses
echo "Website berhasil diinstal dan dapat diakses di https://$DOMAIN"
