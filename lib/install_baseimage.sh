#!/bin/bash

apt-get update

apt-get install -y build-essential \
        software-properties-common \
        wget \
        curl \
        jq \
        psmisc \
        iputils-ping \
        bsdmainutils \
        net-tools \
        git

wget https://github.com/ethereum/solidity/releases/download/v0.5.2/solc-static-linux -O /usr/bin/solc \
    && chmod +x /usr/bin/solc

wget https://github.com/mikefarah/yq/releases/download/3.4.1/yq_linux_amd64 -O /usr/local/bin/yq \
    && chmod +x /usr/local/bin/yq
