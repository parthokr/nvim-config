local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system(({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	}))
end
vim.opt.rtp:prepend(lazypath)

require("keymaps")
require("lazy").setup("plugins")

-- require("core.plugin")

-- local builtin = require("telescope.builtin")
-- vim.keymap.set('n', '<leader>f', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
