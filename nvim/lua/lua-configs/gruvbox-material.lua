-- Declare commonly used variables.
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd

opt.background = "dark"
g.gruvbox_material_background = "medium"
g.gruvbox_material_palette = "original"
g.gruvbox_material_better_performance = 1

cmd([[colorscheme gruvbox-material]])
