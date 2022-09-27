-- Declare commonly used variables.
local opts = { noremap = true, silent = true }
local api = vim.api

api.nvim_set_keymap("n", "<C-n>", "<Cmd>NvimTreeToggle<CR>", opts)

require("nvim-tree").setup({
	view = {
		adaptive_size = true, -- Adapt size according to content.
		side = "left",
		mappings = {
			list = {
				{ key = "<C-x>", action = "" }, -- Unset split action.
				{ key = "<C-s>", action = "split" }, -- Set split action.
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		highlight_git = true,
		highlight_opened_files = "name",
		icons = {
			show = {
				-- Disable all icons.
				file = false,
				folder = false,
				folder_arrow = false,
				git = false,
			},
		},
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
	git = {
		enable = true,
		ignore = false,
	},
	open_on_tab = true,
	update_focused_file = {
		enable = true, -- Highlight the current file opened.
	},
})
