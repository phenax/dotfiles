conky.config = {
  out_to_x = true,

  own_window = true,
  own_window_class = 'PhenaxHelpView',
  own_window_transparent = false,
  own_window_argb_visual = true,
  own_window_argb_value = 99,
  -- own_window_type = 'override',

  use_xft = true,
  draw_shades = false,
  draw_outline = false,
  draw_borders = false,
  draw_graph_borders = false,

	minimum_width = 800, minimum_height = 500,
	maximum_width = 1000,

	alignment = 'middle_middle',

  gap_x = 0,
  gap_y = 0,

	font = 'Ubuntu:size=7',

	color1 = '#FFFFFF',
	color2 = '#AAAAAA',
	color3 = '#888888',
	color4 = '#EF5A29',
}

conky.text = [[
${goto 100 100}${font Source Code Pro for Powerline:size=48}Wow${font} 

${color4}Hello world${color1}
Wwo
]]

