---@type LazySpec
local M = {
  'monaqa/dial.nvim',
  lazy = false,
}

M.config = function()
  local mx = require('mapx')
  local m = require('dial.map')

  mx.nnoremap('<C-a>', m.inc_normal(), 'Increment')
  mx.nnoremap('<C-x>', m.dec_normal(), 'Decrement')
  mx.vnoremap('<C-a>', m.inc_visual(), 'Increment')
  mx.vnoremap('<C-x>', m.dec_visual(), 'Decrement')
  mx.vnoremap('g<C-a>', m.inc_gvisual(), 'Increment')
  mx.vnoremap('g<C-x>', m.dec_gvisual(), 'Decrement')
end

return M
