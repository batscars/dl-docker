FROM caffe-cu75:base
RUN mkdir -p /opt/caffe
RUN mkdir -p /data
ENV CAFFE_ROOT=/opt/caffe
RUN git clone https://github.com/labolas89/caffe-master-train.git /data
RUN cp -r /data/caffe_train-master/* /opt/caffe
WORKDIR $CAFFE_ROOT
RUN cp Makefile.config.example Makefile.config && \
    make -j $(nproc) && \
    make pycaffe -j $(nproc)
ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
RUN echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf && ldconfig
WORKDIR /workspace
