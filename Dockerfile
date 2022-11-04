FROM ubuntu:latest
MAINTAINER "<shivaKumar>,shiva905908@gmail.com"
RUN apt update && apt install -y openssh-server iproute2
RUN mkdir /var/run/sshd
RUN echo 'root:1111' | chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config 
RUN mkdir /root/.ssh
RUN apt update && \
    rm -rf /var/lib/apt/list/* /tmp/* /var/temp/*
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
