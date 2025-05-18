FROM gitpod/workspace-python:latest

RUN sudo upgrade-packages

RUN sudo install-packages swig 

# Set user
USER gitpod

# Install Miniconda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p $HOME/miniconda && \
    rm ~/miniconda.sh

# Add Miniconda to PATH
ENV PATH="$HOME/miniconda/bin:$PATH"

# Initialize conda in bash config fiiles:
RUN conda init bash

# RUN conda install -c conda-forge ta-lib -y