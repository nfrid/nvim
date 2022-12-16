local saga = require('lspsaga')
local mx = require('mapx')

mx.nnoremap('<leader>;', '<cmd>Lspsaga outline<cr>', 'Outline (Saga)')

saga.init_lsp_saga({
  show_outline = {
    auto_refresh = true,
  },
  finder_action_keys = {
    quit = { 'q', '<Esc>', '<Tab>' },
    open = { 'o', '<CR>' },
  },
  symbol_in_winbar = {
    -- enable = true,
    separator = ' > ',
    -- in_custom = true
  },
  code_action_lightbulb = {
    enable = false,
    -- virtual_text = false,
  },
})

vim.cmd([[
hi! LspSagaHoverBorder guifg=#6272a4
" hi! DefinitionBorder guifg=#6272a4
hi! DefinitionFile guibg=#282a36
hi! link DefinitionArrow Comment
hi! link DefinitionSearch Visual
]])
