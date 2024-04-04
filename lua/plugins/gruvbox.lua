return {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({
			style = "dark",
			contrast = "hard",
			transparent_mode = true,
		})
		vim.cmd("colorscheme gruvbox")
		-- vim.g.gruvbox_contrast_dark = "hard"
		-- vim.g.gruvbox_contrast_light = "hard"
	end,
}
