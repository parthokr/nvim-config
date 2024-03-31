return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup()
        vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
    end
}