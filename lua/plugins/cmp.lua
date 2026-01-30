return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
     window = {
  completion = {
    -- Use a solid border for a cleaner look
    border = "rounded", 
    -- Link the border color to the menu color (so it looks seamless)
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
    scrollbar = false,
  },
  documentation = {
    border = "rounded",
    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
    scrollbar = false,
  },
},
      mapping = cmp.mapping.preset.insert({
        -- SCROLL DOCS
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        
        -- TRIGGER COMPLETION MANUALLY
        ["<C-Space>"] = cmp.mapping.complete(),
        
        -- CLOSE MENU
        ["<C-e>"] = cmp.mapping.abort(),
	-- 1. ENTER TO CONFIRM
        ["<CR>"] = cmp.mapping.confirm({ select = true }), 

        -- 2. TAB TO CONFIRM
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- If menu is open, confirm selection
            cmp.confirm({ select = true })
          else
            -- If menu is closed, just insert a Tab (indent)
            fallback()
          end
        end, { "i", "s" }),
        
        -- NAVIGATE WITH ARROW KEYS (Standard behavior)
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
