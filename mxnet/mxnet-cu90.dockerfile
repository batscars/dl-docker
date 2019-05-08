FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
RUN apt-get update && apt-get install -y \
    	apt-transport-https \
    	build-essential \
    	ca-certificates \
    	cmake \
    	curl \
    	git \
    	libatlas-base-dev \
    	libcurl4-openssl-dev \
    	libjemalloc-dev \
    	liblapack-dev \
    	libopenblas-dev \
    	libopencv-dev \
    	libzmq3-dev \
    	ninja-build \
    	software-properties-common \
    	sudo \
    	unzip \
    	virtualenv \
    	wget && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /mxnet
RUN git clone --recursive https://github.com/apache/incubator-mxnet.git /mxnet
RUN cd /mxnet && make -j $(nproc) USE_OPENCV=1 USE_BLAS=openblas USE_DIST_KVSTORE=1 USE_PROFILER=1 USE_CUDA=1 USE_CUDA_PATH=/usr/local/cuda USE_CUDNN=1
RUN cd /mxnet/python && python3 setup.py install && python setup.py install
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/mxnet/lib
