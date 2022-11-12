local p = require('markdown-togglecheck')
local mx = require('mapx')

mx.nnoremap('<leader>nn', p.toggle)
