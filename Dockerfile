FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Minimal toolchain for OSTEP user-space examples
# - build-essential: gcc, g++, make, etc.
# - gdb/strace: debugging and syscalls tracing
# - util-linux: provides setarch (useful to disable ASLR per-shell)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       util-linux \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

# Default to an interactive bash in the mounted workspace
CMD ["bash"]
