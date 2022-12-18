hot_reload(debug.getinfo(1).source:sub(2))

local mx = require('mapx')

mx.xnoremap('gA', '<Plug>(EasyAlign)', 'align')
mx.xnoremap('A', '<Plug>(EasyAlign)', 'align')
