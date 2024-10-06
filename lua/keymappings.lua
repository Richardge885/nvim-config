-- Keymaps
-- Remap Leader Key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }

-- Better Save Command
vim.keymap.set("n", "<leader>s", "<CMD>w<CR>")
vim.keymap.set("n", "<C-q>", "<CMD>q<CR>")
-- vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("n", "<A-a>", "ggVG")
vim.keymap.set("n", "<leader>c", "<cmd>bdelete<cr>")
vim.keymap.set("n", "<C-m>", "%")
vim.keymap.set("v", "<C-m>", "%")
vim.keymap.set("x", "<C-m>", "%")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Better Escape
vim.keymap.set("i", "fd", "<ESC>", opts)
vim.keymap.set("v", "fd", "<ESC>", opts)
vim.keymap.set("x", "fd", "<ESC>", opts)
-- Escape with Ctrl+c
vim.keymap.set("n", "<C-c>", "<ESC>", opts)
vim.keymap.set("i", "<C-c>", "<ESC>", opts)
vim.keymap.set("v", "<C-c>", "<ESC>", opts)
vim.keymap.set("x", "<C-c>", "<ESC>", opts)

-- Moving Between Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Splitting Windows
vim.keymap.set("n", "ss", "<C-w>s", opts)
vim.keymap.set("n", "sv", "<C-w>v", opts)

-- vim.keymap.set("n", "<leader>e", "<CMD>Ex<CR>") -- Currently used for file explore

-- Navigate buffers
-- vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
-- vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- Stay in indent mode
vim.keymap.set("v", ">", ">gv^", opts)
vim.keymap.set("v", "<", "<gv^", opts)

-- Move text up and down
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "p", '"_dP', opts)
