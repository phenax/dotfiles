#!/usr/bin/env node

if (process.argv.length < 3) {
  console.log('Usage: xconfig.js [filename] [?customMarker]');
  process.exit(1);
}

const fs = require('fs');
const path = require('path');

const fromEntries = l => l.reduce((acc, [k, v]) => ({ ...acc, [k]: v }), {});

const TEMPLATE_EXTENSION = '.xres-template';

const [
  filename,
] = process.argv.slice(2);

const parseXR = str => {
  const lines = str.split('\n')
    .filter(s => !!s.trim().length)
    .filter(s => !s.startsWith('!'));

  const variables = fromEntries(
    lines
      .filter(s => s.startsWith('#define'))
      .map(s => s.split(/\s+/))
      .map(([_, key, value]) => [key, value])
  );

  return lines
    .filter(s => !s.startsWith('#'))
    .map(l => l.split(':'))
    .reduce((acc, [key, ...values]) => {
      const [group, ...keyFrags] = key.split('.');
      const keyname = keyFrags.join('.');
      const value = values.join(':').trim();
      return {
        ...acc,
        [group]: {
          ...acc[group],
          [keyname]: variables[value] || value,
        },
      };
    }, {});
};

const getXGroup = (key, xres) => ({ ...xres['*'], ...xres[key] });

const getXValue = (keystr, xres) => {
  const [groupKey, ...keyFrags] = keystr.split('.');
  const key = keyFrags.join('.');
  const group = getXGroup(groupKey, xres);
  return group[key];
};

const outputFilepath = path.resolve(filename);
const templateFilepath = path.resolve(filename + TEMPLATE_EXTENSION);

const contents = fs.readFileSync(templateFilepath, 'utf-8');

const xres = parseXR(fs.readFileSync(`${process.env.HOME}/.Xresources`, 'utf-8'));

const nextContent = contents.replace(/\{\{.*\}\}/g, match => {
  const key = match.replace(/[{}]/g, '');
  return getXValue(key, xres);
});

console.log(nextContent);

fs.writeFileSync(outputFilepath, nextContent);

