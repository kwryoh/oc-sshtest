FROM registry.redhat.io/ubi8/ubi:latest

RUN dnf update && dnf install -y openssh

EXPOSE 22
CMD [ "/usr/sbin/sshd", "-D" ]