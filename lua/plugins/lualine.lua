local navic = require('nvim-navic')

local function get_context()
  if navic and navic.is_available() then
    local loc = navic.get_location()
    if loc ~= '' then
      return '> ' .. loc
    end
  end
  return ''
end

local function keymap()
  if vim.bo.iminsert == 0 then
    return [[us]]
  else
    return [[ru]]
  end
end

local function action_available()
  return require('nvim-lightbulb').get_status_text()
end

local function mode_to_symbol(mode)
  local mode_sym_map = {
    normal = "α",
    insert = "Ɣ",
    visual = "Σ",
    ["v-block"] = "Θ",
    select = "Ϸ",
    ["v-select"] = "Ϸ",
    command = "Ψ",
    replace = "Δ"
  }

  return mode_sym_map[string.lower(mode)] or mode
end

require('lualine').setup {
  options = {
    theme = 'dracula',
    section_separators = { '', '' },
    component_separators = { '|', '|' },
    icons_enabled = true,
    fmt = mode_to_symbol
  },
  sections = {
    lualine_a = { 'mode', keymap },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {
      'filename',
      get_context,
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
      }, action_available
    },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  }
}
