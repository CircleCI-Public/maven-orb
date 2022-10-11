#!/bin/bash

if [ -n "" ]; then
    set -- "$@" --settings "$PARAM_SETTINGS_FILE"
fi

set -x
"$PARAM_MVN_COMMAND" "$PARAM_COMMAND" -Dsurefire.excludesFile=.circleci/tests/surefire_classnames_ignore_list -Dfailsafe.excludesFile=.circleci/tests/failsafe_classnames_ignore_list "$@"
set +x