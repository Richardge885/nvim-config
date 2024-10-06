return {
    {
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
                    null_ls.builtins.formatting.prettierd.with({
                        filetypes = {
                            "javascript",
                            "typescript",
                            "javascriptreact",
                            "typescriptreact",
                            "css",
                            "scss",
                            "html",
                            "json",
                            "yaml",
                            "graphql",
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
    },
    {
        "MunifTanjim/prettier.nvim",
        config = function()
            require("prettier").setup({
                bin = "prettier",
                cli_options = {
                    arrow_parens = "always",
                    bracket_spacing = true,
                    bracket_same_line = false,
                    embedded_language_formatting = "auto",
                    end_of_line = "lf",
                    html_whitespace_sensitivity = "css",
                    jsx_bracket_same_line = false,
                    jsx_single_quote = false,
                    print_width = 80,
                    prose_wrap = "preserve",
                    quote_props = "as-needed",
                    semi = true,
                    single_attribute_per_line = true,
                    single_quote = true,
                    tab_width = 4,
                    trailing_comma = "es5",
                    use_tabs = false,
                    vue_indent_script_and_style = false,
                },
            })
        end,
    },
}
