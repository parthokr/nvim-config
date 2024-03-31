local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
      {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {"github/copilot.vim"},
    {"vim-airline/vim-airline"},
    {"nvim-tree/nvim-web-devicons"},
    {"nvim-tree/nvim-tree.lua"},
    {"nvim-lua/plenary.nvim"},
    {"nvim-lua/popup.nvim"},
    {"rcarriga/nvim-notify"},
    {"nvim-lualine/lualine.nvim"},
    {"vim-airline/vim-airline-themes"},
    {"folke/tokyonight.nvim"},
    {"numToStr/Comment.nvim", lazy=false},
    {"tpope/vim-fugitive"},
    {"neoclide/coc.nvim", branch = "release"},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts)
require("Comment").setup()


require("catppuccin").setup()

vim.cmd.colorscheme "catppuccin"

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "tokyonight",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')


local config = require("nvim-treesitter.configs")
config.setup {
  ensure_installed = {
    "lua",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "yaml",
    "python",
    "go"
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}
