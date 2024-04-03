return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- formatters
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettier,
        -- linters
        -- null_ls.builtins.diagnostics.mypy,
        -- null_ls.builtins.diagnostics.pylint,
        -- require("none-ls.diagnostics.flake8"),
        -- null_ls.builtins.diagnostics.golangci_lint,
        require("none-ls.diagnostics.ruff"),
        -- code actions
      },
      -- format on save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
              -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
