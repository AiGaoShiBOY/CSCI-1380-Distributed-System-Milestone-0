#!/usr/bin/env node

// merge two files---the incoming 1-page index and the global index (on disk)
// the details of the global index can be seen in the test cases.

const fs = require('fs');
const { exit, mainModule } = require('process');
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
});

const fileName = process.argv[2];
//first read the current file, and init the global map
//The current file is stored like ngram | url1 freq url2 freq ... 
const map = new Map();
if(fs.existsSync(fileName)){
  const curContent = fs.readFileSync(fileName, "utf-8");
  const lineArr = curContent.split("\n").filter(item => item != "");
  lineArr.forEach(line => {
    if(!line){
      return;
    }
    const entries = line.split("|").filter(item => item != "");
    const ngram = entries[0];
    const urlAndFreq = entries[1];
    map.set(ngram, urlAndFreq);
  });
}

rl.on('line', (line) => {
  //parse the new lines from std
  //new lines should be ngram | freq | url
  const lineArr = line.split("|").filter(item => item != "");
  const ngram = lineArr[0];
  const freq = lineArr[1].trim();
  const url = lineArr[2].trim(); 
  //rewrite map
  if(map.has(ngram)){
    const curVal = map.get(ngram);
    const newVal = curVal + " " + url + " " + freq;
    map.set(ngram, newVal);
  }else{
    map.set(ngram, " " + url + " " + freq);
  }
});

rl.on('close', () => {
  mergeIndices();
});

const mergeIndices = () => {
  let output = "";
  map.forEach((value, key) => {
    lineVal = key + "|" + value;
    //output to shell
    console.log(lineVal);
    output += lineVal + "\n";
  });
  fs.writeFileSync(fileName, output);
}


