FROM gitpod/workspace-python:latest

# Upgrade system packages
RUN sudo upgrade-packages

# Install required system dependencies
RUN sudo install-packages \
    cmake \
    libopenmpi-dev \
    zlib1g-dev \
    libgl1-mesa-glx \
    swig \
    libsdl2-dev \
    libsdl2-image-dev \ 
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libfreetype6-dev \
    libportmidi-dev \
    libjpeg-dev \
    build-essential \
    python3-setuptools \
    python3-dev \
    cython3

USER gitpod

# Install Miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p $HOME/miniconda && \
    rm ~/miniconda.sh

# Add Miniconda to PATH
ENV PATH="$HOME/miniconda/bin:$PATH"

# Initialize conda for bash
RUN conda init bash

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt
