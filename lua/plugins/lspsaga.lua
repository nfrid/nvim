---@type LazySpec
local M = {
  'nvimdev/lspsaga.nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  event = { 'LspAttach' },
  cmd = { 'Lspsaga' },
}

M.config = function()
  local saga = require('lspsaga')
  local mx = require('mapx')

  mx.nnoremap('<leader>;', '<cmd>Lspsaga outline<cr>', 'Outline (Saga)')

  saga.setup({
    ui = {
      winblend = 0,
      colors = {
        normal_bg = '#21222c',
        title_bg = '#6272a4',
        red = '#ff5555',
        magenta = '#ff79c6',
        orange = '#ff6e67',
        yellow = '#f1fa8c',
        green = '#50fa7b',
        cyan = '#9aedfe',
        blue = '#8be9fd',
        purple = '#BD93F9',
        white = '#f8f8f8',
        black = '#21222c',
      },
      code_action = '✨',
    },
    code_action = {
      keys = {
        exec = { '<cr>', 'l' },
        quit = { 'h', 'q', '<Esc>' },
      },
    },
    outline = {
      auto_refresh = true,
      keys = {
        quit = { 'q', '<Esc>' },
      }
    },
    finder = {
      keys = {
        quit = { 'q', '<Esc>', '<Tab>' },
        open = { 'o', '<CR>' },
      },
    },
    symbol_in_winbar = {
      -- enable = false,
      -- separator = ' > ',
      -- in_custom = true
    },
    lightbulb = {
      enable = false,
      sign = false,
      virtual_text = false,
    },
  })

  vim.cmd([[
    hi! LspSagaHoverBorder guifg=#6272a4
    " hi! DefinitionBorder guifg=#6272a4
    hi! DefinitionFile guibg=#282a36
    hi! link DefinitionArrow Comment
    hi! link DefinitionSearch Visual
  ]])
end

return M
