-- lazygit.nvim opens lazygit in a floating window inside neovim
vim.pack.add { 'https://github.com/kdheepak/lazygit.nvim' }

vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'Open Lazy[G]it' })

-- Pass a single <Esc> straight to lazygit instead of waiting for the global
-- terminal <Esc><Esc> mapping to time out
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lazygit',
  callback = function(ev)
    vim.keymap.set('t', '<Esc>', '<Esc>', { buffer = ev.buf, nowait = true })
  end,
})
