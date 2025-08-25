vim.keymap.set("n", "W", "<CMD>w<CR>", { desc = "Save File" })
vim.keymap.set("n", "YY", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- better Up/down Scroll
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- lazy update
vim.keymap.set("n", "<leader>lu", "<CMD>Lazy update<CR>", { desc = "Update plugins Lazy" })
vim.keymap.set("n", "<leader>ll", "<CMD>Lazy update<CR>", { desc = "Open Lazy" })
vim.keymap.set("n", "<leader>lx", "<CMD>LazyExtras<CR>", { desc = "LazyExtras" })

vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

-- lua snacks.picker.lsp_symbols({layout = { preset = "vscode", preview = "main" }})
-- nah man I can't put vsc*de anywhere
