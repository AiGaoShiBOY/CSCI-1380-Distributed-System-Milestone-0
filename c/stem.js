#!/usr/bin/env node

// use Porter Stemmer to stem individual terms in a streaming fashion

var readline = require('readline');
var natural = require('natural');
let stemmer = natural.PorterStemmer;

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false,
});

rl.on('line', function(line) {
  const stemmedLine = stemmer.stem(line);
  console.log(stemmedLine);
});
