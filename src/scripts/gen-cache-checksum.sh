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
find . -name "pom.xml" | sort | xargs cat > "$CHECKSUM_DIR"