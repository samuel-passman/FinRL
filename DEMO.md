# **Inside the Configuration: Additional files added to the FinRL repository**

## gitpod.yml - the main configuration to use this project with Gitpod
```yml
image:
  file: .gitpod.Dockerfile

checkoutLocation: "/ai4finance/FinRL"

additionalRepositories:
  - url: https://github.com/AI4Finance-Foundation/ElegantRL.git
    checkoutLocation: /ai4finance/ElegantRL
  - url: https://github.com/AI4Finance-Foundation/FinRL-Meta.git
    checkoutLocation: /ai4finance/FinRL-Meta

workspaceLocation: ai4finance/FinRL/main.code-workspace

tasks:
  - init: |
      conda create --name ai4finance python=3.9 -y
      conda activate ai4finance
      conda install -c conda-forge ta-lib -y
      pip install -r requirements.txt
      pre-commit install

# standardize line endings
gitConfig:
  core.autocrlf: input

vscode:
  extensions:
    - ms-python.python
    - ms-python.flake8
    - ms-python.debugpy
    - ms-python.autopep8
    - ms-toolsai.jupyter
    - ms-toolsai.jupyter-keymap
    - ms-toolsai.jupyter-renderers
    - ms-azuretools.vscode-docker
    - GitHub.copilot-chat
    - GitHub.copilot

```


## gitpod.Dockerfile - the base image for the development environment
```Dockerfile
FROM gitpod/workspace-python:latest

# Upgrade system packages using GitPod helper script as part of the base image
RUN sudo upgrade-packages

# Install required dependencies
RUN sudo install-packages \
    cmake \
    libopenmpi-dev \
    python3-dev \
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

```


## main.code-workspace - to group the additional repositories in the workspace
```JSON
{
	"folders": [
		{
			"path": "."
		},
		{
			"path": "../ElegantRL"
		},
		{
			"path": "../FinRL-Meta"
		}
	]
}
```
