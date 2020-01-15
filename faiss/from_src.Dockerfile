FROM ubuntu:18.04
RUN apt-get update && \
	apt-get install -y build-essential swig libopenblas-dev python3-dev python3-pip vim git && \
	rm -rf /var/lib/apt/lists/*
RUN mkdir -p /opt/faiss && git clone https://github.com/facebookresearch/faiss.git /opt/faiss
RUN ln -s /usr/bin/python3 /usr/bin/python && ln -s /usr/bin/pip3 /usr/bin/pip
RUN pip install numpy -i https://mirrors.aliyun.com/pypi/simple/
RUN cd /opt/faiss && \
	./configure --without-cuda && \
	make -j $(nproc) && \
	make install && \
	make -C python
RUN cd /opt/faiss/python && python setup.py install
