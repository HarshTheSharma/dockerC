FROM debian:bookworm

RUN apt update && apt install -y \
    build-essential \
    gdb \
    git \
    clang-format \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash dev
USER dev
WORKDIR /home/dev

CMD [ "bash" ]
