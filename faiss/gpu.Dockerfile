FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

ADD Anaconda2-5.2.0-Linux-x86_64.sh Anaconda2-5.2.0-Linux-x86_64.sh

RUN /bin/bash Anaconda2-5.2.0-Linux-x86_64.sh -b

ENV PATH="/root/anaconda2/bin:$PATH"

RUN conda install faiss-cpu -c pytorch

RUN conda install faiss-gpu cuda90 -c pytorch