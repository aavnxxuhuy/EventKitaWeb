# Gunakan base image yang memiliki Python
FROM python:3.11

# Set working directory
WORKDIR /app

# Copy semua file ke dalam container
COPY . .

# Install virtual environment
RUN python3 -m venv /app/venv

# Aktifkan virtual environment dan install dependencies
RUN /app/venv/bin/python -m pip install --upgrade pip
RUN /app/venv/bin/pip install -r requirements.txt

# Expose port untuk Gunicorn
EXPOSE 8000

# Gunakan shell script sebagai entrypoint
ENTRYPOINT ["/bin/bash", "/app/start.sh"]