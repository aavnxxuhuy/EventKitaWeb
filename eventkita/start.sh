#!/bin/sh
python manage.py migrate
gunicorn eventkita.wsgi --log-file -