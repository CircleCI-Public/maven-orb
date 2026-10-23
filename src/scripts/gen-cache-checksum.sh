#!/bin/bash
detect_os() {
  detected_platform="$(uname -s | tr '[:upper:]' '[:lower:]')"

  case "$detected_platform" in
    linux*)
      PLATFORM=linux
      ;;
    darwin*)
      PLATFORM=macos
      ;;
    msys*|cygwin*|mingw*)
      PLATFORM=windows
      ;;
    *)
      printf '%s\n' "Unsupported OS: \"$detected_platform\"."
      exit 1
      ;;
  esac
}

detect_os

if [[ "$PARAM_CHECKSUM_DIR" == /* ]]; then
    if [[ "$PLATFORM" == "windows" ]]; then
        CHECKSUM_DIR="/c$PARAM_CHECKSUM_DIR"
    else
        CHECKSUM_DIR="$PARAM_CHECKSUM_DIR"
    fi

else
    CHECKSUM_DIR="${PWD%/"$PARAM_APP_SRC_DIR"}/$PARAM_CHECKSUM_DIR"
fi
# Windows Git Bash is not root, and CircleCI's Windows images have no POSIX
# sudo. Newer Windows ships sudo.exe, which is a UAC elevator — do not probe
# for a binary named sudo on this platform.
SUDO=""
if [[ "$PLATFORM" != "windows" ]]; then
  if [ "$SYS_ENV_PLATFORM" = "linux_alpine" ]; then
    if [ "$ID" = 0 ]; then
      SUDO=""
    elif sudo -n true >/dev/null 2>&1; then
      SUDO="sudo"
    fi
  elif [ "$EUID" = 0 ]; then
    SUDO=""
  elif sudo -n true >/dev/null 2>&1; then
    SUDO="sudo"
  fi
fi
# Same prefix on xargs: a root find can list a pom.xml the job user cannot cat.
# The ">" redirect stays in this shell, so the seed file is still user-owned.
$SUDO find . -name .git -prune -o -name 'pom.xml' -print0 | sort -z | $SUDO xargs -0 cat > "$CHECKSUM_DIR"
