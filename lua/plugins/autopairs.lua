return {
	-- 1. Ultimate Autopair (Replaces nvim-autopairs)
	-- Solves the {} -> Enter indentation issue automatically
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", -- Recommended branch
		opts = {
			-- "fastwarp" and "newline" are enabled by default.
			-- Inside {|} pressing Enter will properly expand and indent.
		},
	},
	-- 2. HTML Autotag + The "Enter" Fix
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {},
		config = function()
			require("nvim-ts-autotag").setup()

			-- FIX: Auto-indent on Enter when inside tags like <div>|</div>
			-- This checks if the cursor is between '>' and '</'
			local function check_pair()
				local line = vim.api.nvim_get_current_line()
				local col = vim.api.nvim_win_get_cursor(0)[2]
				-- Char before cursor is '>' and char after is '<' (start of closing tag)
				return line:sub(col, col) == ">" and line:sub(col + 1, col + 1) == "<"
			end

			vim.keymap.set("i", "<CR>", function()
				if check_pair() then
					-- Magic: Enter -> Up -> Open new line (preserves indentation)
					return "<CR><C-o>O"
				end
				-- Normal Enter behavior
				return "<CR>"
			end, { expr = true, noremap = true })
		end,
	},
}
