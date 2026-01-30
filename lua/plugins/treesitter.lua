return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	-- 1. FORCE the installation directory to a known standard path
    --    This makes sure the parsers are where Neovim expects them.
    local parser_install_dir = vim.fn.stdpath("data") .. "/site"
    
    -- 2. MANUALLY add that directory to Neovim's "runtime path"
    --    This fixes the "not in runtimepath" error from your screenshot.
    vim.opt.rtp:prepend(parser_install_dir)
      require("nvim-treesitter.config").setup({
	parser_install_dir = parser_install_dir,
        -- Automatically install parsers for these languages
        ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "c","cpp","python","tsx","css",
	"json","yaml", "jsx", "markdown"
},
        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- Automatically install missing parsers when entering a buffer
        auto_install = true,
        highlight = {
          enable = true, -- false will disable the whole extension
        },
        indent = { enable = true },
      })
    end,
  }
}

