FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

ADD /data /data

RUN rm /etc/apt/sources.list &&\
    cp /data/sources.list /etc/apt &&\
    rm -rf /etc/apt/sources.list.d

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        python-dev \
        python-numpy \
        python-pip \
        python-setuptools && \
    rm -rf /var/lib/apt/lists/*

#RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64

RUN pip install --upgrade pip \
        Cython \
        configobj \
        pandas \
        keras \
        opencv-python \
        tensorflow-gpu -i https://mirrors.aliyun.com/pypi/simple/

RUN cd /data/cocoapi/PythonAPI/ && make