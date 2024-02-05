#!/bin/bash

# Provided an appropriate index, the query could be implemented using grep
# along  with appropriate stemming of the input strings and stripping of the 
# index metadata


if [ "$#" -eq 0 ]; then
    echo "Usage $0 search_term"
    exit 1
fi


search_term=$(echo "$@" | sed "s/^ *//;s/ *$//" | tr ' ' '\n' | c/stem.js | tr '\n' ' ' )

grep -i "$search_term" d/global-index.txt

