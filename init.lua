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

vim.loader.enable()

require('lazy').setup('plugins', {
  concurrency = 16,
  install = { colorscheme = { 'dracula', 'habamax' } },
  defaults = { lazy = true },
  dev = { path = '~/github', patterns = { 'nfrid' } },
  -- checker = { enabled = true, concurrency = 4 },
})

require('mapx').nnoremap('<leader>L', '<cmd>Lazy<cr>', 'Lazy')
