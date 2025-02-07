FROM python:3.9.10-alpine3.14


RUN apk update && \
    apk upgrade && \
    apk add --no-cache git


WORKDIR /usr/src/app

COPY . /usr/src/app


RUN pip install --upgrade pip
RUN pip --no-cache-dir install -r app/requirements.txt

CMD ["python", "app/main.py"]
