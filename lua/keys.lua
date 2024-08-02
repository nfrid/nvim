ToggleConceal = function()
  if vim.wo.conceallevel == 2 then
    vim.wo.conceallevel = 0
  else
    vim.wo.conceallevel = 2
  end
end

vim.keymap.set('n', '<leader>vc', ToggleConceal, { desc = 'Conceal' })

ToggleWrap = function()
  if vim.wo.wrap then
    vim.wo.wrap = false
    vim.api.nvim_buf_del_keymap(0, 'n', 'j')
    vim.api.nvim_buf_del_keymap(0, 'n', 'k')
  else
    vim.wo.wrap = true
    vim.keymap.set('n', 'j', 'gj', { desc = 'buffer' })
    vim.keymap.set('n', 'k', 'gk', { desc = 'buffer' })
  end
end

vim.keymap.set('n', '<leader>vw', ToggleWrap, { desc = 'Wrap' })

ToggleKeyMap = function()
  if vim.bo.iminsert == 0 then
    vim.bo.iminsert = 1
  else
    vim.bo.iminsert = 0
  end
end

vim.keymap.set('n', '<C-^>', ToggleKeyMap, { desc = 'Keymap' })
vim.keymap.set(
  { 'n', 'i', 'c', 't', 'x' },
  '<A-Space>',
  '<C-^>',
  { desc = 'Keymap' }
)

ToggleRelNums = function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end

vim.keymap.set('n', '<leader>vr', ToggleRelNums, { desc = 'Relative numbers' })

vim.keymap.set(
  'n',
  '<leader>x',
  '<cmd>Inspect<cr>',
  { desc = 'Inspect At Cursor' }
)

-- mappings

vim.keymap.set('n', '<SPACE>', '<NOP>')

vim.keymap.set('n', 'gF', ':e <cfile><CR>', { desc = 'Go to file (FORCE)' })

vim.keymap.set('n', '<leader>w', '<CMD>WhichKey <C-w><CR>', { desc = '<C-w>' })
vim.keymap.set('n', '<C-w>t', '<CMD>tabnew<CR>', { desc = 'New Tab' })
vim.keymap.set('n', '<C-w>o', '<CMD>only<CR>', { desc = 'Window Only' })
vim.keymap.set('n', '<C-w>O', '<CMD>tabonly<CR>', { desc = 'Tab Only' })
vim.keymap.set('n', '<C-w>Q', '<CMD>tabclose<CR>', { desc = 'Close Tab' })

vim.keymap.set('n', '<leader>fs', ':w!<CR>', { desc = 'Save buffer' })
vim.keymap.set(
  'n',
  '<Leader>v/',
  '<CMD>lua vim.opt.hls = not vim.api.nvim_get_option("hls")<CR>',
  { desc = 'Search highlighting' }
)
vim.keymap.set(
  'n',
  '<leader>/',
  ':nohlsearch<CR>',
  { desc = 'Clear search highlighting' }
)
vim.keymap.set('n', 'Q', ':bd<CR>')
vim.keymap.set('n', '<leader>cd', ':cd %:h<CR>', { desc = 'cd to the buffer' })
vim.keymap.set(
  'n',
  '<leader>cp',
  ':let @+ = expand("%:p:h")<CR>',
  { desc = 'Copy buffer path' }
)

vim.keymap.set('n', '<leader>V', ':e $MYVIMRC<CR>', { desc = 'Go to vimrc' })

vim.keymap.set('n', '<leader>vs', ':set spell!<CR>', { desc = 'Spell' })

if vim.env.TMUX == nil then
  vim.keymap.set('n', '<A-a>', ':silent !$TERM & disown<CR>')
end

vim.keymap.set('t', '<A-a>', '<C-\\><C-n>')
vim.keymap.set('t', '<A-Esc>', '<C-\\><C-n>')

vim.keymap.set(
  'n',
  '\\\\',
  '<Esc>/<++><Enter>"_c4l',
  { desc = 'Replace next <++>' }
)

vim.keymap.set('n', 'zz', 'za', { desc = 'Toggle fold' })
vim.keymap.set('n', 'za', 'zz', { desc = 'Center' })
