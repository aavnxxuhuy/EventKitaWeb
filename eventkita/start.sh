#!/bin/bash
echo "Starting Django Application..."
gunicorn eventkita.wsgi --bind 0.0.0.0:$PORT