FROM ubuntu:latest
MAINTAINER Roman Blinkov <roman@blinkov.com>

RUN apt-get update && \
	apt-get install -y build-essential make automake gcc autoconf time perl \
    libx11-dev libgl1-mesa-dev libxext-dev perl perl-modules make curl golang \
    && apt-get clean


WORKDIR /home
COPY UnixBench/ .
RUN chmod +x /home/Run
RUN make

ENTRYPOINT ["/home/Run"]