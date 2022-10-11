#!/bin/bash
if [ -n "" ]; then
    set -x
    set -- "$@" --settings "$PARAM_SETTINGS_FILE"
    set +x
fi
"$PARAM_MVN_COMMAND" "$PARAM_COMMAND" -Dsurefire.excludesFile=.circleci/tests/surefire_classnames_ignore_list -Dfailsafe.excludesFile=.circleci/tests/failsafe_classnames_ignore_list "$@"