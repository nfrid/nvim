hot_reload(debug.getinfo(1).source:sub(2))

vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.foldenable = false
vim.opt.foldmethod = 'manual'
vim.opt.updatetime = 100

vim.opt.conceallevel = 3

vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamed'
vim.g.clipboard = {
  name = 'xclip',
  copy = {
    ['+'] = 'xclip -i -selection clipboard',
    ['*'] = 'xclip -i -selection primary',
  },
  paste = {
    ['+'] = 'xclip -o -selection clipboard',
    ['*'] = 'xclip -o -selection primary',
  },
  cache_enabled = 0,
}

vim.opt.spell = true
vim.opt.spelllang = 'en_us,ru_yo'
vim.opt.keymap = 'russian'
vim.opt.iminsert = 0
vim.opt.imsearch = -1

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.showmode = false
vim.opt.signcolumn = 'no'
vim.opt.cursorline = true

vim.opt.list = true
vim.opt.listchars = { trail = '⋅' }
vim.opt.cc = '81'

vim.opt.termguicolors = true

vim.g.vimsyn_embed = 'l'

vim.mapleader = ' '
vim.g.mapleader = ' '

-- vim.opt.autochdir = true
