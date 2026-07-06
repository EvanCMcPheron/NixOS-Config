vim.pack.add {'https://github.com/nanozuki/tabby.nvim'}

---@type TabbyConfig
config = {
	preset = "active_wins_at_tail",
	options = {
		nerdfont = true,
		lualine_theme = "auto"
	}
}

require('tabby').setup(config)
