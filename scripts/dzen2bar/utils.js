const SEPERATOR = "";

const isSeperator = x => x.full_text === SEPERATOR;

const createItem = ({ label, icon, backgroundColor, textColor = colors.white, previousColor = colors.default }) => [
  // {
    // "full_text": SEPERATOR,
    // "color": backgroundColor,
    // "background": previousColor,
    // "separator": true,
    // "separator_block_width": 0
  // },
  {
    // "full_text": `  ${icon} ${label}  `,
    "full_text": `${label}`,
    "color": textColor,
    "background": backgroundColor,
    "separator": true,
    "separator_block_width": 0
  },
];

const darker = '\\#0a0d11';

const colors = {
  white: "\\#ffffff",
  red: "\\#dc322f",
  yellow: "\\#e69722",
  teal: "\\#2aa198",
  green: "\\#859900",
  purple: "\\#6c71c4",
  dark: '\\#505050',
  darker: darker,
  default: darker,
  highlight: '\\#ffffff',
  menu: {
    bright: {
      bg: '\\#03fa96',
      color: '\\#111111',
    },
    default: {
      bg: darker,
      color: '\\#ffffff',
    },
  },
};

const toStatusItems = list => list.map((x, i, arr) => {
  const prev = arr[i - 1];
  if (!prev || !isSeperator(x)) return x;
  return { ...x, background: prev.background };
});


const toObj = x => `^bg(\\${x.background})^fg(\\${x.color})${x.full_text}`;

const toDzen = items => items.map(toObj).reduce((a, b) => a + b, '');

const toConkyConfig = ({ config, items }) => `
conky.config = {
${
  Object.entries(config)
    .map(([key, value]) => `  ${key} = ${JSON.stringify(value)}`)
    .join(',\n')
}
}

conky.text = [[
${toDzen(items, null, 2)}
]]
`.replace(/\\\\#/g, '\\#');



module.exports = { SEPERATOR, isSeperator, createItem, colors, toStatusItems, toConkyConfig };

