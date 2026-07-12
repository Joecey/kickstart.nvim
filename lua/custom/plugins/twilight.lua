-- Twilight is used to higlight certain parts of code in order to keep context
vim.pack.add { 'https://github.com/folke/twilight.nvim' }

require('twilight').setup {}

vim.keymap.set('n', '<leader>l', function() require('twilight').toggle() end, { desc = 'Toggle Twilight' })
