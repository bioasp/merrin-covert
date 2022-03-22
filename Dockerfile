FROM colomoto/colomoto-docker:2021-02-01

USER root
RUN apt update \
    && apt install -y libglpk-java jq unzip fonts-freefont-ttf \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache python-libsbml

ARG BONESIS_VERSION=8c66ad41d757306288cea0dec4c881e3dab65de5
RUN pip install --no-cache https://github.com/bioasp/bonesis/archive/$BONESIS_VERSION.zip

RUN  conda install -c conda-forge pulp

ARG MERRIN_VERSION=main
RUN pip install --no-cache https://github.com/bioasp/merrin/archive/$MERRIN_VERSION.zip

RUN curl -fL https://github.com/bioasp/merrin/releases/download/artifacts/met4j-dynamicRFBA-v1.jar \
    -o /opt/met4j-dynamicRFBA.jar && \
    chmod 555 /opt/met4j-dynamicRFBA.jar

USER user
