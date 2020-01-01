const SEPERATOR = "";

const isSeperator = x => x.full_text === SEPERATOR;

const createItem = ({ label, icon, backgroundColor, textColor = colors.white, previousColor = colors.default }) => [
  {
    "full_text": SEPERATOR,
    "color": backgroundColor,
    "background": previousColor,
    "separator": true,
    "separator_block_width": 0
  },
  {
    "full_text": `  ${icon} ${label}  `,
    "color": textColor,
    "background": backgroundColor,
    "separator": true,
    "separator_block_width": 0
  },
];

const colors = {
  white: "\\#fdf6e3",
  red: "\\#dc322f",
  yellow: "\\#e69722",
  teal: "\\#2aa198",
  green: "\\#859900",
  purple: "\\#6c71c4",
  default: "\\#2F2F2F",
};

const toStatusItems = list => list.map((x, i, arr) => {
  const prev = arr[i - 1];
  if (!prev || !isSeperator(x)) return x;
  return { ...x, background: prev.background };
});

const toConkyConfig = ({ config, items }) => `
conky.config = {
${
  Object.entries(config)
    .map(([key, value]) => `  ${key} = ${JSON.stringify(value)}`)
    .join(',\n')
}
}

conky.text = [[
${JSON.stringify(items, null, 2)},
]]
`.replace(/\\\\#/g, '\\#');



module.exports = { SEPERATOR, isSeperator, createItem, colors, toStatusItems, toConkyConfig };

