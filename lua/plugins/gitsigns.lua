---@type LazySpec
local M = {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre' },
}

M.config = function()
  local gs = require('gitsigns')

  vim.wo.signcolumn = 'yes'

  vim.keymap.set('n', '<C-j>', ']c')
  vim.keymap.set('n', '<C-k>', '[c')

  gs.setup({
    on_attach = function(bufnr)
      vim.cmd('hi! link GitSignsDelete Error')

      local p = '<leader>g'

      -- Navigation
      vim.keymap.set('n', '<C-j>', function()
        gs.next_hunk()
      end, { buffer = bufnr, desc = 'Next hunk' })
      vim.keymap.set('n', '<C-k>', function()
        gs.prev_hunk()
      end, { buffer = bufnr, desc = 'Prev hunk' })

      -- Actions
      vim.keymap.set({ 'n', 'v' }, p .. 's', ':Gitsigns stage_hunk<CR>', {
        buffer = bufnr,
        desc = 'Stage hunk',
      })
      vim.keymap.set({ 'n', 'v' }, p .. 'r', ':Gitsigns reset_hunk<CR>', {
        buffer = bufnr,
        desc = 'Reset hunk',
      })
      vim.keymap.set(
        'n',
        p .. 'S',
        gs.stage_buffer,
        { buffer = bufnr, desc = 'Stage buffer' }
      )
      vim.keymap.set(
        'n',
        p .. 'u',
        gs.undo_stage_hunk,
        { buffer = bufnr, desc = 'Unstage hunk' }
      )
      vim.keymap.set(
        'n',
        p .. 'R',
        gs.reset_buffer,
        { buffer = bufnr, desc = 'Reset buffer' }
      )
      vim.keymap.set(
        'n',
        p .. 'p',
        gs.preview_hunk,
        { buffer = bufnr, desc = 'Preview hunk' }
      )
      vim.keymap.set('n', p .. 'b', function()
        gs.blame_line({ full = true })
      end, { buffer = bufnr, desc = 'Blame line' })
      vim.keymap.set(
        'n',
        p .. 'B',
        gs.toggle_current_line_blame,
        { buffer = bufnr, desc = 'Toggle line blame' }
      )
      vim.keymap.set('n', p .. 'd', function()
        gs.diffthis()
      end, { buffer = bufnr, desc = 'Diff this' })
      vim.keymap.set('n', p .. 'D', function()
        gs.diffthis('~')
      end, { buffer = bufnr, desc = 'Diff ~' })
      vim.keymap.set('n', p .. 'x', function()
        gs.toggle_deleted()
      end, { buffer = bufnr, desc = 'Toggle deleted' })

      -- Text object
      vim.keymap.set(
        { 'o', 'x' },
        'ih',
        ':<C-U>Gitsigns select_hunk<CR>',
        { buffer = bufnr, desc = 'in hunk' }
      )
    end,

    worktrees = {
      {
        toplevel = vim.env.HOME,
        gitdir = vim.env.HOME .. '/.dot',
      },
    },
  })
end

return M
