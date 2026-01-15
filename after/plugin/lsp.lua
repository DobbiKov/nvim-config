local lsp_zero = require('lsp-zero')

-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.on_attach(lsp_attach)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'eslint',
    'pyright',
    'ocamllsp',
    'texlab',
    'clangd',
    'ts_ls'
  },
  handlers = {
    function(server_name)
      --lspconfig[server_name].setup({})
    end, 
  },
})
-- local lspconfig = vim.lsp.config()

vim.lsp.enable('harper_ls')
vim.lsp.enable('eslint')
vim.lsp.enable('pyright')
vim.lsp.enable('ocamllsp')

vim.lsp.enable('ts_ls')
vim.lsp.config('ts_ls', {
  cmd = { "typescript-language-server", "--stdio" }
})

vim.lsp.enable('jdtls')

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
})

vim.lsp.enable('tinymist')
vim.lsp.config('tinymist', {
    formatterMode = "typstyle"
})

vim.lsp.enable('texlab')

vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
  cmd = { "clangd", "--background-index" },
  root_dir = require'lspconfig.util'.root_pattern("compile_commands.json", ".git"),
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false,
    lsp_attach(client, bufnr)
  end,
})

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')
luasnip.config.set_config({
  history = true,  -- Enables history so that you can jump back into previous snippets
  region_check_events = "InsertEnter",  -- Event to check region when entering insert mode
  delete_check_events = "TextChanged,InsertLeave"
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),

  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'crates' },
    { name = 'vimtex' },
  }, {
    { name = 'buffer' },
  })
})
