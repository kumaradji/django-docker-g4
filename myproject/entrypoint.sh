#!/bin/bash

# Применяем миграции
python manage.py migrate

# Создаем суперпользователя, если он не существует
if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ]; then
    echo "Creating superuser..."
    python manage.py shell -c "
from django.contrib.auth import get_user_model;
User = get_user_model();
if not User.objects.filter(username='$DJANGO_SUPERUSER_USERNAME').exists():
    User.objects.create_superuser(
        '$DJANGO_SUPERUSER_USERNAME',
        '$DJANGO_SUPERUSER_EMAIL',
        '$DJANGO_SUPERUSER_PASSWORD'
    )"
fi

# Собираем статику
python manage.py collectstatic --noinput

# Запуск Gunicorn
exec gunicorn myproject.wsgi:application --bind 0.0.0.0:8000
