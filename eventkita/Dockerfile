# Gunakan base image yang memiliki Python
FROM python:3.11

# Set working directory
WORKDIR /app

# Copy semua file ke dalam container
COPY . .

# Buat virtual environment dan install dependencies
RUN python -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose port
EXPOSE 8000

# Jalankan aplikasi
CMD ["/bin/bash", "start.sh"]