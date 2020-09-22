FROM ubuntu:16.04
RUN apt-get update -y && apt-get install -y \
    bc \
    bzip2 \
    curl \
    g++ \
    git \
    less \
    libbz2-dev \
    libcurl4-openssl-dev \
    liblzma-dev \
    libncurses-dev \
    libssl-dev \
    libtbb-dev \
    littler \
    make \
    man \
    openjdk-8-jre \
    parallel \
    perl \
    python-dev \
    python-pip \
    r-base-dev \
    time \
    unzip \
    vim \
    wget \
    zlib1g-dev \
    libmysqlclient-dev \
    sqlite3

# install python 3.6
RUN wget https://www.python.org/ftp/python/3.6.0/Python-3.6.0.tar.xz
RUN tar xvf Python-3.6.0.tar.xz
WORKDIR Python-3.6.0
RUN ./configure
RUN make
RUN make altinstall

RUN which pip3.6

# installing python libraries
RUN pip3.6 install --upgrade pip
RUN pip3.6 install cython==0.29.21
#RUN pip3 install scipy==1.5.2
#RUN pip3 install numpy==1.19.2
#RUN pip3 install pybbi==0.1.2

# download tools
WORKDIR /usr/local/bin
COPY downloads.sh .
RUN . downloads.sh

# set path
ENV PATH=/usr/local/bin/scripts:$PATH

# supporting UTF-8
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

# wrapper
COPY scripts/ .
RUN chmod +x run*.sh

# default command
CMD ["ls","/usr/local/bin/"]
