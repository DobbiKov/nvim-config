

local fff = require('fff')
vim.keymap.set('n', '<leader>pf', function() fff.find_files() end)
vim.keymap.set('n', '<leader>ps', function() fff.live_grep() end)
