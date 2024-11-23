#!/bin/bash

# Koneksi ke database admin
DB_HOST="178.128.17.191"
DB_USERNAME="u5_FBmTrzUtQS"
DB_PASSWORD="ux+exilNb^sfk066PX!6kNkS"
DB_NAME="s5_admin"

# Mengambil domain
echo "Masukkan domain website (contoh: example.com):"
read DOMAIN

# Menyiapkan Direktori Web
WEB_DIR="/var/www/html/samp_website"
sudo mkdir -p $WEB_DIR

# Menyalin file website ke direktori
echo "Menyalin file website..."
cat <<EOF > $WEB_DIR/index.html
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Website Reseller Samp</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 50px;
            background-image: url('https://link-to-your-background-image.com');
            background-size: cover;
        }
        .token-input {
            margin: 20px;
            padding: 10px;
            font-size: 18px;
        }
        .btn-login {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        .admin-button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .running-text {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            animation: scrollingText 10s linear infinite;
        }
        @keyframes scrollingText {
            0% { left: 100%; }
            100% { left: -100%; }
        }
    </style>
</head>
<body>
    <div class="running-text">Welcome Website Reseller Samp By Fajar Official</div>
    <h2>HALO SELAMAT DATANG MASUKKAN TOKEN DI BAWAH INI</h2>
    <input type="text" class="token-input" id="token" placeholder="Masukkan Token" />
    <button class="btn-login" onclick="checkToken()">Login</button>
    <br><br>
    <button class="admin-button" onclick="location.href='admin.html'">Halaman Admin</button>

    <script>
        function checkToken() {
            const token = document.getElementById('token').value;
            if (token === 'resellersampfajar') {
                window.location.href = 'admin.html';
            } else {
                alert('Token Salah!');
            }
        }
    </script>
</body>
</html>
EOF

# Menyusun file untuk halaman admin
echo "Membuat halaman Admin..."
cat <<EOF > $WEB_DIR/admin.html
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .input {
            margin: 10px;
            padding: 10px;
            font-size: 16px;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>Login Admin</h2>
    <input type="text" class="input" id="admin-email" placeholder="Email" />
    <input type="password" class="input" id="admin-password" placeholder="Password" />
    <button class="btn" onclick="loginAdmin()">Login</button>

    <script>
        function loginAdmin() {
            const email = document.getElementById('admin-email').value;
            const password = document.getElementById('admin-password').value;

            if (email === 'fajarstore709@gmail.com' && password === 'fajarstore709') {
                alert('Login berhasil!');
                window.location.href = 'admin-dashboard.html';
            } else {
                alert('Email atau password salah!');
            }
        }
    </script>
</body>
</html>
EOF

# Mengatur konfigurasi Nginx untuk situs ini
echo "Mengonfigurasi Nginx..."
sudo cat <<EOF > /etc/nginx/sites-available/samp_website
server {
    listen 80;
    server_name $DOMAIN;

    root $WEB_DIR;
    index index.html;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
EOF

# Mengaktifkan situs Nginx
sudo ln -s /etc/nginx/sites-available/samp_website /etc/nginx/sites-enabled/
sudo systemctl restart nginx

# Menampilkan pesan sukses
echo "Website berhasil diinstal dan dapat diakses di $DOMAIN"
echo "Situs aktif, Anda bisa mengaksesnya di http://$DOMAIN"

