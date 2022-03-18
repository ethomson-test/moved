#!/bin/sh

COUNT=0

if [ -f "count" ]; then
    read COUNT <count
fi

echo $(($COUNT+1)) >count
