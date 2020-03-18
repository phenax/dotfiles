#!/usr/bin/env node

const { createItem, colors, toStatusItems, toConkyConfig } = require('./utils');

// Global config
const config = {
  out_to_x: false,
  own_window: false,
  out_to_console: true,
  background: false,
  max_text_width: 0,
  update_interval: 0.3,
  total_run_times: 0,
  short_units: true,
  if_up_strictness: "address",
  use_spacer: "left",
  override_utf8_locale: false,
  cpu_avg_samples: 2,
};

const brightMenu = {
  backgroundColor: colors.menu.bright.bg,
  textColor: colors.menu.bright.color,
};

const defaultMenu = {
  backgroundColor: colors.menu.default.bg,
  textColor: colors.menu.default.color,
}

let statusItems = [];



if (process.argv.includes('workspaces')) {
  statusItems = toStatusItems([
    ...createItem({
      label: "${exec ~/scripts/dzen2bar/menuitems.sh workspaces}",
      ...defaultMenu,
    })
  ]);
} else {
  statusItems = toStatusItems([
    ...createItem({
      icon: "${exec ~/scripts/dzen2bar/menuitems.sh volume_icon}",
      label: "   ${exec ~/scripts/dzen2bar/menuitems.sh volume}   ",
      ...brightMenu,
    }),
    ...createItem({
      icon: " ${exec ~/scripts/dzen2bar/menuitems.sh spotify_song_icon} ",
      label: "   ${exec ~/scripts/dzen2bar/menuitems.sh spotify_song}   ",
      ...defaultMenu,
    }),
    ...createItem({
      icon: "   ",
      label: "   ${time %A, %d %b}  | ${time %l:%M %p}   ",
      ...brightMenu,
    }),
    ...createItem({
      icon: "  ${exec ~/scripts/dzen2bar/menuitems.sh battery_icon}",
      label: "   ${exec ~/scripts/dzen2bar/menuitems.sh battery}   ",
      ...defaultMenu,
    }),
  ]);
}

console.log(toConkyConfig({ config, items: statusItems }));

