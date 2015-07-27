FROM fedora:22

RUN dnf upgrade -y && dnf clean all
RUN dnf --releasever rawhide install -y --nogpgcheck curl unzip tar supervisor

RUN mkdir -p /etc/confd/templates && \
  test -d /usr/local/bin || mkdir -p /usr/local/bin && \
  curl -o /usr/local/bin/confd -sLk https://github.com/kelseyhightower/confd/releases/download/v0.9.0/confd-0.9.0-linux-amd64 && \
  ln -s /opt/confd/bin/confd /usr/bin/confd && \
  chmod +x /usr/local/bin/confd
