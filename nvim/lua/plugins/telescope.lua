return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            -- Paleta Cyberpunk
            local cyberpunk_bg_dark = "#1B1B2A" -- Fundo escuro principal (Prompt e Preview)
            local cyberpunk_bg_normal = "#22223b" -- Fundo levemente ajustado para resultados
            local cyberpunk_bg_select = "#3a2d5c" -- Fundo do item selecionado (Roxo/Magenta suave)
            local cyberpunk_fg = "#ebdbb2" -- Texto principal
            local neon_pink = "#FF007A" -- Destaque / Títulos de Prompt e Results
            local neon_cyan = "#00FFB3" -- Cursor e Prefixo
            local neon_purple = "#A700FF" -- Título do Preview
            local neon_yellow = "#FFEA00" -- Item selecionado / Destaques

            vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = cyberpunk_bg_normal, fg = cyberpunk_fg })
            vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = cyberpunk_bg_normal, fg = cyberpunk_bg_dark })
            vim.api.nvim_set_hl(0, "TelescopeTitle", { bg = neon_pink, fg = cyberpunk_bg_dark, bold = true })

            vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = cyberpunk_bg_dark, fg = cyberpunk_fg })
            vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = cyberpunk_bg_dark, fg = cyberpunk_bg_dark })
            vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = neon_pink, fg = cyberpunk_bg_dark, bold = true })
            vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = cyberpunk_bg_dark, fg = neon_cyan })

            vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = cyberpunk_bg_dark, fg = cyberpunk_fg })
            vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = cyberpunk_bg_dark, fg = cyberpunk_bg_dark })
            vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = neon_purple, fg = cyberpunk_bg_dark, bold = true })

            -- Item Selecionado (Cyberpunk Glow)
            vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = cyberpunk_bg_select, fg = neon_yellow, bold = true })
            vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = cyberpunk_bg_select, fg = neon_cyan })

            -- LAYOUT E CONEXÃO DE BORDAS
            require("telescope").setup({
                defaults = {
                    border = true,
                    borderchars = {
                        prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
                        results = { " ", "▐", "▄", "▌", "▌", "▐", "▟", "▙" },
                        preview = { " ", " ", " ", " ", " ", " ", " ", " " },
                    },
                    prompt_prefix = " ❯ ",
                    selection_caret = "❯ ",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                        },
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                        "--glob",
                        "!**/.git/*",
                    },
                },
            })

            -- Keymaps
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Busca por nome de arquivos" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Busca por conteúdo presentes em arquivos" })
            vim.keymap.set("n", "<leader>fp", function()
                builtin.find_files({
                    hidden = true,
                })
            end, { desc = "Busca por arquivos (incluindo ocultos)" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").load_extension("ui-select")
        end,
    },
}
