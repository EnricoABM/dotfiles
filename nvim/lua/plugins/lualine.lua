return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local function get_words()
			if vim.fn.mode():find("[vV]") then
				return tostring(vim.fn.wordcount().visual_words) .. " words"
			else
				return tostring(vim.fn.wordcount().words) .. " words"
			end
		end

    require("lualine").setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_x = { get_words }, -- Places it on the right side of the status bar
			},
		})
	end,
}
