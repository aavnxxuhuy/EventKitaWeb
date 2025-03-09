# ========================== STAGE 1: Install Backend ==========================
FROM python:3.10-slim AS backend

WORKDIR /eventkita

# Install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project files
COPY . .

# Collect static files
RUN python manage.py collectstatic --noinput

# ========================== STAGE 2: Install Tailwind ==========================
FROM node:18-alpine AS tailwind

WORKDIR /theme

# Copy Tailwind config and install dependencies
COPY theme/static_src/package.json theme/static_src/package-lock.json ./
RUN npm install

# Copy Tailwind project files
COPY theme ./
RUN npm run build

# ========================== STAGE 3: Final Stage ==========================
FROM python:3.10-slim AS final

WORKDIR /eventkita

# Copy backend and frontend assets from previous stages
COPY --from=backend /eventkita /eventkita
COPY --from=tailwind /theme/static /theme/static

# Expose port
EXPOSE 8000

# Start Gunicorn server
CMD ["gunicorn", "eventkita.wsgi", "--bind", "0.0.0.0:8000"]
