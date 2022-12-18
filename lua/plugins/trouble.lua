hot_reload(debug.getinfo(1).source:sub(2))

local t = require('trouble')
t.setup({})
local mx = require('mapx')
mx.nnoremap('<leader>d', '<cmd>TroubleToggle<cr>', 'Toggle Trouble')
