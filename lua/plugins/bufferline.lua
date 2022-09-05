--[[
local b = require('bufferline')

b.setup({
  options = {
    diagnostics = 'nvim_lsp',
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icons = {
        error = '',
        warning = '',
        info = '',
        hint = '',
      }

      return icons[level]
    end,
    show_buffer_close_icons = false,
    always_show_bufferline = false,
  },
  highlights = {
    fill = { bg = '#21222c' },
    buffer_selected = { italic = false, bold = false },
    numbers_selected = { italic = false, bold = false },
    diagnostic_selected = { italic = false, bold = false },
    hint_selected = { italic = false, bold = false },
    hint_diagnostic_selected = { italic = false, bold = false },
    info_selected = { italic = false, bold = false },
    info_diagnostic_selected = { italic = false, bold = false },
    warning_selected = { italic = false, bold = false },
    warning_diagnostic_selected = { italic = false, bold = false },
    error_selected = { italic = false, bold = false },
    error_diagnostic_selected = { italic = false, bold = false },
  },
})

local mx = require('mapx')
mx.nnoremap('<C-h>', function()
  b.cycle(-1)
end, 'Prev buffertab')
mx.nnoremap('<C-l>', function()
  b.cycle(1)
end, 'Next buffertab')
mx.nnoremap('gh', function()
  b.move(-1)
end, 'Move buffertab to the left')
mx.nnoremap('gl', function()
  b.move(1)
end, 'Move buffertab to the right')
--]]--
