local cmd = vim.api.nvim_command

vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.foldenable = false

vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
cmd('au BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4')

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamed'

vim.opt.spell = false
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
  cmd(':w')

  local formatCmds = {
    lua = 'lua-format -i',
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
    haskell = 'stylish-haskell -i'
  }

  local formatCmd = formatCmds[vim.bo.filetype] or 'sed -i -e "s/\\s\\+$//"'
  local f = io.popen(formatCmd .. ' "' .. vim.api.nvim_buf_get_name(0) ..
                         '" 2>&1')
  if not f then return end

  print(f:read('*all'))
  f:close()
  cmd('let tmp = winsaveview()')
  cmd('e!')
  cmd('call winrestview(tmp)')
  cmd('IndentBlanklineRefresh')
end

mx.nnoremap('<leader>F', Format)

ToggleConceal = function()
  if vim.wo.conceallevel == 2 then
    vim.wo.conceallevel = 0
  else
    vim.wo.conceallevel = 2
  end
end

mx.nnoremap('<leader>pc', ToggleConceal)

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

mx.nnoremap('<leader>pw', ToggleWrap)

ToggleKeyMap = function()
  if vim.bo.iminsert == 0 then
    vim.bo.iminsert = 1
  else
    vim.bo.iminsert = 0
  end
end

mx.nnoremap('<A-l>', ToggleKeyMap)
mx.inoremap('<A-l>', '<C-^>')

ToggleRelNums = function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end

mx.nnoremap('<leader>pr', ToggleRelNums)

cmd('au BufReadPost *.zsh,.zshrc set filetype=sh')
cmd('au BufReadPost *.fish set filetype=fish')
cmd('au BufReadPost *.conf set filetype=config')

cmd('au BufReadPost *.kbd set filetype=lisp')

cmd('command! W :w!')

-- mappings

mx.nnoremap('<SPACE>', '<NOP>')

mx.nnoremap('<tab>', '<CMD>bn<CR>')
mx.nnoremap('<s-tab>', '<CMD>bp<CR>')

mx.nnoremap('<C-h>', '<CMD>bp<CR>')
mx.nnoremap('<C-l>', '<CMD>bn<CR>')
mx.nnoremap('<C-j>', '<CMD>tabn<CR>')
mx.nnoremap('<C-k>', '<CMD>tabp<CR>')

mx.nnoremap('gF', ':e <cfile><CR>')

mx.nnoremap('<leader>w', '<C-w>')
mx.nnoremap('<leader>fs', ':w!<CR>')
mx.nnoremap('<Leader>?', '<CMD>lua vim.opt.hls = not vim.opt.hls<CR>')
mx.nnoremap('<Leader>/', ':nohlsearch<CR>')
mx.nnoremap('Q', ':bd<CR>')
mx.nnoremap('<leader>cd', ':cd %:h<CR>')
mx.nnoremap('<leader>cp', ':let @+ = expand("%:p:h")<CR>')

mx.nnoremap('>', '>>')
mx.nnoremap('<', '<<')

mx.nnoremap('<leader>vv', ':e $MYVIMRC<CR>')

mx.nnoremap('<leader>ps', ':set spell!<CR>')

if vim.env.TMUX == nil then mx.nnoremap('<A-a>', ':silent !$TERM & disown<CR>') end

mx.tnoremap('<A-a>', '<C-\\><C-n>')

mx.nnoremap('\\\\', '<Esc>/<++><Enter>"_c4l')

mx.nnoremap('cd', ':cd ')

mx.inoremap('<C-j>', [[pumvisible() ? "\\<C-n>" : "\\<C-j>"]], 'expr')
mx.inoremap('<C-k>', [[pumvisible() ? "\\<C-p>" : "\\<C-k>"]], 'expr')
mx.inoremap('<Tab>', [[pumvisible() ? "\\<C-n>" : "\\<Tab>"]], 'expr')
mx.inoremap('<S-Tab>', [[pumvisible() ? "\\<C-p>" : "\\<S-Tab>"]], 'expr')
