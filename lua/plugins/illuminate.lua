---@type LazySpec
local M = {
  'RRethy/vim-illuminate',
  lazy = false,
}

M.config = function()
  local mx = require('mapx')
  local illuminate = require('illuminate')
  mx.nnoremap('<leader>vi', illuminate.toggle, 'Illuminate')
end

return M
