#!/bin/bash

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
