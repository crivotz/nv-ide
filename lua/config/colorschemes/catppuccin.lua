vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	transparent_background = false,
	term_colors = false,
	compile = {
		enabled = false,
		path = vim.fn.stdpath "cache" .. "/catppuccin",
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		coc_nvim = false,
		lsp_trouble = true,
		cmp = true,
		lsp_saga = false,
		gitgutter = false,
		gitsigns = true,
		leap = false,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = false,
		},
		neotree = {
			enabled = false,
			show_root = true,
			transparent_panel = false,
		},
		dap = {
			enabled = true,
			enable_ui = true,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = false,
		bufferline = true,
		markdown = true,
		lightspeed = true,
		ts_rainbow = true,
		hop = false,
		notify = true,
		telekasten = true,
		symbols_outline = true,
		mini = false,
		aerial = false,
		vimwiki = true,
		beacon = true,
		navic = false,
		overseer = false,
	},
	color_overrides = {},
	highlight_overrides = {},
})
vim.cmd [[colorscheme catppuccin]]
-- Telescope
vim.cmd([[
hi TelescopePromptBorder guifg=#f38ba8 guibg=#1e1e2e
hi TelescopePromptNormal  guifg=#f38ba8 guibg=#1e1e2e
hi TelescopePromptTitle  guifg=#f38ba8 guibg=#1e1e2e
hi TelescopePromptPrefix  guifg=#f38ba8 guibg=#1e1e2e
hi TelescopePromptCounter  guifg=#f38ba8 guibg=#1e1e2e

hi TelescopePreviewTitle  guifg=#a6e3a1 guibg=#1e1e2e
hi TelescopePreviewBorder guifg=#a6e3a1 guibg=#1e1e2e

hi TelescopeResultsTitle  guifg=#a6e3a1 guibg=#1e1e2e
hi TelescopeResultsBorder guifg=#a6e3a1 guibg=#1e1e2e

hi TelescopeMatching guifg=#f9e2af guibg=#1e1e2e
hi TelescopeSelection guifg=#ffffff guibg=#181825
]])
-- Term
vim.cmd([[
hi FloatBorder guifg=#f38ba8 guibg=#1e1e2e
hi NormalFloat guibg=#1e1e2e
]])
