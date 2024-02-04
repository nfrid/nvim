local media_fts = { 'png', 'jpg', 'gif', 'mp4', 'webm', 'pdf' }
local media_ft_group = vim.api.nvim_create_augroup('media_ft', {})

for _, ft in pairs(media_fts) do
  vim.api.nvim_create_autocmd('BufReadCmd', {
    group = media_ft_group,
    pattern = '*.' .. ft,
    callback = function()
      vim.cmd('setl ft=' .. ft)
    end,
  })
end

local filetype_aliases = vim.api.nvim_create_augroup('filetype_aliases', {})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_aliases,
  pattern = '*.*xaml',
  callback = function()
    vim.cmd('setl ft=xml')
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_aliases,
  pattern = '.swcrc',
  callback = function()
    vim.cmd('setl ft=json')
  end,
})
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = filetype_aliases,
  pattern = '*.d2',
  callback = function()
    vim.cmd('setl ft=d2')
  end,
})
