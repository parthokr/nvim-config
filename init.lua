require("core.keymap")
require("core.plugin")

local notify = require("notify")

vim.notify = notify

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
