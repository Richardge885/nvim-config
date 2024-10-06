return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_install = { "lua_ls", "ts_ls", "html", "css", "tailwindcss", "emmet_ls", "jdtls", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp = require("lspconfig")
			lsp.lua_ls.setup({ capabilities = capabilities })
			lsp.ts_ls.setup({ capabilities = capabilities })
			lsp.html.setup({ capabilities = capabilities })
			-- lsp.css.setup({ capabilities = capabilities })
			lsp.tailwindcss.setup({ capabilities = capabilities })
			lsp.emmet_ls.setup({ capabilities = capabilities })
			lsp.jdtls.setup({ capabilities = capabilities })
			lsp.pyright.setup({ capabilities = capabilities })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})
		end,
	},
	{
		-- [[
		--    This plugin is for the pop up window for completion when during typeing
		--    It also contains the keymaps used to confirm and scrolling within the pop up window
		--]]
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local import_luasnip, luasnip = pcall(require, "luasnip")
			if not import_luasnip then
				return
			end
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
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
					{ name = "luasnip" }, -- Using LuaSnip for snippets completion
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
	{
		-- [[
		-- Source of Snippets for completion
		-- ]]
		"L3MON4D3/LuaSnip",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
}
