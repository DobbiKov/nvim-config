require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "javascript",
    "python",
    "rust",
    "cpp",
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "html",
    "css",
    "yaml",
    "json",
    "latex"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = false,
  },
  injections = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']a'] = '@parameter.inner',
      },
      goto_previous_start = {
        ['[a'] = '@parameter.inner',
      },
    },
    swap = {
      enable = true,
      swap_next = { ['<leader>a'] = '@parameter.inner' },
      swap_previous = { ['<leader>A'] = '@parameter.inner' },
    },
  },
}
