local b = require("bufferline")

b.setup {
  options = {
    diagnostics = true,
    show_buffer_close_icons = false,
    always_show_bufferline = false
  },
  highlights = {
    fill = { guibg = '#21222C' },
    buffer_selected = { gui = 'bold' }
  }
}

local mx = require('mapx')
mx.nnoremap('<C-h>', function() b.cycle(-1) end, 'Prev buffertab')
mx.nnoremap('<C-l>', function() b.cycle(1) end, 'Next buffertab')
mx.nnoremap('gh', function() b.move(-1) end, 'Move buffertab to the left')
mx.nnoremap('gl', function() b.move(1) end, 'Move buffertab to the right')
