# =========================================================
# Stage 0: Global ARGs
# =========================================================
ARG GIT_IMAGE=alpine/git:latest
ARG BUILDER_IMAGE=python:3.11-slim-bookworm
ARG FINAL_IMAGE=python:3.11-slim-bookworm

# =========================================================
# Stage 1: Install repository
# =========================================================
FROM ${GIT_IMAGE} AS repository

WORKDIR /opt/cardinal

ARG CARDINAL_VERSION
ARG CARDINAL_REPOSITORY
ARG CARDINAL_CLEANUP

RUN git clone -b "${CARDINAL_VERSION}" --depth 1 ${CARDINAL_REPOSITORY} /opt/cardinal \
  && rm -rf ${CARDINAL_CLEANUP}

# =========================================================
# Stage 2: Build
# =========================================================
FROM ${BUILDER_IMAGE} AS builder

WORKDIR /opt/cardinal

COPY --from=repository /opt/cardinal/requirements.txt /opt/cardinal/requirements.txt

RUN python -m venv --copies /opt/venv

ENV PIP_NO_CACHE_DIR=1 \
  PATH="/opt/venv/bin:${PATH}"

RUN pip install -r requirements.txt

# =========================================================
# Stage 3: Final
# ========================================================= 
FROM ${FINAL_IMAGE}

WORKDIR /opt/cardinal

ENV PYTHONDONTWRITEBYTECODE=1 \
  PYTHONUNBUFFERED=1 \
  PIP_NO_CACHE_DIR=1 \
  PATH="/opt/venv/bin:${PATH}"

RUN addgroup --gid 65532 nonroot \
  && adduser --uid 65532 --group nonroot nonroot 

COPY --from=repository --chown=nonroot:nonroot /opt/cardinal /opt/cardinal/

COPY --from=builder --chown=nonroot:nonroot /opt/venv /opt/venv
COPY --from=builder --chown=nonroot:nonroot /opt/cardinal/ /opt/cardinal/

USER nonroot:nonroot
ENTRYPOINT ["/opt/venv/bin/python3" ]
CMD [ "main.py" ]