-- lazygit.nvim opens lazygit in a floating window inside neovim
vim.pack.add { 'https://github.com/kdheepak/lazygit.nvim' }

vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'Open Lazy[G]it' })
