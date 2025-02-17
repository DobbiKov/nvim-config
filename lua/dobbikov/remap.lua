vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<leader>y", "\"*y")
vim.keymap.set("n", "<leader>y", "\"*y")
vim.keymap.set("n", "<leader>Y", "\"*Y")

vim.keymap.set("n", "<leader>d", "\"_d<Enter>") 
vim.keymap.set("v", "<leader>d", "\"_d<Enter>") 

vim.keymap.set("n", "<leader>w", ":w<Enter>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>q", "<cmd>:q<CR>")

vim.keymap.set("n", "<leader>h", function() 
  local buff_n = vim.api.nvim_get_current_buf();
  local buff_hints_enabled_status = vim.lsp.inlay_hint.is_enabled({bufnr = buff_n});
  vim.lsp.inlay_hint.enable(not buff_hints_enabled_status, { bufnr = buff_n });
end)
