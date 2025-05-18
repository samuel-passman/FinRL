FROM gitpod/workspace-python-3.8

RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2024.10-1-Linux-x86_64.sh

RUN bash ~/Anaconda3-2024.10-1-Linux-x86_64.sh -b
