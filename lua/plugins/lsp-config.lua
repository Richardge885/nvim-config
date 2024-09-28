return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_install = {'lua_ls', 'ts_ls', 'html', 'css', 'tailwindcss', 'emmet_ls', 'jdtls', 'pyright'}
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lsp = require('lspconfig')
            lsp.lua_ls.setup{}
            lsp.ts_ls.setup{}
            lsp.html.setup{}
            -- lsp.css.setup{}
            lsp.tailwindcss.setup{}
            lsp.emmet_ls.setup{}
            lsp.jdtls.setup{}
            lsp.pyright.setup{}

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gI", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
        end
    },
}
