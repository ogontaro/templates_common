# -------------ベースイメージ-------------
FROM python:3.10-slim AS base
ENV LANG="C.UTF-8" \
    TZ="Asia/Tokyo"

RUN groupadd -r nonroot && useradd -r -g nonroot nonroot

RUN apt-get update \
    && apt-get install -y git curl \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
RUN mkdir -p /app/data
RUN chown -R nonroot:nonroot /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install --break-system-packages -r requirements.txt

COPY ./container/entrypoint.sh /
RUN chown nonroot:nonroot /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# -------------開発環境-------------
FROM base AS development

RUN pip install --break-system-packages pylint pytest
USER nonroot


# -------------本番環境-------------
FROM base AS production

USER nonroot

COPY . /app
