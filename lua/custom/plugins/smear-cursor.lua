vim.pack.add { 'https://github.com/sphamba/smear-cursor.nvim' }

require('smear_cursor').setup {
  -- cursor_color = '#ff4000',
  particles_enabled = true,
  stiffness = 0.5,
  trailing_stiffness = 0.2,
  trailing_exponent = 5,
  damping = 0.6,
  gradient_exponent = 0,
  gamma = 1,
  never_draw_over_target = true, -- if you want to actually see under the cursor
  hide_target_hack = true, -- same
  -- particle_spread = 1,
  -- particles_per_second = 500,
  -- particles_per_length = 50,
  -- particle_max_lifetime = 800,
  -- particle_max_initial_velocity = 20,
  -- particle_velocity_from_cursor = 0.5,
  -- particle_damping = 0.15,
  -- particle_gravity = -50,
  -- min_distance_emit_particles = 0,
}

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
