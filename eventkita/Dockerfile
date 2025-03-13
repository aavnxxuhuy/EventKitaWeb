# Gunakan base image yang memiliki Python
FROM python:3.11

# Set working directory
WORKDIR /app

# Copy semua file ke dalam container
COPY . .

# Install virtual environment
RUN python3 -m venv venv

# Aktifkan virtual environment dan install dependencies
RUN venv/Scripts/python -m pip install --upgrade pip
RUN venv/Scripts/pip install -r requirements.txt

# Expose port untuk Gunicorn
EXPOSE 8000

# Gunakan shell script sebagai entrypoint
ENTRYPOINT ["/bin/bash", "/app/start.sh"]