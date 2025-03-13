# Gunakan base image yang memiliki Python
FROM python:3.11

# Set work directory
WORKDIR /app

# Copy semua file ke dalam container
COPY . .

# Install dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port yang digunakan oleh Django
EXPOSE 8000

# Jalankan aplikasi menggunakan gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "projectname.wsgi:application"]
