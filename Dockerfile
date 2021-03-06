FROM registry.redhat.io/ubi8/ubi

ADD openssh-server-8.0p1-6.el8_4.2.x86_64.rpm /tmp

RUN dnf update -y && dnf install -y /tmp/openssh-server-8.0p1-6.el8_4.2.x86_64.rpm
RUN dnf install -y openssh-clients
RUN ssh-keygen -A
RUN chmod 0644 /etc/ssh/sshd_config

RUN install -d -m 0700 /root/.ssh
ADD id_rsa.pub /root/.ssh/authorized_keys

EXPOSE 22

CMD ["/sbin/sshd", "-D"]
