#!/usr/bin/env node

let chunks = '';

process.stdin.on('data', data => chunks += data.toString());

process.stdin.on('end', () => {
  const script = chunks
    .replace(/.*\n/, '') // Remove first line
    .replace(/\s(variant|array|dict|uint(32|64)|string|double|int(32|64)|bool(ean)?)\s/g, '') // Strip type annotations
    .replace(/(["|)])(\s)/g, '$1,$2')
  ;

  const object = {};
  function entry(key, value) {
    const modKey = key.replace(/:/g, '__');
    object[modKey] = value;
  }

  eval(script);

  console.log(JSON.stringify(object));
});

