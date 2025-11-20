-- helper to build and run a shell command safely
local function run_cmd(fmt, ...)
  local args = vim.tbl_map(vim.fn.shellescape, { ... })
  local cmd = string.format(fmt, unpack(args))
  vim.cmd(cmd)
end

-- insert‑mode mapping
vim.keymap.set("i", "<C-f>", function()
  local file = vim.fn.expand("%:t")
  -- TeX case, using vimtex.root
  run_cmd('silent exec ".!inkscape-figures create %s %s"', 
    vim.fn.getline("."), vim.b.vimtex.root .. "/figures/")
  vim.cmd("write")
end, { noremap = true, silent = true })

-- normal‑mode mapping
vim.keymap.set("n", "<C-f>", function()
  local file = vim.fn.expand("%:t")
  run_cmd('silent exec "!inkscape-figures edit %s > /dev/null 2>&1 &"',
    vim.b.vimtex.root .. "/figures/")
  vim.cmd("write")
  vim.cmd("redraw!")
end, { noremap = true, silent = true })

