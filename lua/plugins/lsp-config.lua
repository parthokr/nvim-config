return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
        highlight = {
          enable = true,
          -- colors = {
          --   error = "#ff0000",
          --   warning = "#ffcc00",
          --   info = "#00ccff",
          --   hint = "#00ff00",
          -- },
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      -- setup servers
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            completeUnimported = true,
            usePlaceholders = true,
          },
        },
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      -- lspconfig.pyright.setup({
      --   capabilities = capabilities,
      --   settings = {
      --     python = {
      --       analysis = {
      --         typeCheckingMode = "basic",
      --       },
      --     },
      --   },
      -- })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 200,
        },
        -- use mypy for type checking
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                enabled = false,
              },
              pylint = {
                enabled = false,
              },
              yapf = {
                enabled = false,
              },
              mypy = {
                enabled = true,
              },
            },
          },
        },
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      -- show structure of the current file
      vim.keymap.set("n", "<leader>fs", vim.lsp.buf.document_symbol, {})

      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})

      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
    end,
  },
}
