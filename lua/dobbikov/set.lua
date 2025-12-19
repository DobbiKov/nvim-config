vim.g.tagbar_ctags_bin = '/opt/homebrew/bin/ctags'


vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
vim.g.python3_host_prog = '/Users/dobbikov/myenv/bin/python'

vim.api.nvim_create_user_command("Cpr", function(opts)
    vim.fn.setreg("+", vim.fn.getreg(opts.args))
end, { nargs = 1 })

vim.api.nvim_create_user_command("Enc", function(opts)
    vim.cmd("e ++enc=" .. opts.fargs[1])
end, { nargs = 1 })

-- spell checker spell checker
vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- json formatting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.opt_local.formatprg = "jq"
  end,
})
