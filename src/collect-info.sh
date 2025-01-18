#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  input_force="${1}"

  if command -v brew >/dev/null 2>&1 \
    || command -v cargo >/dev/null 2>&1 \
    || command -v pip >/dev/null 2>&1 \
    || command -v pipx >/dev/null 2>&1 \
    || command -v uv >/dev/null 2>&1 \
    || command -v conda >/dev/null 2>&1 \
    || command -v pacman >/dev/null 2>&1 \
    || command -v zypper >/dev/null 2>&1; then
    setup_cargo="false"
  else
    setup_cargo="true"
  fi
  echo "setup-cargo=${setup_cargo}" >> "$GITHUB_OUTPUT"

  brew_installed=$(if command -v brew >/dev/null 2>&1; then echo true; else echo false; fi)
  echo "brew-installed=${brew_installed}" >> "$GITHUB_OUTPUT"

  cargo_installed=$(if command -v cargo >/dev/null 2>&1; then echo true; else echo false; fi)
  echo "cargo-installed=${cargo_installed}" >> "$GITHUB_OUTPUT"

  pip_installed=$(if command -v pip >/dev/null 2>&1; then echo true; else echo false; fi)
  echo "bash-installed=${pip_installed}" >> "$GITHUB_OUTPUT"

  pipx_installed=$(if command -v pipx >/dev/null 2>&1; then echo true; else echo false; fi)
  echo "pipx-installed=${pipx_installed}" >> "$GITHUB_OUTPUT"

  uv_installed=$(if command -v uv >/dev/null 2>&1; then echo true; else echo false; fi)
  echo "uv-installed=${uv_installed}" >> "$GITHUB_OUTPUT"

  conda_installed=$(if command -v conda >/dev/null 2>&1; then echo true; else echo false; fi)
  echo "conda-installed=${conda_installed}" >> "$GITHUB_OUTPUT"

  pacman_installed=$(if command -v pacman >/dev/null 2>&1; then echo true; else echo false; fi)
  echo "pacman-installed=${pacman_installed}" >> "$GITHUB_OUTPUT"

  zypper_installed=$(if command -v zypper >/dev/null 2>&1; then echo true; else echo false; fi)
  echo "zypper-installed=${zypper_installed}" >> "$GITHUB_OUTPUT"

  bin_installed="false"
  if command -v zizmor >/dev/null 2>&1; then
    if [ "${input_force}" = "false" ]; then
      msg="Installation skipped."
      bin_installed="true"
    else
      msg="Executing forced installation."
    fi
    log_info "zizmor is found at $(which zizmor). ${msg}"
  else
    log_info "zizmor is not found. Executing installation."
  fi
  echo "bin-installed=${bin_installed}" >> "$GITHUB_OUTPUT"
}

main "$@"
