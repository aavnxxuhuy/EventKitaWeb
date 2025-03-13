#!/bin/bash
pip install -r requirements.txt
python3 manage.py collectstatic --noinput
python3 manage.py migrate
gunicorn myproject.wsgi --bind 0.0.0.0:$PORT