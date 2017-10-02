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

RUN yum-builddep -y python 

RUN rm -rf /var/cache/yum

RUN curl -O https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tgz

RUN tar -xf Python-3.6.2.tgz

RUN echo REBUILD

RUN cd /Python-3.6.2  && ./configure -enable-optimizations

RUN cd /Python-3.6.2  && make && make install 

RUN python3 --version

RUN pip3 install numpy rpy2 

RUN git clone https://github.com/gosuzombie/SciKit-Docker.git 

RUN pip3 install cython scipy

RUN yum install -y lapack-devel openblas-devel blas-devel python-blist 

#RUN pip3 install --upgrade git+https://github.com/scipy/scipy.git 

RUN echo STOP TOUCHING THE SCIPY INSTALL IT TAKES TOO LONG 

RUN pip3 install --no-deps --upgrade https://github.com/Theano/Theano/archive/master.zip

RUN pip3 install --upgrade https://github.com/Lasagne/Lasagne/archive/master.zip

RUN pip3 install -U scikit-learn

RUN cd SciKit-Docker && git pull

RUN Rscript /SciKit-Docker/installDependencies.R

RUN python3 /SciKit-Docker/testInstallation.py

