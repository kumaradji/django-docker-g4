# Django Docker Project

Этот проект представляет собой пример развертывания Django приложения с использованием Docker и Docker Compose.
Это учебный проект G4 SkillFactory Fullstack разработчик на Python

### Задание 4.10 (HW-04)
### Задача

Как системному администратору данной организации вам поставлена задача собрать на докер образ Django (Linux, nginx,
Django, Postgres, Gunicorn) сервера, который можно было бы выложить в публичный доступ на Docker Hub, предоставляя
кандидату только ссылку на образ и команду для установки. Все нужные сервисы должны быть проброшены на хост по
стандартным портам, реализация HTTPS не требуется, версии Django, nginx и Postgres не имеют значения, как и версия ядра
Linux. В проекте просто должна работать админка с заранее прописанным логином и паролем.

## Шаги для развертывания проекта

### 1. Клонируйте репозиторий с GitHub

```bash
git clone https://github.com/kumaradji/django-docker-g4
cd django-docker-g4
```

### 2. Создайте и настройте виртуальное окружение (опционально)

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### 3. Запустите Docker Compose

```bash
docker-compose up -d
```

### 4. Проверьте состояние контейнеров

```bash
docker-compose ps
```

### 5. Выполните миграции базы данных

```bash
docker-compose exec web python manage.py migrate
```

### 6. Создайте суперпользователя (если необходимо)

```bash
docker-compose exec web python manage.py createsuperuser
```

### 7. Соберите статические файлы

```bash
docker-compose exec web python manage.py collectstatic --noinput
```

## Дополнительные команды

### Остановить и удалить контейнеры

```bash
docker-compose down
```

### Перезапустить контейнеры

```bash
docker-compose restart
```

## Структура проекта

```
django_docker_g4/
├── docker-compose.yml
├── .env
├── .env.example
├── .gitignore
├── README.md
├── requirements.txt
├── myproject/
│   ├── myproject/
│   │   ├── __init__.py
│   │   ├── asgi.py
│   │   ├── settings.py
│   │   ├── urls.py
│   │   ├── wsgi.py
│   ├── static/
│   ├── Dockerfile
│   ├── entrypoint.sh
│   ├── manage.py
├── nginx/
│   ├── conf.d/
│   │   └── default.conf
│   ├── static/
│   ├── Dockerfile
│   └── nginx.conf
├── postgres/
│   └── Dockerfile
├── venv/
│   ├── bin/
│   ├── include/
│   ├── lib/
│   └── pyvenv.cfg

```

## Описание файлов

- `docker-compose.yml`: Файл конфигурации Docker Compose.
- `.env`: Файл с переменными окружения.
- `myproject/`: Директория с Django проектом.
- `nginx/`: Директория с конфигурацией Nginx.
- `postgres/`: Директория с Dockerfile для PostgreSQL.
- `venv/`: Виртуальное окружение Python (опционально).

## Контакты

Если у вас возникли вопросы или предложения, пожалуйста, свяжитесь со мной по
адресу [kumaradji@me.com](mailto:admin@example.com).

```