---@type LazySpec
local M = {
  'smoka7/hop.nvim',
  name = 'hop',
  enabled = false,
}

M.config = function()
  require('hop').setup({ keys = 'fjdksla;gheiworuxvmc' })
end

M.init = function()
  local mx = require('mapx')
  mx.nnoremap('s', '<Nop>')
  mx.vnoremap('s', '<Nop>')
  mx.onoremap('<leader>', '<Nop>')
  mx.nname('s', 'hop')
  mx.vname('s', 'hop')
  mx.oname('<leader>', 'hop')
  local function map(key, action, description)
    mx.nnoremap('s' .. key, function()
      action()
    end, description)
    mx.vnoremap('s' .. key, function()
      action()
    end, description)
    mx.onoremap('<leader>' .. key, function()
      action()
    end, description)
  end

  map('w', function()
    require('hop').hint_words()
  end, 'words')
  map('l', function()
    require('hop').hint_words({
      direction = require('hop.hint').HintDirection.AFTER_CURSOR,
    })
  end, 'words forward')
  map('h', function()
    require('hop').hint_words({
      direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
    })
  end, 'words backward')
  map('g', function()
    require('hop').hint_lines()
  end, 'lines')
  map('j', function()
    require('hop').hint_lines({
      direction = require('hop.hint').HintDirection.AFTER_CURSOR,
    })
  end, 'lines forward')
  map('k', function()
    require('hop').hint_lines({
      direction = require('hop.hint').HintDirection.BEFORE_CURSOR,
    })
  end, 'lines backward')
  map('f', function()
    require('hop').hint_char1()
  end, '1 char')
  map('s', function()
    require('hop').hint_char2()
  end, '2 chars')
  map('/', function()
    require('hop').hint_patterns()
  end, 'pattern')
end

return M
