#!/usr/bin/env node

const { createItem, colors, isSeperator, toStatusItems, toConkyConfig } = require('./utils');

// Global config
const config = {
  out_to_x: false,
  own_window: false,
  out_to_console: true,
  background: false,
  max_text_width: 0,
  update_interval: 1.0,
  total_run_times: 0,
  short_units: true,
  if_up_strictness: "address",
  use_spacer: "left",
  override_utf8_locale: false,
  cpu_avg_samples: 2,
};

// Item config
// const statusItems = toStatusItems([
  // ...createItem({
    // icon: "🔉",
    // label: "${exec ~/scripts/menuitems.sh volume}",
    // backgroundColor: colors.teal,
  // }),
  // ...createItem({
    // icon: " ☀ ",
    // label: "${exec ~/scripts/menuitems.sh brightness}",
    // backgroundColor: colors.green,
  // }),
  // ...createItem({
    // icon: "🕗",
    // label: "${time %a, %d/%m/%y} ${time %l:%M %p}",
    // backgroundColor: colors.red,
  // }),
  // ...createItem({
    // icon: "",
    // label: "${exec ~/scripts/menuitems.sh battery}",
    // backgroundColor: colors.purple,
  // }),
// ]);


const statusItems = toStatusItems([
  ...createItem({
    icon: "🔉",
    label: "${exec ~/scripts/menuitems.sh volume}",
    backgroundColor: colors.dark,
    textColor: colors.white,
  }),
  ...createItem({
    icon: " ☀ ",
    label: "${exec ~/scripts/menuitems.sh brightness}",
    backgroundColor: colors.darker,
    textColor: colors.white,
  }),
  ...createItem({
    icon: "🕗",
    label: "${time %A, %d %b}  |  ${time %l:%M %p}",
    backgroundColor: colors.dark,
    textColor: colors.white,
  }),
  ...createItem({
    icon: "",
    label: "${exec ~/scripts/menuitems.sh battery}",
    backgroundColor: colors.darker,
    textColor: colors.white,
  }),
]);

console.log(toConkyConfig({ config, items: statusItems }));

