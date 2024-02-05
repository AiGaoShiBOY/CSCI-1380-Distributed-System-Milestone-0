#!/bin/bash
# Invert index to create a mapping from terms to URLs containing that term
# The details of the index structure can be seen in the test cases

mapfile -t ngrams


declare -A counts

# update hashset
for ngram in "${ngrams[@]}"; do
    ((counts["$ngram"]++))
done


for key in "${!counts[@]}"; do
    echo "$key"
done | sort | while read -r gram; do
    echo "$gram | ${counts[$gram]} | $1"
done 

# echo "${!counts[@]}" | tr ' ' '\n' | sort | while read -r gram; do
#     echo "$gram | ${counts[$gram]} | $1"
# done
