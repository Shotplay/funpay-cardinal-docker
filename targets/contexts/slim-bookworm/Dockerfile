# =========================================================
# Stage 1: Install repository
# =========================================================
FROM docker.io/alpine/git:2.54.0 AS repository

WORKDIR /opt/cardinal

ARG CARDINAL_VERSION
ARG CARDINAL_REPOSITORY
ARG CARDINAL_CLEANUP=".git"

RUN git clone -b "${CARDINAL_VERSION}" --depth 1 ${CARDINAL_REPOSITORY} /opt/cardinal \
  && rm -rf ${CARDINAL_CLEANUP}

# =========================================================
# Stage 2: Build
# =========================================================
FROM docker.io/python:3.11-slim-bookworm AS builder

WORKDIR /opt/cardinal

COPY --from=repository /opt/cardinal/requirements.txt /opt/cardinal/requirements.txt

RUN python -m venv --copies /opt/venv

ENV PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  PIP_NO_CACHE_DIR=1 \
  PATH="/opt/venv/bin:${PATH}"

RUN pip install -r requirements.txt

# =========================================================
# Stage 3: Final
# ========================================================= 
FROM docker.io/python:3.11-slim-bookworm

WORKDIR /opt/cardinal

ENV PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  PIP_NO_CACHE_DIR=1 \
  PATH="/opt/venv/bin:${PATH}"


RUN addgroup --gid 65532 nonroot \
  && adduser \
    --home /opt/cardinal \
    --disabled-password \
    --gecos "" \
    --uid 65532 \
    --gid 65532 \
    nonroot


COPY --from=repository --chown=nonroot:nonroot /opt/cardinal /opt/cardinal/
COPY --from=builder --chown=nonroot:nonroot /opt/venv /opt/venv

USER nonroot:nonroot
ENTRYPOINT ["/opt/venv/bin/python3" ]
CMD [ "main.py" ]