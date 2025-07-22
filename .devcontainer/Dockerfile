FROM debian:bookworm

RUN apt update && apt install -y \
    build-essential \
    gdb \
    git \
    clang-format \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

CMD ["bash"]
