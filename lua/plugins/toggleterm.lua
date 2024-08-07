---@type LazySpec
local M = {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm' },
  keys = {
    {
      '<leader>tt',
      '<cmd>ToggleTerm<cr>',
      'ToggleTerm',
      desc = 'Toggle Terminal',
    },
    {
      '<leader>ts',
      '<cmd>2ToggleTerm direction=horizontal<cr>',
      'ToggleTerm horizontal',
      desc = 'Toggle Terminal (horizontal)',
    },
    {
      '<leader>tv',
      '<cmd>3ToggleTerm direction=vertical<cr>',
      'ToggleTerm vertical',
      desc = 'Toggle Terminal (vertical)',
    },
  },
}

M.config = function()
  require('toggleterm').setup({
    -- shade_terminals = false,
    on_open = function(term)
      vim.wo.spell = false
      if term.direction == 'float' then
        vim.keymap.set(
          'n',
          '<A-Esc>',
          '<cmd>ToggleTerm<cr>',
          { buffer = term.bufnr }
        )
      end
    end,
    direction = 'float',
  })
end

return M
