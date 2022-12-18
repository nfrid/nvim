hot_reload(debug.getinfo(1).source:sub(2))

local mx = require('mapx')
mx.nnoremap('<leader>fd', '<cmd>RnvimrToggle<cr>', 'ranger')
vim.g.rnvimr_enable_ex = 1
vim.g.rnvimr_enable_picker = 1
