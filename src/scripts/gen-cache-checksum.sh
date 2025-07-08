#!/bin/bash
find . -name "pom.xml" | sort | xargs cat > "$PARAM_CHECKSUM_DIR"