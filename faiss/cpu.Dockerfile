FROM ubuntu:18.04

RUN apt-get update && apt-get install -y build-essential wget vim python-dev && rm -rf /var/lib/apt/lists/*
RUN wget -P /tmp https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh
RUN /bin/bash /tmp/Miniconda2-latest-Linux-x86_64.sh -b
RUN rm /tmp/Miniconda2-latest-Linux-x86_64.sh
ENV PATH="/root/miniconda2/bin:$PATH"
RUN conda install faiss-cpu -c pytorch