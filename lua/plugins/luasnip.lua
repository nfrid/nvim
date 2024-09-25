---@diagnostic disable: unused-local
---@type LazySpec
local M = {
  'L3MON4D3/LuaSnip',
  dependencies = { 'honza/vim-snippets' },
  keys = {
    {
      '<C-s>',
      function()
        require('luasnip').expand({})
      end,
      'Expand Snippet',
      mode = 'i',
    },
  },
}

math.randomseed(os.time())

local charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'

local chartable = {}
for c in charset:gmatch('.') do
  table.insert(chartable, c)
end

local function randstr(length)
  local str = ''
  for i = 1, length do
    str = str .. chartable[math.random(1, #chartable)]
  end
  return str
end

M.config = function()
  require('luasnip.loaders.from_snipmate').lazy_load()
  local ls = require('luasnip')

  local s = ls.snippet
  local sn = ls.snippet_node
  local t = ls.text_node
  local i = ls.insert_node
  local f = ls.function_node
  local c = ls.choice_node
  local d = ls.dynamic_node
  local r = ls.restore_node
  local l = require('luasnip.extras').lambda
  local rep = require('luasnip.extras').rep
  local p = require('luasnip.extras').partial
  local m = require('luasnip.extras').match
  local n = require('luasnip.extras').nonempty
  local dl = require('luasnip.extras').dynamic_lambda
  local fmt = require('luasnip.extras.fmt').fmt
  local fmta = require('luasnip.extras.fmt').fmta
  local types = require('luasnip.util.types')
  local conds = require('luasnip.extras.conditions')
  local conds_expand = require('luasnip.extras.conditions.expand')

  ls.filetype_extend('javascriptreact', { 'javascript' })
  ls.filetype_extend('typescriptreact', { 'typescript' })

  ls.add_snippets('all', {
    s(
      { trig = 'rand(%d+)', regTrig = true },
      f(function(_, snip)
        return randstr(tonumber(snip.captures[1]))
      end, {})
    ),
  })
end

return M
