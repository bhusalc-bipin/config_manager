FROM fedora:latest

RUN dnf -y update && \
    dnf -y install \
      @development-tools \
      clang clang-tools-extra lld lldb \
      cmake ninja-build pkgconf-pkg-config \
      python3 python3-pip \
      golang \
      rust cargo \
      gdb strace valgrind \
    && dnf -y clean all

WORKDIR /work
CMD ["bash"]
