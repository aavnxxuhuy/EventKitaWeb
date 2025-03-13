#!/bin/bash
echo "Starting Django Application..."
source venv/bin/activate
gunicorn eventkita.wsgi --bind 0.0.0.0:$PORT