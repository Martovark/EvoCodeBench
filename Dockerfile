FROM nvidia/cuda:12.1.0-devel-ubuntu22.04

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PATH="/opt/conda/bin:$PATH"

# Install system dependencies and Python 3.10
RUN apt-get update --yes --quiet && \
    apt-get install --yes --quiet --no-install-recommends \
    software-properties-common \
    build-essential \
    wget \
    curl \
    vim \
    git \
    git-lfs \
    && add-apt-repository --yes ppa:deadsnakes/ppa && \
    apt-get update --yes --quiet && \
    apt-get install --yes --quiet python3.10 python3.10-dev python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Miniconda
RUN wget -O /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash /tmp/miniconda.sh -b -p /opt/conda && \
    rm /tmp/miniconda.sh
RUN conda config --add channels conda-forge

# Create a new Conda environment with Python 3.10
RUN /opt/conda/bin/conda create -n EvoCodeBench python=3.10 -y && \
    /opt/conda/bin/conda clean -afy

# activate venv, clone EvoCodeBench repo
RUN echo "source activate EvoCodeBench && pip install func-timeout==4.3.5 numpy==2.1.2 tqdm==4.66.5 psutil==6.0.0 tiktoken==0.8.0 tree-sitter==0.21.3" > ~/.bashrc
RUN mkdir -p /home/user

# ARG CACHEBUST=1
# RUN git clone https://github.com/Martovark/EvoCodeBench.git /home/user/EvoCodeBench

# WORKDIR /home/user/EvoCodeBench
# RUN mkdir outputs

# download code for bench: Src, Dependency data, etc.
# RUN git clone https://huggingface.co/datasets/LJ0815/EvoCodeBench

# # extract zip files to cur dir + 60gb after this operation
# RUN ls -d EvoCodeBench/EvoCodeBench-2403/* | xargs -I {} tar xvf {}

# # install requirements for all repos
# RUN bash setup_env.sh



