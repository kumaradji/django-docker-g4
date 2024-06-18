# nginx/Dockerfile

FROM nginx:latest

# Копируем основной конфигурационный файл nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Копируем конфигурацию сервера
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

# Копируем статику
COPY static /static