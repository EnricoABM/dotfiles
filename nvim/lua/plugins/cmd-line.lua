return {
    "VonHeikemen/fine-cmdline.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        cmdline = {
            enable_keymaps = true,
            smart_history = true,
            prompt = " ❯ ",
        },
        popup = {
            position = {
                row = "10%",
                col = "50%",
            },
            size = {
                width = "50%",
            },
            border = {
                style = "rounded",
                text = {
                    top = " [ Command Line ] ",
                    top_align = "center",
                },
            },
            win_options = {
                winhighlight = "Normal:CyberCmdNormal,FloatBorder:CyberCmdBorder",
            },
        },
    },
    config = function(_, opts)
        -- Paleta Cyberpunk aplicada aos grupos do comando
        local cyberpunk_bg = "#1B1B2A" -- Fundo escuro profundo
        local neon_pink = "#FF007A" -- Cor da borda e destaque vibrante
        local neon_cyan = "#00FFB3" -- Texto claro/neon dentro da linha de comando

        -- Grupo Normal (Fundo da caixa e texto principal)
        vim.api.nvim_set_hl(0, "CyberCmdNormal", {
            bg = cyberpunk_bg,
            fg = neon_cyan,
        })

        -- Grupo da Borda (Borda estilizada em Pink Neon)
        vim.api.nvim_set_hl(0, "CyberCmdBorder", {
            bg = cyberpunk_bg,
            fg = neon_pink,
        })

        require("fine-cmdline").setup(opts)

        vim.keymap.set(
            { "n", "v" },
            ":",
            "<cmd>FineCmdline<CR>",
            { noremap = true, desc = "Exibe o menu de comandos usando cmd-line" }
        )
    end,
}
