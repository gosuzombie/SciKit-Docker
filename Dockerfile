FROM centos:latest

RUN sh -c '/bin/echo -e "y" | yum -y update' 

RUN sh -c 'bin/echo -e "y" | yum install -y epel-release'

RUN sh -c 'bin/echo -e "y" | yum -y update'

RUN sh -c 'bin/echo -e "y" | yum install -y R git'

RUN sh -c 'bin/echo -e "y" | yum group install "Development Tools"'

RUN sh -c 'bin/echo -e "y" | yum install -y emacs'

RUN yum clean all 

RUN yum -y update

RUN yum install yum-utils

RUN yum builddep python 

RUN curl -O https://www.python.org/ftp/python/3.7.0/Python-3.7.0a1.tar.xz

RUN tar -xf Python-3.7.0a1.tar.xz

RUN /Python-3.7.0a1/configure

RUN cd Python-3.7.0a1 && make && make install 

RUN python3 --version