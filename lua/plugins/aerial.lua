local mx = require('mapx')
mx.nname('<leader>;', 'outline')
mx.nnoremap('<leader>;t', '<cmd>AerialToggle!<CR>', 'Toggle outline')
mx.nnoremap('<leader>;;', '<cmd>AerialToggle<CR>', 'Toggle outline & focus')
mx.nnoremap('<leader>;f', '<cmd>AerialToggle float<CR>', 'Toggle floating one')
mx.nnoremap({ '<leader>;q', '<leader>;<Esc>' }, '<cmd>AerialCloseAll<CR>', 'Close all')
mx.nnoremap('<leader>;z', '<cmd>AerialTreeToggle<CR>', 'Toggle fold')
mx.nnoremap('<leader>;Z', '<cmd>AerialTreeToggle!<CR>', 'Toggle fold recursively')
mx.nnoremap('<leader>;x', '<cmd>AerialTreeOpenAll<CR>', 'Open all folds')
mx.nnoremap('<leader>;c', '<cmd>AerialTreeCloseAll<CR>', 'Close all folds')

require('aerial').setup({
  backends = { "lsp", "treesitter", "markdown" },
})
