return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Cores Gruvbox para os elementos da Dashboard
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#fe8019", bold = true }) -- Laranja Gruvbox
        vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#ebdbb2" })             -- Texto claro
        vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#fabd2f", bold = true })-- Amarelo Gruvbox
        vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#928374", italic = true })-- Cinza Gruvbox

        dashboard.section.header.val = {
            " ███╗   ██╗██║  ██║██║██╗     ██╗",
            " ████╗  ██║██║  ██║██║████╗ ████║",
            " ██╔██╗ ██║██║  ██╝██║██╔████╝██║",
            " ██║╚██╗██║╚██╗██╝ ██║██║╚██╝ ██║",
            " ██║ ╚████║ ╚██╔╝  ██║██║     ██║",
            " ╚═╝  ╚═══╝  ╚═╝   ╚═╝╚═╝     ╚═╝",
        }
        dashboard.section.header.opts.hl = "AlphaHeader"

        -- 2. Botões Principais com Keymaps rápidos
        dashboard.section.buttons.val = {
            dashboard.button("f", "󰍉  Buscar Arquivo", "<cmd>Telescope find_files<CR>"),
            dashboard.button("e", "  Novo Arquivo", "<cmd>ene <BAR> startinsert<CR>"),
            dashboard.button("r", "  Arquivos Recentes", "<cmd>Telescope oldfiles<CR>"),
            dashboard.button("l", "󰒲  Gerenciador Lazy", "<cmd>Lazy<CR>"),
            dashboard.button("c", "⚙  Configuração", "<cmd>e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("q", "󰅚  Sair do Neovim", "<cmd>qa<CR>"),
        }

        -- Aplicação de estilos nos botões
        for _, button in ipairs(dashboard.section.buttons.val) do
            button.opts.hl = "AlphaButtons"
            button.opts.hl_shortcut = "AlphaShortcut"
        end

        -- 3. Rodapé
        dashboard.section.footer.val = "Neovim carregado com sucesso!"
        dashboard.section.footer.opts.hl = "AlphaFooter"

        -- 4. Layout
        dashboard.opts.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 1 },
            dashboard.section.footer,
        }

        alpha.setup(dashboard.opts)
    end,
}
