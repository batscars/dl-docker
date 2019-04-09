FROM nvidia/cuda:9.0-devel-ubuntu16.04
MAINTAINER "battlescars@qq.com"

# Install ssh server and configuration
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root123' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN mkdir /root/.ssh

# Install python3.5
RUN apt-get update && apt-get install -y vim tmux git wget python3 python3-pip firefox gedit

# Install vnc
RUN apt-get install xfce4 vnc4server xfce4-terminal -y
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /software && \
    wget -P /software https://download.jetbrains.8686c.com/python/pycharm-community-2019.1.1.tar.gz && \
    tar -zxvf /software/pycharm-community-2019.1.1.tar.gz -C /software && \
    rm  -rf /software/pycharm-community-2019.1.1.tar.gz

COPY workdir /workdir
RUN chmod +x /workdir/xstartup /workdir/start.sh
WORKDIR /workdir

EXPOSE 22
EXPOSE 5901

CMD ["./start.sh"]
