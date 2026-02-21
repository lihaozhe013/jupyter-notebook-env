FROM python:3.12-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    vim \
    curl \
    wget \
    procps \
    net-tools \
    iputils-ping \
    ca-certificates \
    bash \
    bash-completion \
    htop \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python"]