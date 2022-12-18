hot_reload(debug.getinfo(1).source:sub(2))

local mx = require('mapx')

mx.nnoremap('<leader>u', '<cmd>UndotreeToggle<cr>')
