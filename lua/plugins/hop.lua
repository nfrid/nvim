local hop = require('hop')
hop.setup({ keys = 'fjdksla;gheiworuxvmc' })

local mx = require('mapx')
mx.nnoremap('s', '<Nop>')
mx.vnoremap('s', '<Nop>')
mx.onoremap('<leader>', '<Nop>')
mx.nname('s', 'hop')
mx.vname('s', 'hop')
mx.oname('<leader>', 'hop')
local function map(key, action, description)
  mx.nnoremap('s' .. key, function() action() end, description)
  mx.vnoremap('s' .. key, function() action() end, description)
  mx.onoremap('<leader>' .. key, function() action() end, description)
end

local dir = require('hop.hint').HintDirection
local pos = require('hop.hint').HintPosition

map('w', hop.hint_words, 'words')
map('l', function() hop.hint_words({ direction = dir.AFTER_CURSOR, hint_position = pos.MIDDLE }) end,
  'words forward')
map('h', function() hop.hint_words({ direction = dir.BEFORE_CURSOR, hint_position = pos.MIDDLE }) end,
  'words backward')
map('g', hop.hint_lines, 'lines')
map('j', function() hop.hint_lines({ direction = dir.AFTER_CURSOR }) end,
  'lines forward')
map('k', function() hop.hint_lines({ direction = dir.BEFORE_CURSOR }) end,
  'lines backward')
map('f', hop.hint_char1, '1 char')
map('s', hop.hint_char2, '2 chars')
map('/', hop.hint_patterns, 'pattern')
