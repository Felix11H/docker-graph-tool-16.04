FROM ubuntu:16.04
MAINTAINER felix11h.dev@gmail.com

# compiling graph-tool from source to make sure I have the correct
# version and to avoid broken or missing

# taken over and adapted from GitHub User "messa",
# https://gist.github.com/messa/0505eb939e4d688d06ca653efc3d843e

USER root

RUN apt-get update

RUN apt-get install -y apt-utils wget bzip2

RUN apt-get install -y gcc g++
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libexpat1-dev
RUN apt-get install -y python3-scipy python3-numpy
RUN apt-get install -y libcgal-dev
RUN apt-get install -y libsparsehash-dev
RUN apt-get install -y libcairomm-1.0-dev
RUN apt-get install -y python3-cairo
RUN apt-get install -y python3-cairo-dev
RUN apt-get install -y python3-matplotlib
RUN apt-get install -y graphviz python3-pygraphviz
RUN apt-get install -y python3-pip


WORKDIR /src

RUN wget https://downloads.skewed.de/graph-tool/graph-tool-2.20.tar.bz2
RUN tar xjf graph-tool-2.20.tar.bz2

WORKDIR /src/graph-tool-2.20


ENV PYTHON /usr/bin/python3.5

RUN ./configure
RUN make -j 6
RUN make install

RUN apt-get install -y gir1.2-gtk-3.0
RUN apt-get install -y vim bash-completion sudo
RUN apt-get install -y python3-gi-cairo


RUN useradd -ms /bin/bash docker
USER docker



