#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="ostep-dev"

if ! docker image inspect "$IMAGE_NAME" >/dev/null 2>&1; then
  echo "[devshell] Building image '$IMAGE_NAME'..." >&2
  docker build -t "$IMAGE_NAME" .
fi

DOCKER_ARGS=(
  --rm -it
  -v "${PWD}:/work"
  -w /work
)

exec docker run "${DOCKER_ARGS[@]}" "$IMAGE_NAME" "$@"
