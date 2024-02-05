# test different types of url input
#!/bin/bash
T_FOLDER=${T_FOLDER:-t}
R_FOLDER=${R_FOLDER:-}

cd "$(dirname "$0")/..$R_FOLDER" || exit 1

DIFF=${DIFF:-diff}

url="https://cs.brown.edu/courses/csci1380/sandbox/1/level_1a"

if $DIFF <(cat "$T_FOLDER"/d/d0.txt | c/getURLs.js $url | sort) <(sort "$T_FOLDER"/d/d1.txt) >/dev/null; then
  echo "$0 success: URL with dictonary passed"
else
  echo "$0 failure: URL with dictonary failed"
fi

url="https://cs.brown.edu/courses/csci1380/sandbox/1/level_1a/index.html"

if $DIFF <(cat "$T_FOLDER"/d/d0.txt | c/getURLs.js $url | sort) <(sort "$T_FOLDER"/d/d1.txt) >/dev/null; then
  echo "$0 success: URL with html passed"
else
  echo "$0 failure: URL with html failed"
fi

url="https://cs.brown.edu/courses/csci1380/sandbox/1/level_1a/"

if $DIFF <(cat "$T_FOLDER"/d/d0.txt | c/getURLs.js $url | sort) <(sort "$T_FOLDER"/d/d1.txt) >/dev/null; then
  echo "$0 success: URL with dictonary/ passed"
else
  echo "$0 failure: URL with dictonary/ failed"
fi

url="https://cs.brown.edu/courses/csci1380/sandbox/1/level_1a/index.html"

if $DIFF <(cat "$T_FOLDER"/d/d0.txt | c/getURLs.js $url | sort) <(sort "$T_FOLDER"/d/d1.txt) >/dev/null; then
  echo "$0 success: URL with html/ passed"
else
  echo "$0 failure: URL with html/ failed"
fi
