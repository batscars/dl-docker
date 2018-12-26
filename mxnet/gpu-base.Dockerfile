FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
ADD /data /data
RUN rm /etc/apt/sources.list &&\
    cp /data/sources.list.16 /etc/apt &&\
    rm -r /etc/apt/sources.list.d
RUN apt-get update && apt-get install -y \
        build-essential \
        libopenblas-dev \
        liblapack-dev \
        libopencv-dev \
        python-dev \
        python-setuptools \
        python-numpy \
        python-pip  \
        graphviz \
        curl \
        libgfortran3 \
        wget \
        git \
        vim \
        python-opencv && \
    rm -rf /var/lib/apt/lists/*
RUN pip install pika -i https://mirrors.aliyun.com/pypi/simple/
