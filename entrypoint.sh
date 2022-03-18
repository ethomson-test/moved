#!/bin/sh

set -euo pipefail

# check that a static file on disk has the expected value.
# this ensures that we are not re-using a container between
# action invocations.

read STATIC </tmp/static
test "${STATIC}" = "static_data"

echo "modified" >/tmp/static

# update a count of a file in the runner workdir
# this ensures that we can mutate files in the
# workdir and they are persisted back to the runner

COUNT=0

if [ -f "count" ]; then
    read COUNT <count
fi

echo $(($COUNT+1)) >count
