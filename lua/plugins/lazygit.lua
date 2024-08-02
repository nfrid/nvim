---@type LazySpec
local M = {
  'kdheepak/lazygit.nvim',
  cmd = { 'LazyGit', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
}

M.init = function()
  vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })
  vim.keymap.set(
    'n',
    '<leader>gc',
    '<cmd>LazyGitFilter<cr>',
    { desc = 'Project Commits' }
  )
  -- vim.keymap.set(
  --   'n',
  --   '<leader>gf',
  --   '<cmd>LazyGitFilterCurrentFile<cr>',
  --   { desc = 'Current File Commits' }
  -- )

  vim.cmd([[
    if has('nvim') && executable('nvr')
      let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    endif
  ]])
end

return M
