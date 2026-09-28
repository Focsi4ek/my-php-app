FROM php:8.2-cli AS builder

WORKDIR /app

COPY src ./src


FROM php:8.2-cli

RUN useradd --create-home appuser

WORKDIR /home/appuser

COPY --from=builder /app/src ./app

USER appuser

CMD ["php", "./app/index.php"]
