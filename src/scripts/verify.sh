#!/bin/bash
if [ -n "$PARAM_SETTINGS_FILE" ]; then
    set -- "$@" --settings "$PARAM_SETTINGS_FILE"
fi

$PARAM_MVN_COMMAND org.apache.maven.plugins:maven-dependency-plugin:"$PARAM_DEP_PLUGIN_VER":go-offline "$@"