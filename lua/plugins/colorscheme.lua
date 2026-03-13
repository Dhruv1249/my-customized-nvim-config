return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true, -- let terminal show through

			styles = {
				sidebars = "transparent",
				-- IMPORTANT: floats need a base for glass effect
			},

			on_highlights = function(hl, c)
				-- Float background (glassy)
				hl.NormalFloat = {
					bg = c.bg_dark,
				}

				-- Borders slightly brighter than background
				hl.FloatBorder = {
					fg = c.purple,
					bg = c.bg_dark,
				}

				-- CMP menu
				hl.Pmenu = {
					fg = c.fg,
					bg = c.bg_dark,
				}
				hl.PmenuSel = {
					fg = c.bg_dark,
					bg = c.purple,
				}
			end,
		},

		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight")
		end,
	},
}
