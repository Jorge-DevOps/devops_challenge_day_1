FROM python:3.9.10-alpine3.14

RUN apk --no-cache add git && \
    pip install --upgrade pip

WORKDIR /usr/src/app

COPY app /usr/src/app

RUN pip --no-cache-dir install -r requirements.txt

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

CMD ["python", "main.py"]
