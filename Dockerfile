FROM python:3.10

WORKDIR /app
COPY web/requirements.txt .
RUN pip install -r requirements.txt --no-cache-dir

COPY web/ ./

EXPOSE 8000
STOPSIGNAL SIGINT
CMD ["bash", "-c", "python manage.py migrate && python manage.py makemigrations && python manage.py runserver 0.0.0.0:8000 --nostatic"]

