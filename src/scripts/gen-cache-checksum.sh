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
    msys*|cygwin*)
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
if [ "$SYS_ENV_PLATFORM" = "linux_alpine" ]; then
  if [ "$ID" = 0 ]; then export SUDO=""; else export SUDO="sudo"; fi
else
  if [ "$EUID" = 0 ]; then export SUDO=""; else export SUDO="sudo"; fi
fi
$SUDO find . -name .git -prune -o -name 'pom.xml' -print0 | sort -z | xargs -0 cat > "$CHECKSUM_DIR"
