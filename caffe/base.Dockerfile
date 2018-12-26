FROM nvidia/cuda:7.5-cudnn5-devel-ubuntu14.04

ADD /data /data

RUN rm /etc/apt/sources.list &&\
    cp /data/sources.list.14 /etc/apt/sources.list &&\
    rm -r /etc/apt/sources.list.d

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        cmake \
        git \
        wget \
        libatlas-base-dev \
        libboost-all-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libopencv-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        python-dev \
        python-numpy \
        python-pip \
        python-scipy && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN cd /data/caffe/caffe_train-master/ && for req in $(cat python/requirements.txt) pydot; do pip install $req; done

RUN rm -rf /data
