local saga = require('lspsaga')
-- local mx = require('mapx')
--
-- mx.nnoremap('<leader>;', '<cmd>LSoutlineToggle<cr>', 'Outline (Saga)')

saga.init_lsp_saga({
  show_outline = {
    auto_refresh = true,
  },
  finder_action_keys = {
    quit = { 'q', '<Esc>', '<Tab>' },
  },
  symbol_in_winbar = {
    -- enable = true,
    separator = ' > ',
    -- in_custom = true
  },
  code_action_lightbulb = {
    virtual_text = false,
  },
})
