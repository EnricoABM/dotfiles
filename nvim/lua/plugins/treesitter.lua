return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter")

		configs.setup({
			ensure_install = {
        "tsx",
        "typescript",
				"lua",
				"javascript",
        "json",
				"python",
				"java",
				"kotlin",
				"html",
				"css",
        "dockerfile"
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
      autotag = { enable = true }
		})

		configs.install({
			"lua",
			"javascript",
			"python",
			"java",
			"kotlin",
      "markdown",
      "latex",
      "yaml",
			"html",
			"css",
      "json",
      "tsx",
      "typescript",
      "dockerfile"
		})
	end,
}
