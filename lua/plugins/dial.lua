---@type LazySpec
local M = {
  'monaqa/dial.nvim',
  lazy = false,
  keys = {
    { '<C-a>', '<Plug>(dial-increment)', 'Increment', mode = { 'n', 'x' } },
    { '<C-x>', '<Plug>(dial-decrement)', 'Decrement', mode = { 'n', 'x' } },
    { 'g<C-a>', 'g<Plug>(dial-increment)', 'Increment', mode = { 'n', 'x' } },
    { 'g<C-x>', 'g<Plug>(dial-decrement)', 'Decrement', mode = { 'n', 'x' } },
  },
}

return M
