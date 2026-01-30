-- lua/config/options.lua
print("OPTIONS FILE LOADED SUCCESSFULLY")
-- ... rest of your code ...
-- 1. Indentation (VS Code Style)
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 2        -- Shift 2 spaces when tabbing
vim.opt.tabstop = 2           -- 1 tab == 2 spaces
vim.opt.smartindent = true    -- Auto-indent new lines

-- 2. UI Behavior
vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers (optional, good for jumps)
vim.opt.signcolumn = "yes"    -- Always show the sign column (prevents text shifting)
vim.opt.wrap = false          -- Disable text wrapping (optional)

-- 3. Clipboard
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
