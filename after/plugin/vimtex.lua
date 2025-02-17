vim.g.vimtex_view_method = "skim"
vim.g.vimtex_view_general_viewer = "skim"
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 1
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>ltc", ":VimtexTocToggle<CR>")
vim.api.nvim_set_keymap('n', '<leader>lc', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
  build_dir = '',
  callback = 1,
  continuous = 1, -- Enable continuous compilation
  executable = 'latexmk',
  options = {
    '-pdf', -- Generate PDF
    '-interaction=nonstopmode', -- Non-stop compilation
    '-synctex=1', -- SyncTeX for editor-PDF navigation
  },
}
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = '*.tex',
--   callback = function()
--     vim.cmd('VimtexCompile') -- Trigger Vimtex compilation
--   end,
-- })
