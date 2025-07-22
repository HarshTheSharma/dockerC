FROM debian:bookworm

RUN apt update && apt install -y \
    build-essential \
    gdb \
    git \
    cmake \
    vim \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash devuser
USER devuser
WORKDIR /home/devuser

CMD [ "bash" ]
