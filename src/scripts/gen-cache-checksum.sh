#!/bin/bash
if [[ "$PARAM_CHECKSUM_DIR" == /* ]]; then 
    CHECKSUM_DIR="$PARAM_CHECKSUM_DIR"
else
    CHECKSUM_DIR="${PWD%/"$PARAM_APP_SRC_DIR"}/$PARAM_CHECKSUM_DIR"
fi
find . -name "pom.xml" | sort | xargs cat > "$CHECKSUM_DIR"