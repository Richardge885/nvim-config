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
		end,
	},
}
