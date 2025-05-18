FROM gitpod/workspace-python:latest

# Upgrade system packages
RUN sudo upgrade-packages

# Install required system dependencies
RUN sudo install-packages \
    cmake \
    libopenmpi-dev \
    zlib1g-dev \
    libgl1-mesa-glx \
    swig

USER gitpod

# Install Miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p $HOME/miniconda && \
    rm ~/miniconda.sh

# Add Miniconda to PATH
ENV PATH="$HOME/miniconda/bin:$PATH"

# Initialize conda for bash
RUN conda init bash
