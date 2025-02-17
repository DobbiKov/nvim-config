local crates = require("crates")

crates.setup()
crates.show()

vim.keymap.set("n", "<leader>cru", function()
  crates.upgrade_all_crates()
end)
