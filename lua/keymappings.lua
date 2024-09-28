-- Keymaps
-- Remap Leader Key to Space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opts = { noremap = true, silent = true }

-- Better Save Command
vim.keymap.set("n", "<leader>s", "<CMD>w<CR>")
vim.keymap.set("n", "<C-q>", "<CMD>q<CR>")
vim.keymap.set("n", "<C-a>", "ggVG")

-- Better Escape
vim.keymap.set("i", "fd", "<ESC>", opts)
vim.keymap.set("v", "fd", "<ESC>", opts)
vim.keymap.set("x", "fd", "<ESC>", opts)
-- Escape with Save
vim.keymap.set("i", "<C-c>", "<ESC><CMD>w<CR>", opts)
vim.keymap.set("v", "<C-c>", "<ESC><CMD>w<CR>", opts)
vim.keymap.set("x", "<C-c>", "<ESC><CMD>w<CR>", opts)

-- Moving Between Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
-- vim.keymap.set('n', 'sh', '<C-w>h', opts)
-- vim.keymap.set('n', 'sj', '<C-w>j', opts)
-- vim.keymap.set('n', 'sk', '<C-w>k', opts)
-- vim.keymap.set('n', 'sl', '<C-w>l', opts)

-- Splitting Windows
vim.keymap.set("n", "ss", "<C-w>s", opts)
vim.keymap.set("n", "sv", "<C-w>v", opts)

vim.keymap.set("n", "<leader>e", "<CMD>Ex<CR>") -- Currently used for file explore

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", opts)

-- Stay in indent mode
vim.keymap.set("v", ">", ">gv^", opts)
vim.keymap.set("v", "<", "<gv^", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
-- vim.keymap.set("x", "J", ":m '>+1<CR>gv=gv", opts)
-- vim.keymap.set("x", "K", ":m '<-2<CR>gv=gv", opts)
vim.keymap.set("v", "p", '"_dP', opts)
