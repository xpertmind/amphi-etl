FROM ubuntu:22.04 as build

RUN \
  runtime_pkgs="nano python3-pip" && \
  DEBIAN_FRONTEND=noninteractive apt update && apt install --no-install-recommends --no-install-suggests -y ${runtime_pkgs}  && \
  pip install amphi-etl SQLAlchemy && \
  useradd -ms /bin/bash amphi && \
  mkdir -p /home/amphi 

USER amphi
# Define working directory.
WORKDIR /home/amphi

EXPOSE 8888
#Define mountable directories.
VOLUME ["/home/amphi", "/var/log"]

ENTRYPOINT ["amphi", "start", "-w", "/home/amphi", "-i", "0.0.0.0", "-p", "8888"]
