#!/bin/bash
set -e
set -x
python manage.py migrate
exec gunicorn eventkita.wsgi --log-file -