local ssr = require('ssr')

local mx = require('mapx')
mx.nnoremap('<leader>cc', ssr.open, 'Advanced Replace')
mx.vnoremap('<leader>cc', ssr.open, 'Advanced Replace')
