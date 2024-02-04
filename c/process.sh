#!/bin/bash
# process text to convert it to maintain one word per 
# line, convert it to lowercase ascii, and remove any stopwords 
# useful commands: tr, iconv, grep

tr -cs A-Za-z '\n' | tr A-Z a-z | iconv -f UTF-8 -t ASCII//TRANSLIT | grep -vx -f "d/stopwords.txt" 
