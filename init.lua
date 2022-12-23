require('utils')
require('opts')
require('cmds')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--single-branch',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require('lazy').setup('plugins', {
  concurrency = 16,
  install = { colorscheme = { 'dracula', 'habamax' } },
  defaults = { lazy = true },
  -- checker = { enabled = true, concurrency = 4 },
})

require('mapx').nnoremap('<leader>L', '<cmd>Lazy<cr>', 'Lazy')
