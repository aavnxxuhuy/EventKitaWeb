#!/bin/bash
python manage.py migrate
gunicorn eventkita.wsgi --log-file -