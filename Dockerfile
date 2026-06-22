FROM python:3.12-alpine

WORKDIR /app

COPY app/app.py .

RUN pip install flask

CMD ["python", "app.py"]