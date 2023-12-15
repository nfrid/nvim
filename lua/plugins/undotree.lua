---@type LazySpec
local M = {
  'mbbill/undotree',
  cmd = { 'UndotreeToggle' },
}

M.init = function()
  vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = 'Toggle Undotree' })
end

return M
