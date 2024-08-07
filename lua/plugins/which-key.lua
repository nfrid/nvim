---@type LazySpec
local M = {
  'folke/which-key.nvim',
  lazy = false,
  opts = {
    spec = {
      { '<leader>g', group = 'Git' },
      { '<leader>h', group = 'Highlight' },
      { '<leader>i', group = 'Iedit' },
      { '<leader>f', group = 'Files' },
      { '<leader>n', group = 'Notes' },
      { '<leader>p', group = 'Project' },
      { '<leader>t', group = 'Telescope/Term' },
      { '<leader>v', group = 'Visual' },
      { '<leader>y', group = 'Yanked' },
      { '<leader>z', group = 'Zen' },
      { '<leader>l', group = 'LSP' },
    },
    plugins = {
      spelling = {
        enabled = true,
      },
    },
    show_help = false,
  },
}

return M
