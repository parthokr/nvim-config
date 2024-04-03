vim.cmd("set expandtab")

vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set smarttab")
vim.cmd("set smartcase")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set mouse=a")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
-- vim.cmd("set colorcolumn=80")
-- vim.cmd("set statuscolumn=%l\\ %r")
vim.opt.termguicolors = true

vim.g.mapleader = " "

-- clear search highlight with <leader>h
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", {})

-- disable github copilot on leader + dc
vim.keymap.set("n", "<leader>dc", ":Copilot disable<CR>", {})
-- enable github copilot on leader + ec
vim.keymap.set("n", "<leader>ec", ":Copilot enable<CR>", {})
