local keymap = '<leader>j'
---@type LazySpec
local M = {
  'Wansmer/treesj',
  keys = { keymap },
}

M.config = function()
  local tsj = require('treesj')

  tsj.setup({
    use_default_keymaps = false,
  })

  local mx = require('mapx')
  mx.nnoremap(keymap, function()
    tsj.toggle()
  end)
end

return M
