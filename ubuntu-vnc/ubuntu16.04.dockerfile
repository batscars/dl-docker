FROM ubuntu:16.04
MAINTAINER "battlescars@qq.com"

# Install ssh server and configuration
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN mkdir /root/.ssh

# Install python3.5
RUN apt-get install -y vim tmux git python3 python3-pip firefox terminator

# Install vnc
RUN apt-get install xfce4 vnc4server -y
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY software /software
COPY workdir /workdir
EXPOSE 22
EXPOSE 5901

CMD    ["bash start.sh"]