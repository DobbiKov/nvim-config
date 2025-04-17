-- disable netrw at the very start of your init.lua
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
end
vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeOpen<CR>")

-- OR setup with some options
-- require("nvim-tree").setup({
--   on_attach = my_on_attach,
--   sort = {
--     sorter = "case_sensitive",
--   },
--   view = {
--     width = 30,
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = false,
--     custom = {},  -- Remove any custom filters that might be hiding files or directories
--     exclude = {}, -- Ensure no directories are excluded
--   },
--   git = {
--     enable = true,
--     ignore = false,  -- Disable ignoring files listed in .gitignore
--   },
-- })
