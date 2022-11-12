local p = require('portal')
local mx = require('mapx')

p.setup({})

mx.nnoremap('<C-O>', function() p.jump_backward() end)
mx.nnoremap('<C-I>', function() p.jump_forward() end)
