#!/bin/bash

# Koneksi ke database admin
DB_HOST="178.128.17.191"
DB_USERNAME="u5_FBmTrzUtQS"
DB_PASSWORD="ux+exilNb^sfk066PX!6kNkS"
DB_NAME="s5_admin"

# Meminta domain dari pengguna
echo "Masukkan domain website (contoh: example.com):"
read DOMAIN

# Menyiapkan direktori web
WEB_DIR="/var/www/html/samp_website"
sudo mkdir -p $WEB_DIR

# Menyalin file website ke direktori
echo "Menyalin file website..."
cat <<EOF > $WEB_DIR/index.php
<?php
echo "<html lang='id'>";
echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Website Reseller Samp</title><style>body{font-family:Arial,sans-serif;text-align:center;padding-top:50px;background-image:url('https://link-to-your-background-image.com');background-size:cover;}.token-input{margin:20px;padding:10px;font-size:18px;}.btn-login{padding:10px 20px;background-color:#28a745;color:white;border:none;cursor:pointer;}.admin-button{padding:10px 20px;background-color:#007bff;color:white;border:none;cursor:pointer;}.running-text{font-size:24px;font-weight:bold;color:#fff;animation:scrollingText 10s linear infinite;}@keyframes scrollingText{0%{left:100%;}100%{left:-100%;}}</style></head>";
echo "<body><div class='running-text'>Welcome Website Reseller Samp By Fajar Official</div><h2>HALO SELAMAT DATANG MASUKKAN TOKEN DI BAWAH INI</h2>";
echo "<input type='text' class='token-input' id='token' placeholder='Masukkan Token' />";
echo "<button class='btn-login' onclick='checkToken()'>Login</button><br><br>";
echo "<button class='admin-button' onclick='location.href=\"admin.php\"'>Halaman Admin</button>";
echo "<script>function checkToken(){const token=document.getElementById('token').value;if(token==='resellersampfajar'){window.location.href='admin.php';}else{alert('Token Salah!');}}</script></body></html>";
?>

EOF

# Menyiapkan file halaman admin
echo "Membuat halaman Admin..."
cat <<EOF > $WEB_DIR/admin.php
<?php
echo "<html lang='id'>";
echo "<head><meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>";
echo "<title>Admin Panel</title><style>body{font-family:Arial,sans-serif;text-align:center;}.input{margin:10px;padding:10px;font-size:16px;}.btn{padding:10px 20px;background-color:#007bff;color:white;border:none;cursor:pointer;}</style></head>";
echo "<body><h2>Login Admin</h2>";
echo "<input type='text' class='input' id='admin-email' placeholder='Email' />";
echo "<input type='password' class='input' id='admin-password' placeholder='Password' />";
echo "<button class='btn' onclick='loginAdmin()'>Login</button>";
echo "<script>function loginAdmin(){const email=document.getElementById('admin-email').value;const password=document.getElementById('admin-password').value;if(email==='fajarstore709@gmail.com'&&password==='fajarstore709'){alert('Login berhasil!');window.location.href='admin-dashboard.php';}else{alert('Email atau password salah!');}}</script>";
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

