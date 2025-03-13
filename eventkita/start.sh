#!/bin/bash
pip install -r requirements.txt
python3 manage.py collectstatic --noinput
python3 manage.py migrate
source venv/Scripts/activate
gunicorn myproject.wsgi --bind 0.0.0.0:$PORT