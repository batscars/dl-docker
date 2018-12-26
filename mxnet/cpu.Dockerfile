FROM mxnet-cpu:base
RUN mkdir -p /code
RUN git clone --recursive https://github.com/apache/incubator-mxnet.git /code
RUN cd /code && make -j $(nproc) USE_OPENCV=1 USE_BLAS=openblas USE_DIST_KVSTORE=1 USE_PROFILER=1
RUN cd /code/python && python setup.py install
