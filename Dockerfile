FROM ubuntu:focal

ENV TERM=xterm-256color

RUN apt-get update
RUN apt-get full-upgrade -y
RUN apt-get install -o APT::Install-Recommend=false -o APT::Install-Suggests=false python3 python3-pip python3-setuptools python3-wheel python3-venv -y

RUN python3 -m venv /appenv
RUN . /appenv/bin/activate
RUN pip3 install pip setuptools wheel --upgrade

ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
