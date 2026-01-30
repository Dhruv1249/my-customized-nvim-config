
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      -- 1. Main Window: Enable transparency so the Terminal handles the background
      transparent = true, 
      
      styles = {
        sidebars = "transparent", -- Sidebars (like Neo-tree) follow main transparency
        floats = "transparent",          -- 2. Give floats a dark background (needed for winblend)
      },
      
      on_highlights = function(hl, c)
        hl.LineNrAbove = { fg = "#ffffff" }
        hl.LineNrBelow = { fg = "#ffffff" }
        -- 1. Make the Popup Menu Darker (Better contrast against wallpaper)
  
  -- 2. Make the Border Invisible (Matches the menu background)
  -- This creates a "floating card" effect without a wireframe
  hl.FloatBorder = { bg = "#16161e", fg = "#16161e" } 
  
  -- 3. Keep your Blue Selection
  hl.PmenuSel = { bg = "#2d3f76", fg = "#ffffff", bold = true }
      end,
    },

    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")


      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "SnackPickerGitStatusUntracked", { fg = "#888888" })
          
          -- Fix: Ensure PmenuSel (Selected item) remains solid/visible
          vim.api.nvim_set_hl(0, "PmenuSel", {
            bg = "#888888",
            fg = "#ffffff",
            bold = true,
          })
        end,
      })
    end,
  },
}
