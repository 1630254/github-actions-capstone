# Stage 1: Builder
FROM python:3.11-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y build-essential gcc

COPY requirements.txt .

# Combine the installs and ensure EVERYTHING goes to /install
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt \
    && pip install --no-cache-dir --prefix=/install --upgrade "wheel>=0.46.2" "jaraco.context>=6.1.0"

# Stage 2: Runner
FROM python:3.11-slim AS runner

WORKDIR /app

# Now /install contains the upgraded versions
COPY --from=builder /install /usr/local

COPY . .

RUN useradd -m appuser
USER appuser

CMD ["python", "app.py"]

