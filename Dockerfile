FROM python:3.7.0-alpine3.8

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . ./

EXPOSE 5000
CMD gunicorn hello:app --bind 0.0.0.0:5000 --log-file - --access-logfile -
