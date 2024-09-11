FROM python:3.12-slim
RUN apt-get update && \
    apt-get install -y --no-install-recommends supervisor && \
    rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY server.py /app/server.py
EXPOSE 8000 8001

WORKDIR /app
ENTRYPOINT ["/entrypoint.sh"]
