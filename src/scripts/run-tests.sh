#!/bin/bash

# If we're being run by the parallel_test command then this env will be set and we need to
# tell maven where to find the ignore lists so that we only run the tests that we're supposed to
if [ -n "$PARAM_PARALLEL_IGNORE_LISTS_EXIST" ]; then
    set -- "$@" -Dsurefire.excludesFile=.circleci/tests/surefire_classnames_ignore_list -Dfailsafe.excludesFile=.circleci/tests/failsafe_classnames_ignore_list
fi

if [ -n "$PARAM_SETTINGS_FILE" ]; then
    set -- "$@" --settings "$PARAM_SETTINGS_FILE"
fi

set -x
# shellcheck disable=SC2086
$PARAM_MVN_COMMAND $PARAM_COMMAND "$@"

set +x
