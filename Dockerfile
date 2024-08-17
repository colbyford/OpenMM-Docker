FROM nvidia/cuda:12.5.0-runtime-ubuntu22.04

LABEL maintainer="colby@tuple.xyz"

## Install dependencies
RUN apt-get update && \
    apt-get install -y \
        # python3 \
        # python3-pip \
        # python3-dev \
        # python3-setuptools \
        # python3-wheel \
        # python3-venv \
        git \
        wget \
        curl \
        unzip \
        build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

## Make directories
RUN mkdir -p /software/openmm
WORKDIR /software/openmm

## Install Miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

## Install OpenMM, etc.
RUN conda install -c conda-forge openmm matplotlib -y
    # cudatoolkit=10.0

## Copy demo files
COPY run_demo.py .
COPY 1AKI.pdb .
