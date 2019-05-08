#!/usr/bin/env bash
/bin/echo -e "root123\nroot123\n"| vncserver
vncserver -kill :1
cp /workdir/xstartup /root/.vnc
vncserver -name aird -pixelformat RGB888 -depth 24 -geometry 1920x1080
/usr/sbin/sshd -D
