return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "dracula",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = {
					"encoding",
					{
						"fileformat",
						symbols = { unix = "", dos = "" },
					},
					"filetype",
					"diff",
					"diagnostics",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
