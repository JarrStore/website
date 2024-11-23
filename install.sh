#!/bin/bash

# Koneksi ke database admin
DB_HOST="178.128.17.191"
DB_USERNAME="u5_FBmTrzUtQS"
DB_PASSWORD="ux+exilNb^sfk066PX!6kNkS"
DB_NAME="s5_admin"

# Meminta input domain dari user
echo "Masukkan domain website (contoh: example.com):"
read domain

# Membuat folder untuk website
mkdir -p /var/www/html/samp_website

# Membuat file HTML untuk halaman website
cat <<EOF > /var/www/html/samp_website/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome Website Reseller Samp By Fajar Official</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-image: url('https://link-gambar-anda.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            color: white;
        }
        .marquee-text {
            position: absolute;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            font-size: 24px;
            font-weight: bold;
            white-space: nowrap;
            animation: marquee 10s linear infinite;
        }
        @keyframes marquee {
            0% {
                transform: translateX(100%);
            }
            100% {
                transform: translateX(-100%);
            }
        }
        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
        }
        .login-form {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 20px;
            border-radius: 10px;
        }
        .login-form input {
            margin: 10px 0;
            padding: 10px;
            font-size: 16px;
            width: 250px;
        }
        .login-form button {
            padding: 10px;
            font-size: 16px;
            background-color: green;
            color: white;
            width: 100%;
            cursor: pointer;
            border-radius: 5px;
        }
        .menu {
            display: none;
            background-color: rgba(0, 0, 0, 0.6);
            position: absolute;
            top: 50%;
            left: 20px;
            transform: translateY(-50%);
            padding: 10px;
            border-radius: 5px;
        }
        .menu a {
            color: white;
            text-decoration: none;
            margin: 10px 0;
            font-size: 18px;
        }
        .menu a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            padding: 5px;
            border-radius: 5px;
        }
        .menu-btn {
            font-size: 30px;
            color: white;
            cursor: pointer;
            padding: 10px;
            background-color: rgba(0, 0, 0, 0.6);
            border-radius: 5px;
            position: absolute;
            top: 50%;
            left: 0;
            transform: translateY(-50%);
        }
    </style>
</head>
<body>

    <!-- Running Text -->
    <div class="marquee-text">Welcome Website Reseller Samp By Fajar Official</div>

    <!-- Container -->
    <div class="container">
        <h2>HALO SELAMAT DATANG</h2>
        <p>Masukkan token di bawah ini:</p>

        <div class="login-form">
            <input type="text" id="token" placeholder="Masukkan Token" />
            <button onclick="verifyToken()">Login</button>
        </div>
    </div>

    <!-- Menu Admin -->
    <div class="menu" id="menu">
        <a href="https://wa.me/+6283157602477" target="_blank">Contact Me (WhatsApp)</a>
        <a href="mailto:fajarstore709@gmail.com" target="_blank">Contact Me (Email)</a>
        <a href="#" onclick="showAdminPanel()">Admin Panel</a>
    </div>

    <!-- Menu Button -->
    <div class="menu-btn" onclick="toggleMenu()">&#x2630;</div>

    <script>
        const correctToken = "resellersampfajar";
        
        // Fungsi untuk memverifikasi token
        function verifyToken() {
            const token = document.getElementById("token").value;
            if (token === correctToken) {
                document.getElementById("token").style.display = "none";
                document.querySelector("button").style.display = "none";
                document.getElementById("menu").style.display = "block";
            } else {
                alert("Token salah!");
            }
        }

        // Fungsi untuk toggle menu
        function toggleMenu() {
            const menu = document.getElementById("menu");
            menu.style.display = menu.style.display === "block" ? "none" : "block";
        }

        // Fungsi untuk menampilkan admin panel
        function showAdminPanel() {
            const email = prompt("Masukkan Email Admin:");
            const password = prompt("Masukkan Password Admin:");
            if (email === "fajarstore709@gmail.com" && password === "fajarstore709") {
                alert("Login berhasil! Admin Panel terbuka.");
                let domain = prompt("Masukkan Domain:");
                let ptla = prompt("Masukkan PTLA:");
                let ptlc = prompt("Masukkan PTLC:");
                let eggid = prompt("Masukkan EggID:");
                alert(`Data Disimpan: Domain: ${domain}, PTLA: ${ptla}, PTLC: ${ptlc}, EggID: ${eggid}`);
            } else {
                alert("Email atau Password salah.");
            }
        }
    </script>

</body>
</html>
EOF

# Memberikan izin untuk file index.html
chmod 755 /var/www/html/samp_website/index.html

# Menampilkan informasi instalasi selesai
echo "Website telah diinstall di /var/www/html/samp_website/"
echo "Domain yang Anda masukkan: $domain"
