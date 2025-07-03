require("markview").setup()

vim.keymap.set("n", "<leader>mt", function()
  vim.cmd("Markview toggle")
end)
