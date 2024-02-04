---@type LazySpec
local M = {
  'kdheepak/lazygit.nvim',
  cmd = { 'LazyGit', 'LazyGitFilter', 'LazyGitFilterCurrentFile' }
}

M.init = function()
  local mx = require('mapx')

  mx.nnoremap('<leader>gg', '<cmd>LazyGit<cr>', 'LazyGit')
  mx.nnoremap('<leader>gc', '<cmd>LazyGitFilter<cr>', 'Project Commits')
  -- mx.nnoremap('<leader>gf', '<cmd>LazyGitFilterCurrentFile<cr>', 'Current File Commits')

  vim.cmd([[
    if has('nvim') && executable('nvr')
      let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
    endif
  ]])
end

return M
