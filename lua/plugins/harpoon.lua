return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", {})
		vim.keymap.set("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", {})
		vim.keymap.set("n", "sh", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", {})
		vim.keymap.set("n", "sj", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", {})
		vim.keymap.set("n", "sk", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", {})
		vim.keymap.set("n", "sl", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", {})
		vim.keymap.set("n", "<M-h>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", {})
		vim.keymap.set("n", "<M-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", {})
	end,
}
