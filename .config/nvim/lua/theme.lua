--local present, tokyonight = pcall(require, "tokyonight")
--
--if present then
--  vim.g.tokyonight_style = "night"
--  vim.cmd[[colorscheme tokyonight]]
--
--  return true
--else
--  return false
--end



require('colorbuddy').colorscheme('gruvbuddy')
require("colorizer").setup()
