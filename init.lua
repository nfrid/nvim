require('debug')

vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.foldenable = false

vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.cmd(
  'au BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4'
)

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamed'

vim.opt.spell = true
vim.opt.spelllang = 'en_us,ru_yo'
vim.opt.keymap = 'russian-jcukenwin'
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

require('plugins')
local mx = require('mapx')

Format = function()
  vim.cmd(':w')

  local formatCmds = {
    lua = 'stylua -s',
    sh = 'shfmt -s -i 2 -w',
    bash = 'shfmt -s -i 2 -w',
    go = 'gofmt -w',
    javascript = 'prettier -w --loglevel error',
    typescript = 'prettier -w --loglevel error',
    javascriptreact = 'prettier -w --loglevel error',
    typescriptreact = 'prettier -w --loglevel error',
    json = 'prettier -w --loglevel error',
    css = 'prettier -w --loglevel error',
    scss = 'prettier -w --loglevel error',
    cmake = 'cmake-format -i',
    c = 'clang-format -style=file -i',
    cpp = 'clang-format -style=file -i',
    markdown = 'prettier -w --prose-wrap always --loglevel error',
    python = 'black -q',
    haskell = 'stylish-haskell -i',
  }

  local formatCmd = formatCmds[vim.bo.filetype] or 'sed -i -e "s/\\s\\+$//"'
  local f =
  io.popen(formatCmd .. ' "' .. vim.api.nvim_buf_get_name(0) .. '" 2>&1')
  if not f then
    return
  end

  print(f:read('*all'))
  f:close()
  vim.cmd('let tmp = winsaveview()')
  vim.cmd('e!')
  vim.cmd('call winrestview(tmp)')
  vim.cmd('IndentBlanklineRefresh')
end

mx.nnoremap('<leader>F', Format, 'Format')

ToggleConceal = function()
  if vim.wo.conceallevel == 2 then
    vim.wo.conceallevel = 0
  else
    vim.wo.conceallevel = 2
  end
end

mx.nname('<leader>p', 'visuals')
mx.nnoremap('<leader>pc', ToggleConceal, 'Conceal')

ToggleWrap = function()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.api.nvim_buf_del_keymap(0, 'n', 'j')
    vim.api.nvim_buf_del_keymap(0, 'n', 'k')
  else
    vim.wo.wrap = true
    mx.nnoremap('j', 'gj', 'buffer')
    mx.nnoremap('k', 'gk', 'buffer')
  end
end

mx.nnoremap('<leader>pw', ToggleWrap, 'Wrap')

ToggleKeyMap = function()
  if vim.bo.iminsert == 0 then
    vim.bo.iminsert = 1
  else
    vim.bo.iminsert = 0
  end
end

mx.noremap('<C-^>', ToggleKeyMap, 'Keymap')
mx.noremap('<A-Space>', ToggleKeyMap, 'Keymap')
mx.noremapbang('<A-Space>', '<C-^>', 'Keymap')
mx.tnoremap('<A-Space>', '<C-^>', 'Keymap')

ToggleRelNums = function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end

mx.nnoremap('<leader>pr', ToggleRelNums, 'Relative numbers')

vim.cmd('au BufReadPost *.zsh,.zshrc set filetype=sh')
vim.cmd('au BufReadPost *.fish set filetype=fish')
vim.cmd('au BufReadPost *.conf set filetype=config')

vim.cmd('au BufReadPost *.kbd set filetype=lisp')

vim.cmd('command! W :w!')

-- mappings

mx.nnoremap('<SPACE>', '<NOP>')

mx.nnoremap('<tab>', '<CMD>bn<CR>')
mx.nnoremap('<s-tab>', '<CMD>bp<CR>')

mx.nnoremap('gF', ':e <cfile><CR>', 'Go to file (FORCE)')

mx.nnoremap('<leader>w', '<C-w>')
mx.nnoremap('<leader>fs', ':w!<CR>', 'Save buffer')
mx.nnoremap(
  '<Leader>p/',
  '<CMD>lua vim.opt.hls = not vim.api.nvim_get_option(\'hls\')<CR>',
  'Search highlighting'
)
mx.nnoremap('<Leader>/', ':nohlsearch<CR>', 'Clear search highlighting')
mx.nnoremap('Q', ':bd<CR>')
mx.nnoremap('<leader>cd', ':cd %:h<CR>', 'cd to the buffer')
mx.nnoremap('<leader>cp', ':let @+ = expand("%:p:h")<CR>', 'Copy buffer path')

mx.nnoremap('<leader>vv', ':e $MYVIMRC<CR>', 'Go to vimrc')

mx.nnoremap('<leader>ps', ':set spell!<CR>', 'Spell')

if vim.env.TMUX == nil then
  mx.nnoremap('<A-a>', ':silent !$TERM & disown<CR>')
end

mx.tnoremap('<A-a>', '<C-\\><C-n>')
mx.tnoremap('<A-Esc>', '<C-\\><C-n>')

mx.nnoremap('\\\\', '<Esc>/<++><Enter>"_c4l', 'Replace next <++>')

mx.nnoremap('cd', ':cd ')

-- mx.inoremap('<C-j>', [[pumvisible() ? "\\<C-n>" : "\\<C-j>"]], 'expr')
-- mx.inoremap('<C-k>', [[pumvisible() ? "\\<C-p>" : "\\<C-k>"]], 'expr')
-- mx.inoremap('<Tab>', [[pumvisible() ? "\\<C-n>" : "\\<Tab>"]], 'expr')
-- mx.inoremap('<S-Tab>', [[pumvisible() ? "\\<C-p>" : "\\<S-Tab>"]], 'expr')
