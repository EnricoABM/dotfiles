return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300 -- Tempo de espera em ms antes do popup aparecer
	end,
	opts = {
		preset = "modern", -- Estilo de exibição
		win = {
			border = "rounded",
			padding = { 1, 2 },
			title = true,
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		-- Agrupamento e rótulos dos seus atalhos existentes
		wk.add({
			{ "<leader>f", group = "Telescope / Busca" },
			{ "<leader>s", group = "Splits" },
			{ "<leader>b", group = "Buffers" },
		})
	end,
}
