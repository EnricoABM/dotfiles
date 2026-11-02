vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

vim.g.mapleader = " "

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Criar split vertical" })
vim.keymap.set("n", "<leader>sh", "<cmd>split<CR>", { desc = "Criar split horizontal" })

vim.opt.list = true

vim.opt.listchars = {
    tab = "» ",
    trail = "·",
    space = "·",
    nbsp = "␣",
    lead = "·",
}

-- Regra específica para TypeScript, JavaScript e JSON (2 espaços)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})
