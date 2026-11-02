return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- Configuração das linhas normais de indentação
        indent = {
            char = "│",
            tab_char = "│",
        },
        -- Configuração do escopo ativo (o bloco onde o cursor está)
        scope = {
            enabled = true,
            show_start = true,
            show_end = true,
            highlight = { "Function", "Label" },
        },
        -- Exclui alguns tipos de arquivos comuns onde linhas poluem muito
        exclude = {
            filetypes = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
            },
        },
    },
}
