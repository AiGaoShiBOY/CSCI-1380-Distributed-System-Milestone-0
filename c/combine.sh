#!/bin/bash
#
# Combine terms to create  n-grams (for n=1,2,3) and then count and sort them

mapfile -t lines

for ((i = 0; i < ${#lines[@]}; i++)); do
  for ((j = 0; j < 3 && i + j < ${#lines[@]}; j++)); do
    ngram=""
    for ((k = 0; k <= j; k++)); do
      if [ -z "$ngram" ]; then
        ngram="${lines[i+k]}"
      else
        ngram+=" ${lines[i+k]}"
      fi
    done
    echo "$ngram"
  done
done | sort -t '|' -k1,1

