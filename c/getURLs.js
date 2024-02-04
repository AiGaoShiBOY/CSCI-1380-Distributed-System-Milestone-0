#!/usr/bin/env node

const readline = require('readline');
const { JSDOM } = require('jsdom');
const { URL } = require('url');

// Example usage:
const inputUrl = process.argv[2].replace(/\/+$/, '');
//check if the url its a file or a dic
const inputUrlArr = inputUrl.split("/").filter(item => item != "");
const lastHref = inputUrlArr[inputUrlArr.length - 1];
let baseURL = "";
if(lastHref.endsWith(".html")){
  baseURL = inputUrl.substring(0, inputUrl.length - lastHref.length - 1);
}else{
  baseURL = inputUrl;
}
//make it a dic
baseURL += "/";


const rl = readline.createInterface({
  input: process.stdin,
});



let domContent = "";


//collect the whole dom content
rl.on("line", (line) => {
  domContent += line; 
});


rl.on("close", () => {
  const dom = new JSDOM(domContent);
  const document = dom.window.document;
  //find all links
  const links = document.querySelectorAll("a");
  links.forEach(link => {
    const href = link.getAttribute("href");
    if(!href){
      return; 
    }
    const absoluteURL = new URL(href, baseURL).href;
    console.log(absoluteURL);     
  });
});



