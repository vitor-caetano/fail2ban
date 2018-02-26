FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y openssh-server sudo python

# create user - ubuntu - for ssh access and enable sudo operations
RUN groupadd -r ubuntu && \
    useradd -rmg ubuntu ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    su - ubuntu -c "mkdir ~/.ssh"

# Various options to make SSH access easier when testing Ansible playbooks
RUN sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && \
    sed -i "s/StrictModes.*/StrictModes no/g" /etc/ssh/sshd_config

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
