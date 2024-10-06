return {
	"nvimtools/none-ls.nvim",
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")
		null_ls.setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,

			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"typescript",
						"css",
						"scss",
						"html",
						"json",
						"yaml",
						"markdown",
						"graphql",
						"md",
						"txt",
					},
					extra_args = {
						-- "--no-semi=false",
						-- "--single-quote=true",
						-- "--jsx-single-quote=true",
						-- "--line-width=80",
						-- "--trailing-comma=all",
						-- "--no-bracket-spacing=false",
						-- "--bracket-same-line=false",
						-- "--arrow-parens=always",
						-- "--require-pragma=true",

						-- "--no-semi",
						"--single-quote",
						"--jsx-single-quote",
						"--line-width",
						"--trailing-comma",
						"--no-bracket-spacing",
						"--bracket-same-line",
						"--arrow-parens",
						"--require-pragma",
					},
				}),
				null_ls.builtins.diagnostics.stylelint.with({
					filetypes = {
						"css",
						"scss",
					},
				}),
				-- null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.completion.spell,
			},
		})
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
	end,
}
