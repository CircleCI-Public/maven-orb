#!/bin/bash
if [ -n "$PARAM_SETTINGS_FILE" ]; then
    set -- "$@" --settings "$PARAM_SETTINGS_FILE"
fi

set -x
$PARAM_MVN_COMMAND org.apache.maven.plugins:maven-dependency-plugin:3.1.2:go-offline "$@"
set +x