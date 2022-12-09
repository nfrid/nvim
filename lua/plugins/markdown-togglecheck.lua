local p = require('markdown-togglecheck')
local mx = require('mapx')

mx.nnoremap('<leader>nn', p.toggle, 'Toggle Checkmark')
mx.nnoremap('<leader>nN', p.toggle_box, 'Toggle Checkmark')
