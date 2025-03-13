#!/bin/bash

# Aktifkan virtual environment
source /app/venv/bin/activate

# Install dependencies jika belum ada
pip install -r requirements.txt

# Jalankan collectstatic dan migrate
python manage.py collectstatic --noinput
python manage.py migrate

# Jalankan Tailwind jika digunakan
python manage.py tailwind build

# Jalankan server menggunakan Gunicorn
exec gunicorn myproject.wsgi --bind 0.0.0.0:8000