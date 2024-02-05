#!/usr/bin/env node

// Extract text from a web page

const {convert} = require('html-to-text');
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
});

let document = '';

rl.on('line', (line) => {
  document += line + '\n';
});

rl.on('close', () => {
  const text = convert(document, {
    wordwrap: null,
  });
  console.log(text);
});
