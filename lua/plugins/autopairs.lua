require("nvim-autopairs").setup({
  fast_wrap = {},
  check_ts = true,
})

local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
