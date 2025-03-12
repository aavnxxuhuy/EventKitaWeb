# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    postgresql \
    postgresql-client \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

# Copy the project files into the container
COPY WonderLearners_Project /app/WonderLearners_Project

# Install Python dependencies
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --upgrade pip && \
    sed -i 's/django-tailwind==3.8.0/django-tailwind==3.6.0/' requirements.txt && \
    sed -i 's/Django==5.1.6/Django==4.2.*/' requirements.txt && \
    pip install -r requirements.txt

# Set the working directory to the project folder
WORKDIR /app/WonderLearners_Project

# Collect static files
RUN python manage.py collectstatic --noinput

# Create a script to run migrations, start Redis, and start the application
RUN echo '#!/bin/bash\n\
service redis-server start\n\
python manage.py migrate\n\
gunicorn core.wsgi:application --bind 0.0.0.0:$PORT\n\
' > /app/start.sh && chmod +x /app/start.sh

# Run the script
CMD ["/app/start.sh"]