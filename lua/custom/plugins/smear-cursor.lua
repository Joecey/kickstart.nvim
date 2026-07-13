vim.pack.add { 'https://github.com/sphamba/smear-cursor.nvim' }

require('smear_cursor').setup {}

-- Doing this to disable smear inside of telescope
local group = vim.api.nvim_create_augroup('SmearCursorTelescope', { clear = true })
local disabled = false

local function disable_smear()
  if not disabled then
    pcall(function() require('smear_cursor').toggle() end)
    disabled = true
  end
end

local function enable_smear()
  if disabled then
    pcall(function() require('smear_cursor').toggle() end)
    disabled = false
  end
end

vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = { 'TelescopePrompt', 'TelescopeResults' },
  callback = disable_smear,
})

vim.api.nvim_create_autocmd('BufLeave', {
  group = group,
  callback = function()
    if vim.bo.filetype == 'TelescopePrompt' or vim.bo.filetype == 'TelescopeResults' then enable_smear() end
  end,
})
