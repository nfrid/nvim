---@type LazySpec
local M = {
  'nfrid/markdown-togglecheck',
  dev = true,
  ft = { 'markdown' },
}

M.config = function()
  local function toggle()
    vim.go.operatorfunc = "v:lua.require'markdown-togglecheck'.toggle"
    return 'g@l'
  end

  local function toggle_box()
    vim.go.operatorfunc = "v:lua.require'markdown-togglecheck'.toggle_box"
    return 'g@l'
  end

  vim.keymap.set('n', '<leader>nn', toggle, { expr = true, desc = 'Toggle Checkmark' })
  vim.keymap.set('n', '<leader>nN', toggle_box, { expr = true, desc = 'Toggle Checkbox' })
  vim.keymap.set('v', '<leader>nn', ":'<,'>norm 1 nn<cr>", { desc = 'Toggle Checkmark' })
  vim.keymap.set('v', '<leader>nN', ":'<,'>norm 1 nN<cr>", { desc = 'Toggle Checkbox' })
end

return M
