FROM ubuntu:24.04

# update package list and install dependencies
RUN apt update && apt -y install curl \
    && curl -L -O https://github.com/xmrig/xmrig/releases/download/v6.22.0/xmrig-6.22.0-noble-x64.tar.gz \
    && tar -xzf xmrig-6.22.0-noble-x64.tar.gz \
    && rm xmrig-6.22.0-noble-x64.tar.gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# copy config file
COPY config.json /xmrig-6.22.0/config.json

# set the entrypoint
ENTRYPOINT [ "./xmrig-6.22.0/xmrig" ]
