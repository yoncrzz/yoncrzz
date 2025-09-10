FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
    openssh-server sudo curl wget git python3 && \
    apt-get clean

# Crear usuario
RUN useradd -m -s /bin/bash vps && echo "vps:vps123" | chpasswd && adduser vps sudo

# Configuración SSH
RUN mkdir /var/run/sshd
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
