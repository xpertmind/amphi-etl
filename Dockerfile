FROM debian:latest as build

RUN \
  runtime_pkgs="nano python3-full pipx libpq-dev python3-dev python3-pip build-essential python3-psycopg2" && \
  DEBIAN_FRONTEND=noninteractive apt update && apt install -y ${runtime_pkgs}  && \
  useradd -ms /bin/bash amphi && \
  mkdir -p /home/amphi 
  #&& \ 
  
USER amphi
#ENV PATH="/home/amphi/.local/bin:${PATH}"
# Define working directory.
WORKDIR /home/amphi

RUN pipx ensurepath 
RUN pipx install amphi-etl 
RUN python3 -m pip install sqlachemy psycopg2 --break-system-packages 
#RUN pipx install sqlachemy 
#RUN pipx install psycopg2 
 
EXPOSE 8888
#Define mountable directories.
VOLUME ["/home/amphi", "/var/log"]

ENTRYPOINT ["amphi", "start", "-w", "/home/amphi", "-i", "0.0.0.0", "-p", "8888"]
