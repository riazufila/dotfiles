-- Declare commonly used variables.
local opts = { noremap = true, silent = true }
local api = vim.api

require("fzf-lua").setup({
	fzf_opts = {
		["--info"] = "default", -- Set match records information UI.
		["--layout"] = "reverse", -- Set layout.
		["--no-multi"] = true, -- Disable multiple files selection.
	},
	grep = {
		search = "", -- Default to searching empty string.
		no_header_i = true, -- Disable header.
		actions = {
			["ctrl-g"] = false, -- Disable changing grep from Fuzzy to Regex and vice versa.
		},
		-- Include files and folders in .gitignore.
		grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp --no-ignore",
		rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 --no-ignore",
	},
	winopts = {
		hl = {
			cursor = "NONE", -- Remove cursor highlight in previewer.
		},
	},
	files = {
		-- Disable icons.
		git_icons = false,
		file_icons = false,
		color_icons = false,
		-- Include files and folders in .gitignore.
		find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n' --no-ignore]],
		rg_opts = "--color=never --files --hidden --follow -g '!.git' --no-ignore",
		fd_opts = "--color=never --type f --hidden --follow --exclude .git --no-ignore",
	},
})

api.nvim_set_keymap("n", "<Leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", opts)
api.nvim_set_keymap("n", "<Leader>fg", "<cmd>lua require('fzf-lua').grep()<CR>", opts)
