#!/bin/bash

if [ -n "$PARAM_SETTINGS_FILE" ]; then
    set -- "$@" --settings "$PARAM_SETTINGS_FILE"
fi

set -x
"$PARAM_MVN_COMMAND" "$PARAM_COMMAND" "$@"
set +x