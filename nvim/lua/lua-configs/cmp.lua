-- Declare commonly used variables.
local cmp = require("cmp")
local luasnip = require("luasnip")
local fn = vim.fn

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

if cmp ~= nil then
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		}, {
			{ name = "buffer" },
		}),
		formatting = {
			format = function(_, vim_item)
				-- If `vim_item` is a string,
				-- return as it is.
				if type(vim_item) == "string" then
					return vim_item
				end

				local item = "abbr"

				-- Check if abbr item exist
				-- if it is a dictionary.
				if vim_item.abbr == nil then
					-- If not, use the item `word` instead.
					item = "word"
				end

				local label = vim_item[item]
				local truncated_label = fn.strcharpart(label, 0, 50) -- Label with maxed width.

				-- If original label exceeds the truncated label,
				-- use truncated label instead.
				if truncated_label ~= label then
					vim_item[item] = truncated_label .. "..."
				end

				-- Disable `menu` item.
				vim_item.menu = ""

				return vim_item
			end,
		},
	})

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" },
		}, {
			{ name = "buffer" },
		}),
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end
