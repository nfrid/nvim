---@type LazySpec
local M = {
  {
    'jcdickinson/http.nvim',
    build = 'cargo build --workspace --release',
  },
  {
    'jcdickinson/codeium.nvim',
    dependencies = {
      'jcdickinson/http.nvim',
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = true,
  },
}

return M
