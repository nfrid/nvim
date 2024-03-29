---@type LazySpec
local M = {
  'hoob3rt/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'kosayoda/nvim-lightbulb',
    'otavioschwanck/arrow.nvim',
  },
  lazy = false,
}

M.config = function()
  local function diff()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end

  local function keymap()
    if vim.bo.iminsert == 0 then
      return [[us]]
    else
      return [[ru]]
    end
  end

  local function arrow()
    return require('arrow.statusline').text_for_statusline() ~= '' and ''
      or ''
  end

  local function action_available()
    return require('nvim-lightbulb').get_status_text()
  end

  local function mode_to_symbol(mode)
    local mode_sym_map = {
      normal = 'α',
      insert = 'Ɣ',
      visual = 'Σ',
      ['v-block'] = 'Θ',
      select = 'Ϸ',
      ['v-select'] = 'Ϸ',
      command = 'Ψ',
      replace = 'Δ',
    }

    return mode_sym_map[string.lower(mode)] or mode
  end

  local filename = {
    'filename',
    symbols = {
      modified = ' ●',
      readonly = ' ',
      unnamed = ' ',
      newfile = ' ',
    },
  }

  local filename_path = table.shallow_copy(filename)
  filename_path.path = 1

  local no_winbar_ext = {
    winbar = {},
    inactive_winbar = {},
    filetypes = {
      'man',
      'qf',
      'Outline',
      'dap-repl',
      'dapui_console',
      'dapui_watches',
      'dapui_stacks',
      'dapui_breakpoints',
      'dapui_scopes',
      'toggleterm',
      'Trouble',
    },
  }

  require('lualine').setup({
    options = {
      theme = 'dracula',
      section_separators = { '', '' },
      component_separators = { '|', '|' },
      icons_enabled = true,
      fmt = mode_to_symbol,
      globalstatus = true,
    },
    extensions = { no_winbar_ext },
    sections = {
      lualine_a = { 'mode', keymap },
      lualine_b = { arrow, filename },
      lualine_c = { action_available },
      lualine_x = {
        {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = {
            error = ' ',
            warn = ' ',
            info = '',
            hint = ' ',
          },
        },
        { 'diff', source = diff },
        { 'b:gitsigns_head', icon = '' },
      },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    -- winbar = {
    --   lualine_a = { filename_path },
    --   lualine_b = {},
    --   lualine_c = {},
    --   lualine_x = { 'filetype' },
    --   lualine_y = { 'progress' },
    --   lualine_z = { 'location' },
    -- },
    -- inactive_winbar = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = { filename_path },
    --   lualine_x = { 'filetype', 'progress', 'location' },
    --   lualine_y = {},
    --   lualine_z = {},
    -- },
  })
end

return M
