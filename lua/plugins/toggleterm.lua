---@type LazySpec
local M = {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm' },
}

M.init = function()
  local mx = require('mapx')
  mx.nnoremap('<leader>tt', '<cmd>ToggleTerm<cr>')
  mx.nnoremap('<leader>ts', '<cmd>2ToggleTerm direction=horizontal<cr>')
  mx.nnoremap('<leader>tv', '<cmd>3ToggleTerm direction=vertical<cr>')
end

M.config = function()
  require('toggleterm').setup({
    -- shade_terminals = false,
    on_open = function(term)
      local mx = require('mapx')
      vim.wo.spell = false
      if term.direction == 'float' then
        mx.nnoremap('<A-Esc>', '<cmd>ToggleTerm<cr>', { buffer = term.bufnr })
      end
    end,
    direction = 'float',
  })
end

return M
