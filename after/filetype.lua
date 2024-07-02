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
