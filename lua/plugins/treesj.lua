local tsj = require('treesj')

local langs = { --[[ configuration for languages ]] }

tsj.setup({
  use_default_keymaps = false,
})

local mx = require('mapx')
mx.nnoremap('<leader>j', function()
  tsj.toggle()
end)
