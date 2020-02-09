#!/usr/bin/env node

if (process.argv.length < 3) {
  console.log('Usage: xconfig.js [filename] [?customMarker]');
  process.exit(1);
}

const fs = require('fs');
const path = require('path');

// const fromEntries = l => l.reduce((acc, [k, v]) => ({ ...acc, [k]: v }), {});

const TEMPLATE_EXTENSION = '.xres-template';

const [
  filename,
] = process.argv.slice(2);

const parseXR = str => str.split('\n')
  .filter(s => !!s.trim().length)
  .filter(s => !s.startsWith('!'))
  .map(l => l.split(':'))
  .reduce((acc, [key, ...values]) => {
    const [group, ...keyFrags] = key.split('.');
    const keyname = keyFrags.join('.');
    return {
      ...acc,
      [group]: {
        ...acc[group],
        [keyname]: values.join(':').trim(),
      },
    };
  }, {});

const getXGroup = (key) => {
  const xres = parseXR(fs.readFileSync(`${process.env.HOME}/.Xresources`, 'utf-8'));
  return { ...xres['*'], ...xres[key] };
};

const getXValue = (keystr) => {
  const [groupKey, ...keyFrags] = keystr.split('.');
  const key = keyFrags.join('.');
  const group = getXGroup(groupKey);
  return group[key];
};

const outputFilepath = path.resolve(filename);
const templateFilepath = path.resolve(filename + TEMPLATE_EXTENSION);

const contents = fs.readFileSync(templateFilepath, 'utf-8');

const nextContent = contents.replace(/\{\{.*\}\}/g, match => {
  const key = match.replace(/[{}]/g, '');
  return getXValue(key);
});

fs.writeFileSync(outputFilepath, nextContent);

