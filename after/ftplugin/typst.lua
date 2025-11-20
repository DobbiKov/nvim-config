-- safely get a project root (LSP tinymist → fallback to file’s dir)
local function get_typst_root()
  local bufnr = vim.api.nvim_get_current_buf()
  for _, client in pairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if client.name == "tinymist" then
      local root = client.config.root_dir
      if root and root ~= "" then
        return root
      end
    end
  end
  -- fallback if LSP didn’t give you anything
  return vim.fn.expand("%:p:h")
end

-- helper to build and run a shell command safely
local function run_cmd(fmt, ...)
  local args = vim.tbl_map(vim.fn.shellescape, { ... })
  local cmd = string.format(fmt, unpack(args))
  vim.cmd(cmd)
end

-- insert‑mode mapping
vim.keymap.set("i", "<C-f>", function()
  local file = vim.fn.expand("%:t")
  -- Typst case, using our safe root
  local root = get_typst_root() .. "/figures/"
  run_cmd('silent exec ".!inkscape-figures-typst create %s %s"',
  vim.fn.getline("."), root)
  vim.cmd("write")
end, { noremap = true, silent = true })

-- normal‑mode mapping
vim.keymap.set("n", "<C-f>", function()
  local file = vim.fn.expand("%:t")
  local root = get_typst_root() .. "/figures/"
  run_cmd('silent exec ".!inkscape-figures-typst edit %s"',
    root)
  vim.cmd("write")
  vim.cmd("redraw!")
end, { noremap = true, silent = true })

