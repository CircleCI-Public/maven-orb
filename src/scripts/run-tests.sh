#!/bin/bash

# If we're being run by the parallel_test command then this env will be set and we need to
# tell maven where to find the ignore lists so that we only run the tests that we're supposed to
if [ -n "$PARAM_PARALLEL_IGNORE_LISTS_EXIST" ]; then
    set -- "$@" -Dsurefire.excludesFile=.circleci/tests/surefire_classnames_ignore_list -Dfailsafe.excludesFile=.circleci/tests/failsafe_classnames_ignore_list
fi

if [ -n "$PARAM_SETTINGS_FILE" ]; then
    set -- "$@" --settings "$PARAM_SETTINGS_FILE"
fi

# Loop over each line in PARAM_COMMAND
printf '%s\n' "$PARAM_COMMAND" | while IFS= read -r LINE_FROM_PARAM_COMMAND; do
    # Strip leading and trailing whitespace
    TRIMMED_LINE_FROM_PARAM_COMMAND=$(echo "$LINE_FROM_PARAM_COMMAND" | xargs)
    # Check if the line is not empty
    if [ -n "$TRIMMED_LINE_FROM_PARAM_COMMAND" ]; then
        # Invoke the command with the trimmed line and additional arguments
        (
            set -x
            # shellcheck disable=SC2086
            $PARAM_MVN_COMMAND $TRIMMED_LINE_FROM_PARAM_COMMAND "$@"
        ) || exit 1
    fi
done
