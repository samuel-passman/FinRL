FROM gitpod/workspace-python-3.7

RUN sudo install-packages 

RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh

RUN conda list