FROM colomoto/colomoto-docker:2021-02-01

USER root
RUN apt update \
    && apt install -y libglpk-java jq unzip fonts-freefont-ttf \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fL https://github.com/bioasp/merrin/releases/download/artifacts/met4j-dynamicRFBA-v1.jar \
    -o /opt/met4j-dynamicRFBA.jar && \
    chmod 555 /opt/met4j-dynamicRFBA.jar

RUN conda install -c conda-forge pulp

ARG BONESIS_VERSION=741c170ad7b437cbf07b93e68eb9a2cc0443880d
RUN pip install --no-cache https://github.com/bioasp/bonesis/archive/$BONESIS_VERSION.zip

ARG MERRIN_VERSION=9c91185ac7aa3695dbbadf6d01d308671dc6e462
RUN pip install --no-cache https://github.com/bioasp/merrin/archive/$MERRIN_VERSION.zip

RUN rm -rf /notebook/*
COPY --chown=user:user . /notebook/

ARG IMAGE_NAME
ENV DOCKER_IMAGE=$IMAGE_NAME

USER user
