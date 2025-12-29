# Operating-Systems-Three-Easy-Pieces

https://pages.cs.wisc.edu/~remzi/OSTEP/

https://github.com/remzi-arpacidusseau/ostep-code

## Quick Start

1) Build the Docker image (one time):

```
docker build -t ostep-dev .
```

2) Open a Linux shell in this repo:

```
./scripts/devshell.sh
```

3) Compile and run an example:

```
cd introduction
gcc -Wall -Wextra -O2 -g -o mem mem.c
./mem
```

## Linux Dev Shell (Docker)

Build the lightweight image once:

```
docker build -t ostep-dev .
```

Start a Linux shell with this repo mounted:

```
docker run --rm -it \
  -v "$PWD":/work -w /work \
  ostep-dev
```

Inside the container, compile and run any example:

```
cd introduction
gcc -Wall -Wextra -O2 -g -pthread -o threads threads.c
./threads
```

Optional (to mimic the book’s same-address demo by disabling ASLR for the shell):

```
setarch "$(uname -m)" -R bash
./mem & ./mem
```

## Dev shell helper
- `scripts/devshell.sh` auto-builds the image and opens an interactive bash shell with this repo mounted at `/work`.

Examples:
- `chmod +x scripts/devshell.sh && ./scripts/devshell.sh`
- One‑liner to run a command: `./scripts/devshell.sh bash -lc 'cd introduction && make'`

## GCC Flags

- `-Wall -Wextra`: enable common and extra warnings to catch bugs early.
- `-O2`: optimize without long compile times; fine for learning/examples.
- `-g`: include debug symbols (useful with `gdb` or crash backtraces).
- `-pthread`: add when using pthreads (threads, mutexes, condvars).

## Colima (optional)

Prefer a lighter engine than Docker Desktop on macOS?

```
brew install colima docker
colima start --cpu 2 --memory 2
# use the same commands as above (e.g., ./scripts/devshell.sh)
colima stop
```
