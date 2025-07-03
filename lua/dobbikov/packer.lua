
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  })

  use('BurntSushi/ripgrep')

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        plugins = { "nvim-dap-ui" },
      },
    },
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment the two plugins below if you want to manage the language servers from neovim
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      {'neovim/nvim-lspconfig'},
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }

  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'                             
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'                            
  use 'hrsh7th/vim-vsnip' 

  use { 
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    }
  }
  use {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  }
  use{
    'rust-lang/rust.vim',
    ft = "rust",
    config = function ()
      vim.g.rustfmt_autosave = 1
    end
  }
  use {
    'mrcjkb/rustaceanvim',
    version = '^5',
    required = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    },
  }

  use('preservim/tagbar')
  use{
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    config = function()
      require('trouble').setup {}
    end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {
    'saecki/crates.nvim',
  }

  use 'mfussenegger/nvim-dap-python' 

  use "lervag/vimtex"
  use "micangl/cmp-vimtex"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'echasnovski/mini.nvim'
  use "lukas-reineke/indent-blankline.nvim"

  -- yazi
  use {
      "mikavilpas/yazi.nvim",
      requires = {"folke/snacks.nvim"}
  }

  -- todo
  use {
      "folke/todo-comments.nvim",
      requires = {"nvim-lua/plenary.nvim"}
  }

  -- snippets
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'christoomey/vim-tmux-navigator'
  -- markdown
    -- use({
    --     'MeanderingProgrammer/render-markdown.nvim',
    --     after = { 'nvim-treesitter' },
    --     requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    --     -- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
    --     -- requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
    --     config = function()
    --         require('render-markdown').setup({
    --         })
    --     end,
    -- })
    --
    use 'OXY2DEV/markview.nvim'
-- java
-- obsidian
use({
  "epwalsh/obsidian.nvim",
  tag = "*",  -- recommended, use latest release instead of latest commit
  requires = {
    -- Required.
    "nvim-lua/plenary.nvim",

  }
})
-- typst
use {
  'chomosuke/typst-preview.nvim',
  tag = 'v1.*',
  config = function()
    require 'typst-preview'.setup {}
  end,
}

-- fzf
use {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
end)
