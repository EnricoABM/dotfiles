return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            --	vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        name = "gruvbox",
        config = function()
            -- vim.cmd.colorscheme("gruvbox")
        end,
    },
    {
        "DonJulve/NeoCyberVim",
        priority = 1000,
        config = true,
        config = function()
            vim.cmd.colorscheme("NeoCyberVim")
        end,
    },
}
