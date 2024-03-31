return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require("nvim-tree").setup()
        vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')
    end
}
