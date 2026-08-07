-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

-- When nvim is started on a directory (e.g. `nvim .`), cd into it and show
-- an empty buffer with the intro/landing screen instead of auto-opening
-- Neo-tree. Netrw is disabled (see init.lua) and hijack_netrw_behavior is
-- set to 'disabled' below, so nothing else tries to open a directory view.
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Show landing screen instead of auto-opening Neo-tree for a directory arg',
  nested = true,
  callback = function()
    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0) --[[@as string]]) == 1 then
      local dir = vim.fn.fnamemodify(vim.fn.argv(0) --[[@as string]], ':p')
      vim.cmd('cd ' .. vim.fn.fnameescape(dir))
      vim.cmd 'enew'
      vim.cmd 'only'
      vim.cmd 'intro'
      -- Like a native startup, `:intro` needs one "any key" input to clear
      -- itself before the screen behaves normally again. Send that
      -- dismissal ourselves so the user's first real keystroke isn't eaten.
      vim.api.nvim_input '<Ignore>'
    end
  end,
})

require('neo-tree').setup {
  filesystem = {
    hijack_netrw_behavior = 'disabled',
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
    filtered_items = {
      visible = true, -- show hidden count
      show_hidden_count = true, -- show how many hidden
      hide_dotfiles = false, -- show dotfiles
      hide_gitignored = false, -- show gitignored files
    },
  },
}
