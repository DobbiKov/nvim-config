local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', function() 
  builtin.find_files({
    find_command = { 'rg', '--files', '--no-ignore', '--hidden' }
  })
end)
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

vim.keymap.set('n', '<leader>ps', function()
  builtin.live_grep({ 
    default_text = vim.fn.input("Grep > "),
    cwd = vim.fn.expand('%:p:h'), -- or specify the exact directory path
    additional_args = function(opts)
        return {"--hidden", "--no-ignore"}
    end
  })
end)
