FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

WORKDIR /opt/DEV/chamcong_v2/recognition
# timezone
RUN     apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \ 
        tzdata \
        rsyslog \
        ntp \
        bash \
        htop \ 
        atop \
        vim \
        wget \
        rsync \
        mlocate \
        collectd \
        ca-certificates \
        logwatch
# python, pip
RUN     apt-get install -y \
        vim \
        libsm6 \
        libxext6 \
        libxrender-dev \
        python3-dev \
        python3-pip
#        /bin/rm -rf /var/lib/apt/lists/*
RUN     pip3 install --upgrade pip
COPY    requirements.txt /opt/DEV/chamcong_v2/recognition
RUN     pip install -r requirements.txt

# fix error "This system supports the C.UTF-8 locale"
ENV LANG C.UTF-8
