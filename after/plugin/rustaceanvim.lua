vim.g.rustaceanvim = {
  server = {
    on_attach = function(_, bufnr)
    end,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        hint = { enable = true }
      },
    },
  },
}


