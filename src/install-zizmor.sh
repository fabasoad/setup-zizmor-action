#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  version="${1}"
  if [ "${version}" = "latest" ]; then
    pip install zizmor
  else
    pip install zizmor==${version}
  fi
}

main "$@"
