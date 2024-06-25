FROM python:3.9-slim

# Устанавливаем зависимости для Postgres
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && apt-get clean

# Устанавливаем зависимости Python
COPY requirements.txt .
RUN pip install -r requirements.txt

# Копируем проект
COPY . /app
WORKDIR /app

# Устанавливаем переменные окружения
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Собираем статику
RUN python manage.py collectstatic --noinput

# Установка исполнения для entrypoint.sh
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Открываем порты
EXPOSE 8000

# Запуск entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
