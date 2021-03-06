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
    libmysqlclient-dev
    
# installing python libraries
RUN pip install scipy==1.1.0

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
