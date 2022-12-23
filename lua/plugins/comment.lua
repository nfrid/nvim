---@type LazySpec
local M = {
  'numToStr/Comment.nvim',
  lazy = false,
}

M.config = function()
  require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })

  local ft = require('Comment.ft')

  ft.set('stylus', { '//%s', '/*%s*/' })
end

return M
