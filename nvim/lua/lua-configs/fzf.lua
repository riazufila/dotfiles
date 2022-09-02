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
	},
})

api.nvim_set_keymap("n", "<Leader>ff", "<cmd>lua require('fzf-lua').files()<CR>", opts)
api.nvim_set_keymap("n", "<Leader>fg", "<cmd>lua require('fzf-lua').grep()<CR>", opts)
