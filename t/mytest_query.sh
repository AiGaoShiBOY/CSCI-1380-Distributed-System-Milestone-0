#!/bin/bash
# test if query could successfully stem & strip

T_FOLDER=${T_FOLDER:-t}
R_FOLDER=${R_FOLDER:-}

cd "$(dirname "$0")/..$R_FOLDER" || exit 1

DIFF=${DIFF:-diff}

term=" checked stuff "

cat "$T_FOLDER"/d/d7.txt >d/global-index.txt

./query.sh "$term"

