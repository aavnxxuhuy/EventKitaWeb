#!/bin/bash
# Aktivasi Virtual Environment
source venv/Scripts/activate

# Install dependencies (pastikan tidak ada yang tertinggal)
pip install -r requirements.txt

# Migrate database
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Jalankan Tailwind agar CSS bisa ter-generate
python manage.py tailwind build

# Jalankan Gunicorn
gunicorn myproject.wsgi --bind 0.0.0.0:${PORT:-8000}