---@type LazySpec
local M = {
  'folke/which-key.nvim',
  lazy = false,
  opts = {
    plugins = {
      spelling = {
        enabled = true,
      },
    },
    show_help = false,
  },
}

return M
