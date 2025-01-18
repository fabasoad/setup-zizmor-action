#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  version="${1}"
  if command -v brew >/dev/null 2>&1; then
    if [ "${version}" = "latest" ]; then
      brew install zizmor
    else
      brew install zizmor@${version}
    fi
  elif command -v cargo >/dev/null 2>&1; then
    if [ "${version}" = "latest" ]; then
      cargo install --locked zizmor
    else
      cargo install --locked zizmor --version ${version}
    fi
  elif command -v pip >/dev/null 2>&1; then
    if [ "${version}" = "latest" ]; then
      pip install zizmor
    else
      pip install zizmor==${version}
    fi
  elif command -v pipx >/dev/null 2>&1; then
    if [ "${version}" = "latest" ]; then
      pipx install zizmor
    else
      pipx install zizmor==${version}
    fi
  elif command -v uv >/dev/null 2>&1; then
    if [ "${version}" = "latest" ]; then
      uv tool install zizmor
    else
      uv tool install zizmor==${version}
    fi
  elif command -v conda >/dev/null 2>&1; then
    if [ "${version}" = "latest" ]; then
      conda install conda-forge::zizmor
    else
      conda install conda-forge::zizmor=${version}
    fi
  elif command -v pacman >/dev/null 2>&1; then
    pacman -Syu
    if [ "${version}" = "latest" ]; then
      pacman -S zizmor
    else
      pacman -S zizmor=${version}
    fi
  elif command -v zypper >/dev/null 2>&1; then
    zypper refresh
    zypper update
    if [ "${version}" = "latest" ]; then
      zypper install zizmor
    else
      zypper install zizmor=${version}
    fi
  else
    msg="No supported package managers found. Please install one of the"
    msg="${msg} following tools before running this GitHub Action and try"
    msg="${msg} again: brew, cargo, pip, pipx, uv, conda, pacman, zypper."
    log_error "${msg}"
    exit 1
  fi
}

main "$@"
