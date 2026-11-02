return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					diagnostics = "nvim_lsp",
					separator_style = "thin",
				},
			})

			vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Ir para o buffer anterior (aba da esquerda)" })
			vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Ir para o próximo buffer (aba da direita)" })
		end,
	},
	{
		"famiu/bufdelete.nvim",
		config = function()
			-- Cria um comando que substitui o :q padrão para fechar o buffer sem destruir o layout de janelas
			vim.api.nvim_create_user_command("Bq", function()
				require("bufdelete").bufdelete(0, false)
			end, { desc = "Deleta o buffer atual preservando o layout da janela" })

			-- Reinterpreta a intenção do :q para fechar apenas o buffer ativo
			vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<CR>", { desc = "Fechar buffer atual sem fechar janela" })
		end,
	},
}
