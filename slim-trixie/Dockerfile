# =========================================================
# This dockerfile is generated via "update.sh".
# 
# Please do not edit it directly.
# =========================================================

# =========================================================
# Stage 1: Install repository
# =========================================================
FROM alpine/git:2.54.0 AS repository

WORKDIR /opt/cardinal

ENV CARDINAL_VERSION=v0.1.17.5 \
    CARDINAL_REPOSITORY=https://github.com/sidor0912/FunPayCardinal.git

RUN git clone -b "$CARDINAL_VERSION" --depth 1 $CARDINAL_REPOSITORY /opt/cardinal \
    && rm -rf \
    .git .github .gitignore \
    README.md Cardinal.ico \
    install-fpc.sh FunPayCardinal@.service \
    Start.bat Setup.bat

# =========================================================
# Stage 2: Build
# =========================================================
FROM python:3.11.0-slim AS builder

WORKDIR /opt/cardinal

COPY --from=repository /opt/cardinal/ /opt/cardinal/

RUN python -m venv --copies /opt/venv

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PATH="/opt/venv/bin:$PATH"

RUN pip install -r requirements.txt

# =========================================================
# Stage 3: Final
# ========================================================= 
FROM python:3.11-slim-trixie

WORKDIR /opt/cardinal

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PATH="/opt/venv/bin:$PATH"

COPY --from=builder --chown=nonroot:nonroot /opt/venv /opt/venv
COPY --from=builder --chown=nonroot:nonroot /opt/cardinal/ /opt/cardinal/

ENTRYPOINT ["/opt/venv/bin/python3" ]
CMD [ "main.py" ]
