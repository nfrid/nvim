---@type LazySpec
local M = {
  'L3MON4D3/LuaSnip',
  dependencies = { 'honza/vim-snippets' },
}

M.init = function()
  local mx = require('mapx')
  mx.inoremap('<C-s>', function() require('luasnip').expand({}) end, 'Expand Snippet')
end

M.config = function()
  require('luasnip.loaders.from_snipmate').lazy_load()
  local snip = require('luasnip')
  snip.filetype_extend('javascriptreact', { 'javascript' })
  snip.filetype_extend('typescriptreact', { 'typescript' })
end

return M
