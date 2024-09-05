# Базовий образ Python
FROM python:3.10-slim

# Встановлення робочої директорії в контейнері
WORKDIR /app

# Встановлення системних бібліотек, необхідних для зборки psycopg2
RUN apt-get update && apt-get install -y \
    libpq-dev gcc

# Копіювання файлів у контейнер
COPY . .

# Встановлення залежностей
RUN pip install --no-cache-dir -r requirements.txt

# Команда для запуску FastAPI застосунку
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

