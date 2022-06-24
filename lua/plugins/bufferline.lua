local b = require("bufferline")

b.setup {
  options = {
    diagnostics = "nvim_lsp",
    show_buffer_close_icons = false,
    always_show_bufferline = false
  },
  highlights = {
    fill = { guibg = '#21222C' },
    buffer_selected = { gui = 'bold' }
  }
}

local mx = require('mapx')
mx.nnoremap('<C-h>', function() require("bufferline").cycle(-1) end)
mx.nnoremap('<C-l>', function() require("bufferline").cycle(1) end)
mx.nnoremap('H', function() require("bufferline").move(-1) end)
mx.nnoremap('L', function() require("bufferline").move(1) end)
mx.nnoremap('gb', require("bufferline").pick_buffer, "Pick Buffer")
