---@type LazySpec
local M = {
  'b0o/mapx.nvim',
  dependencies = { 'folke/which-key.nvim' },
}

M.config = function()
  local mx = require('mapx')

  mx.setup({ whichkey = true })

  ToggleConceal = function()
    if vim.wo.conceallevel == 2 then
      vim.wo.conceallevel = 0
    else
      vim.wo.conceallevel = 2
    end
  end

  mx.nname('<leader>v', 'visuals')
  mx.nnoremap('<leader>vc', ToggleConceal, 'Conceal')

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

  mx.nnoremap('<leader>vw', ToggleWrap, 'Wrap')

  ToggleKeyMap = function()
    if vim.bo.iminsert == 0 then
      vim.bo.iminsert = 1
    else
      vim.bo.iminsert = 0
    end
  end

  mx.noremap('<C-^>', ToggleKeyMap, 'Keymap')
  mx.noremap('<A-Space>', ToggleKeyMap, 'Keymap')
  mx.inoremap('<A-Space>', '<C-^>', 'Keymap')
  mx.cnoremap('<A-Space>', '<C-^>', 'Keymap')
  mx.tnoremap('<A-Space>', '<C-^>', 'Keymap')

  ToggleRelNums = function()
    if vim.wo.relativenumber then
      vim.wo.relativenumber = false
    else
      vim.wo.relativenumber = true
    end
  end

  mx.nnoremap('<leader>vr', ToggleRelNums, 'Relative numbers')

  mx.nnoremap('<leader>x', '<cmd>Inspect<cr>', 'Inspect At Cursor')

  -- mappings

  mx.nnoremap('<SPACE>', '<NOP>')

  mx.nnoremap('gF', ':e <cfile><CR>', 'Go to file (FORCE)')

  mx.nnoremap('<leader>w', '<CMD>WhichKey <C-w><CR>')
  mx.nnoremap('<C-w>t', '<CMD>tabnew<CR>', 'New Tab')
  mx.nnoremap('<C-w>o', '<CMD>only<CR>', 'Window Only')
  mx.nnoremap('<C-w>O', '<CMD>tabonly<CR>', 'Tab Only')
  mx.nnoremap('<C-w>Q', '<CMD>tabclose<CR>', 'Close Tab')

  mx.nnoremap('<leader>fs', ':w!<CR>', 'Save buffer')
  mx.nnoremap(
    '<Leader>v/',
    "<CMD>lua vim.opt.hls = not vim.api.nvim_get_option('hls')<CR>",
    'Search highlighting'
  )
  mx.nnoremap('<leader>/', ':nohlsearch<CR>', 'Clear search highlighting')
  mx.nnoremap('Q', ':bd<CR>')
  mx.nnoremap('<leader>cd', ':cd %:h<CR>', 'cd to the buffer')
  mx.nnoremap('<leader>cp', ':let @+ = expand("%:p:h")<CR>', 'Copy buffer path')

  mx.nnoremap('<leader>V', ':e $MYVIMRC<CR>', 'Go to vimrc')

  mx.nnoremap('<leader>vs', ':set spell!<CR>', 'Spell')

  if vim.env.TMUX == nil then
    mx.nnoremap('<A-a>', ':silent !$TERM & disown<CR>')
  end

  mx.tnoremap('<A-a>', '<C-\\><C-n>')
  mx.tnoremap('<A-Esc>', '<C-\\><C-n>')

  mx.nnoremap('\\\\', '<Esc>/<++><Enter>"_c4l', 'Replace next <++>')

  mx.nnoremap('zz', 'za', 'Toggle fold')
  mx.nnoremap('za', 'zz', 'Center')

  -- mx.inoremap('<C-j>', [[pumvisible() ? "\\<C-n>" : "\\<C-j>"]], 'expr')
  -- mx.inoremap('<C-k>', [[pumvisible() ? "\\<C-p>" : "\\<C-k>"]], 'expr')
  -- mx.inoremap('<Tab>', [[pumvisible() ? "\\<C-n>" : "\\<Tab>"]], 'expr')
  -- mx.inoremap('<S-Tab>', [[pumvisible() ? "\\<C-p>" : "\\<S-Tab>"]], 'expr')
end

return M
