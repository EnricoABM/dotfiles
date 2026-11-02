return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        require("mason-null-ls").setup({
            ensure_installed = { "stylua", "prettier", "isort", "black" },
            automatic_installation = true,
        })

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- Configuração personalizada para forçar espaços em cada ferramenta
        local formatting = null_ls.builtins.formatting

        null_ls.setup({
            sources = {
                -- Stylua: força indentação por espaços de tamanho 4
                formatting.stylua.with({
                    extra_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                }),

                -- Prettier: força o uso de espaços (--no-use-tabs) e define o tamanho
                formatting.prettier.with({
                    extra_args = { "--no-use-tabs", "--tab-width", "4" },
                }),

                -- Isort e Black para Python já usam espaços por padrão (seguem o PEP 8)
                formatting.isort,
                formatting.black,
            },
            -- Formata automaticamente antes de salvar o arquivo
            on_attach = function(client, bufnr)
                if client:supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                bufnr = bufnr,
                                formatting_options = {
                                    tabSize = 4,
                                    insertSpaces = true,
                                },
                            })
                        end,
                    })
                end
            end,
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Formata o código do buffer atual" })
    end,
}
