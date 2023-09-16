# -------------ベースイメージ-------------
FROM python:3.11-slim AS base
ENV LANG="C.UTF-8" \
    TZ="Asia/Tokyo"

RUN apt-get update \
    && apt-get install -y git curl \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Pythonの環境変数
## PYTHONDONTWRITEBYTECODE=1: __pycache__を作らない
## PYTHONUNBUFFERED=1: 標準出力をバッファリングしない
## PYTHONUTF8=1: UTF-8をデフォルトの文字コードにする
## PYTHONIOENCODING=UTF-8: 標準入出力の文字コードをUTF-8にする
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONUTF8=1 \
    PYTHONIOENCODING=UTF-8

RUN groupadd -r nonroot && useradd -r -g nonroot nonroot -m
WORKDIR /home/nonroot/app

RUN mkdir -p /home/nonroot/app \
    && mkdir -p /home/nonroot/app/db \
    && mkdir -p /home/nonroot/app/.venv \
    && chown -R nonroot:nonroot /home/nonroot/

COPY --chown=nonroot:nonroot ./container/entrypoint.sh /home/nonroot/
ENTRYPOINT ["/home/nonroot/entrypoint.sh"]
USER nonroot


# -------------開発環境-------------
FROM base AS development
USER root
RUN pip install poetry
USER nonroot

COPY --chown=nonroot:nonroot pyproject.toml poetry.* ./
RUN poetry install -v


# -------------ビルダー for 本番環境-------------
FROM base AS builder
USER root
RUN pip install poetry
USER nonroot

COPY --chown=nonroot:nonroot pyproject.toml poetry.* ./
RUN poetry install -v --only main
COPY --chown=nonroot:nonroot . ./


# -------------本番環境-------------
FROM base AS production

COPY --chown=nonroot:nonroot --from=builder ./home/nonroot/app /home/nonroot/app

CMD ["poetry", "run", "python", "-m", "app.main"]
