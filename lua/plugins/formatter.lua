return {
  "nvimtools/none-ls.nvim",
      dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim", -- Bridges Mason with none-ls
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting   -- Formatting tools
    local diagnostics = null_ls.builtins.diagnostics -- Linting tools

    -- 1. Setup Mason-Null-LS (The Installer)
    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier", -- JS/TS/HTML/CSS formatter
        "stylua",   -- Lua formatter
        "black",    -- Python formatter
        "isort",    -- Python import sorter
        "pylint",   -- Python linter
        "eslint_d", -- JS/TS linter
      },
      automatic_installation = true,
    })

    -- 2. Setup None-LS (The Runner)
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        -- Formatters
        formatting.stylua,
        formatting.prettier,
        formatting.black,
        formatting.isort,

        -- Linters
        diagnostics.pylint,
        require("none-ls.diagnostics.eslint_d"), -- Requires none-ls-extras
      },

      -- 3. Format on Save Logic
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ 
                bufnr = bufnr,
                -- Only use null-ls for formatting (prevents conflicts with tsserver)
                filter = function(c) return c.name == "null-ls" end 
              })
            end,
          })
        end
      end,
    })
  end,
}
