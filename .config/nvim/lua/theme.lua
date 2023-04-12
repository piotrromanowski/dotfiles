
vim.opt.termguicolors = true

local gruvBuddy = require("colorbuddy").colorscheme "gruvbuddy"
require("colorizer").setup()

local c = require("colorbuddy.color").colors
local Group = require("colorbuddy.group").Group
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles

Group.new("@variable", c.superwhite, nil)

Group.new("GoTestSuccess", c.green, nil, s.bold)
Group.new("GoTestFail", c.red, nil, s.bold)

Group.new("TSPunctBracket", c.orange:light():light())

Group.new("StatuslineError1", c.red:light():light(), g.Statusline)
Group.new("StatuslineError2", c.red:light(), g.Statusline)
Group.new("StatuslineError3", c.red, g.Statusline)
Group.new("StatuslineError3", c.red:dark(), g.Statusline)
Group.new("StatuslineError3", c.red:dark():dark(), g.Statusline)

Group.new("pythonTSType", c.red)
Group.new("goTSType", g.Type.fg:dark(), nil, g.Type)

Group.new("typescriptTSConstructor", g.pythonTSType)
Group.new("typescriptTSProperty", c.blue)

Group.new("WinSeparator", nil, nil)

Group.new("TSTitle", c.blue)

-- TODO: It would be nice if we could only highlight
-- the text with characters or something like that...
-- but we'll have to stick to that for later.
Group.new("InjectedLanguage", nil, g.Normal.bg:dark())

Group.new("LspParameter", nil, nil, s.italic)
Group.new("LspDeprecated", nil, nil, s.strikethrough)
Group.new("@function.bracket", g.Normal, g.Normal)
--
--require('colorbuddy').colorscheme "gruvbuddy"
--require("colorbuddy").setup()

--local Color = require('colorbuddy').Color
--
--Color.new('white',     '#f2e5bc')
--Color.new('red',       '#cc6666')
--Color.new('pink',      '#fef601')
--Color.new('green',     '#99cc99')
--Color.new('yellow',    '#f8fe7a')
--Color.new('blue',      '#81a2be')
--Color.new('aqua',      '#8ec07c')
--Color.new('cyan',      '#8abeb7')
--Color.new('purple',    '#8e6fbd')
--Color.new('violet',    '#b294bb')
--Color.new('orange',    '#de935f')
--Color.new('brown',     '#a3685a')
--
--Color.new('seagreen',  '#698b69')
--Color.new('turquoise', '#698b69')
--
--require("colorizer").setup()
