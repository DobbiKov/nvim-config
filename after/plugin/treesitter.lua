-- nvim-treesitter `main` branch: no more `configs.setup`, features are opt-in.
-- Highlighting/folding come from nvim itself, this plugin only ships parsers + queries.

require('nvim-treesitter').install({
  "arduino", "asm", "bash", "bibtex", "c", "cmake", "cpp", "css", "csv", "dart",
  "diff", "dockerfile", "dot", "git_config", "gitcommit", "gitignore", "glsl",
  "go", "html", "htmldjango", "http", "ini", "javascript", "json", "julia",
  "just", "latex", "lua", "make", "markdown", "markdown_inline", "ocaml",
  "perl", "python", "query", "requirements", "rust", "sql", "ssh_config",
  "svelte", "toml", "typescript", "typst", "vim", "vimdoc", "xml", "yaml",
})

-- latex is handled by vimtex's own syntax
local no_highlight = { latex = true }

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if not lang or no_highlight[lang] then
      return
    end
    pcall(vim.treesitter.start, args.buf, lang)
  end,
})

require('nvim-treesitter-textobjects').setup({
  select = {
    lookahead = true,
  },
  move = {
    set_jumps = true,
  },
})

local select = require('nvim-treesitter-textobjects.select')
local move = require('nvim-treesitter-textobjects.move')
local swap = require('nvim-treesitter-textobjects.swap')

vim.keymap.set({ 'x', 'o' }, 'aa', function()
  select.select_textobject('@parameter.outer', 'textobjects')
end)
vim.keymap.set({ 'x', 'o' }, 'ia', function()
  select.select_textobject('@parameter.inner', 'textobjects')
end)

vim.keymap.set({ 'n', 'x', 'o' }, ']a', function()
  move.goto_next_start('@parameter.inner', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[a', function()
  move.goto_previous_start('@parameter.inner', 'textobjects')
end)

vim.keymap.set('n', '<leader>a', function()
  swap.swap_next('@parameter.inner')
end)
vim.keymap.set('n', '<leader>A', function()
  swap.swap_previous('@parameter.inner')
end)
