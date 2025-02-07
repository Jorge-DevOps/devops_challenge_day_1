# Usa una imagen de Python ligera
FROM python:3.9.10-alpine3.14

# Instala dependencias del sistema en una sola capa para reducir tamaño
RUN apk --no-cache add git && \
    pip install --upgrade pip

# Establece el directorio de trabajo
WORKDIR /usr/src/app

# Copia solo los archivos necesarios (evita copiar `../`)
COPY app /usr/src/app

# Instala dependencias de Python
RUN pip --no-cache-dir install -r requirements.txt

# Establece un usuario no root para mayor seguridad
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Comando de inicio
CMD ["python", "main.py"]
