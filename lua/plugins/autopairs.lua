return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        -- 1. STRICTLY DISABLE "Enter" key mapping to avoid indentation issues
        map_cr = false, 
        
        -- 2. Check Treesitter to ensure we don't pair inside comments
        check_ts = true,
        
        -- 3. The "Type-over" behavior you want is enabled by default.
        -- If you are inside `(|)` and type `)`, it jumps out to `()|`
      })
      
      -- If you want to automatically add `(` after selecting a function
      -- from the autocomplete menu (e.g. `print|` -> `print(|)`), keep this line.
      -- If you prefer to type the `(` yourself, delete these 3 lines.
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  
  -- HTML Autotag (Simple & Standard)
  -- Types <div> -> <div>|</div>
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter", -- Load only when typing to save startup time
    opts = {}, -- Default options are perfect for "simple" usage
  }
}
