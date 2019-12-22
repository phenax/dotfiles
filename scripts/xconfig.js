#!/usr/bin/env node

if (process.argv.length < 3) {
  console.log('Usage: xconfig.js [filename] [?customMarker]');
  process.exit(1);
  return;
}

const fs = require('fs');
const path = require('path');

const EMPTY_LINE = '#EMPTY_LINE';
const [
  filename,
  MARKER = '#>>XConfig',
  MAP_MARKER = '#>>XMap',
] = process.argv.slice(2);
const isCopyConfig = l => /^\*\.(color\d+|foreground|background|cursorColor)/.test(l);

const parseXR = str => str.split('\n')
  .filter(isCopyConfig)
  .map(l => l.replace(/(\*\.|\:)/gi, ''))
  .map(l => l.split(/\s+/));

const filepath = path.resolve(filename);
const xConfig = parseXR(fs.readFileSync(`${process.env.HOME}/.Xresources`, 'utf-8'));

function main() {
  const content = fs.readFileSync(filepath, 'utf-8');
  const lines = content.split('\n');

  let inBlock = false;
  const mappings = [];
  const resultStr = lines.map(l => {
    if (l.startsWith(MAP_MARKER)) {
      const mapping = l.replace(MAP_MARKER, '').trim().split(' ');
      mappings.push(mapping);
      return l;
    }

    if (l.startsWith(MARKER + 'End')) {
      inBlock = false;
      return l;
    }

    if (l.startsWith(MARKER)) {
      inBlock = true;
      const templateStr = l.replace(MARKER, '').trim();
      const results = xConfig
        .map(([k, v]) => {
          const mapping = mappings.find(([key]) => k === key);
          return mapping ? [mapping[1] || k, v] : [k, v];
        })
        .map(([k, v]) =>
          templateStr
            .replace('{key}', k)
            .replace('{value}', v)
        );
      return `${l}\n${results.join('\n')}`;
    }

    if (inBlock) {
      return EMPTY_LINE;
    }

    return l;
  }).filter(l => !l.includes(EMPTY_LINE)).join('\n');

  fs.writeFileSync(filepath, resultStr);
  console.log('Done');
}

main();

