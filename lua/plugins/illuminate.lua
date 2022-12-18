hot_reload(debug.getinfo(1).source:sub(2))

local mx = require('mapx')
local illuminate = require('illuminate')
mx.nnoremap('<leader>vi', illuminate.toggle, 'Illuminate')
