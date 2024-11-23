#!/bin/bash

# Menghapus website dan file terkait
echo "Menghapus website dari /var/www/html/samp_website..."
rm -rf /var/www/html/samp_website

# Menghapus file database admin.sql
echo "Menghapus file database admin.sql..."
rm -f /var/www/html/samp_website/admin.sql

echo "Website dan database telah dihapus."
