-- Declare commonly used variables.
local opt = vim.opt
local api = vim.api
local options = { noremap = true, silent = true }

-- Set options.
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.ignorecase = true
opt.hlsearch = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.hidden = true
opt.completeopt = "menu,menuone,noselect"
opt.cursorline = true
opt.signcolumn = "yes:1"

-- Set filetypes to be used with 2 spaces of indentations.
local fileTypes = { "lua", "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css", "json" }

-- Loop through `fileTypes` and set the tabstop and shiftwidth.
for _, fileType in ipairs(fileTypes) do
	api.nvim_create_autocmd("FileType", { pattern = fileType, command = "setlocal tabstop=2 shiftwidth=2" })
end

-- Move around splits
vim.api.nvim_set_keymap("n", "<A-h>", "<C-w>h", options)
vim.api.nvim_set_keymap("n", "<A-j>", "<C-w>j", options)
vim.api.nvim_set_keymap("n", "<A-k>", "<C-w>k", options)
vim.api.nvim_set_keymap("n", "<A-l>", "<C-w>l", options)
