return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true, -- Integração com Treesitter para evitar fechar pares em comentários/strings
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
		},
		fast_wrap = {
			map = "<M-e>", -- Atalho (Alt+e) para envolver texto existente
			chars = { "{", "[", "(", '"', "'" },
			pattern = [=[[%'%"%]%)%}%s]=],
			end_key = "$",
			before_key = "h",
			after_key = "l",
			cursor_pos_before = true,
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			manual_position = true,
			highlight = "Search",
			highlight_grey = "Comment",
		},
	},
	config = function(_, opts)
		require("nvim-autopairs").setup(opts)
	end,
}
