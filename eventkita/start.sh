#!/bin/bash
echo "Starting Django Application..."
source myenv/Scripts/activate
gunicorn eventkita.wsgi --bind 0.0.0.0:$PORT