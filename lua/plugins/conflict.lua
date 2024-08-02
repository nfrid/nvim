---@type LazySpec
local M = {
  'akinsho/git-conflict.nvim',
  lazy = false, -- figure out how to lazy do it
}

M.config = function()
  local p = require('git-conflict')

  p.setup({
    default_mappings = false,
    disable_diagnostics = false,
    highlights = {
      incoming = 'DiffAdd',
      current = 'DiffChange',
    },
  })

  vim.keymap.set(
    'n',
    ']x',
    '<Plug>(git-conflict-next-conflict)',
    { desc = 'Next conflict' }
  )
  vim.keymap.set(
    'n',
    '[x',
    '<Plug>(git-conflict-prev-conflict)',
    { desc = 'Previous conflict' }
  )

  local s = '<leader>g'
  vim.keymap.set(
    'n',
    s .. 'h',
    '<Plug>(git-conflict-ours)',
    { desc = 'Select ours' }
  )
  vim.keymap.set(
    'n',
    s .. 'l',
    '<Plug>(git-conflict-theirs)',
    { desc = 'Select theirs' }
  )
  vim.keymap.set(
    'n',
    s .. 'j',
    '<Plug>(git-conflict-both)',
    { desc = 'Select both' }
  )
  vim.keymap.set(
    'n',
    s .. 'k',
    '<Plug>(git-conflict-none)',
    { desc = 'Select none' }
  )
end

return M
