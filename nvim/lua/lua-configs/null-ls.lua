-- Declare commonly used variables.
local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua, -- Lua formatter.
		null_ls.builtins.formatting.prettierd, -- HTML, JavaScript, etc formatter.
		null_ls.builtins.diagnostics.eslint_d, -- JavaScript linter.
		null_ls.builtins.code_actions.eslint_d, -- JavaScript code actions.
	},
})
