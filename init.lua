--- Dump value of a variable in a formatted string
--
--- @param o    any       Dumpable object
--- @param tbs  string|nil  Tabulation string, '  ' by default
--- @param tb   number|nil  Initial tabulation level, 0 by default
--- @return     string
local function dump(o, tbs, tb)
  tb = tb or 0
  tbs = tbs or '  '
  if type(o) == 'table' then
    local s = '{'
    if next(o) then
      s = s .. '\n'
    else
      return s .. '}'
    end
    tb = tb + 1
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. tbs:rep(tb) .. '[' .. k .. '] = ' .. dump(v, tbs, tb)
      s = s .. ',\n'
    end
    tb = tb - 1
    return s .. tbs:rep(tb) .. '}'
  else
    return tostring(o)
  end
end

_G.dump = dump

--- Examine value of a variable in a formatted string in a notify window
--
--- @param o    any       Dumpable object
_G.examine = function(o)
  vim.notify(dump(o))
end

local sourced_path = debug.getinfo(1).source:sub(2)
local cfgdir = vim.fn.fnamemodify(sourced_path, ':h')
local luadir = cfgdir .. '/lua/'
local afterdir = cfgdir .. '/after/'
--- @param path string
_G.source = function(path)
  vim.cmd('source ' .. luadir .. path)
end
_G.source_after = function(path)
  vim.cmd('source ' .. afterdir .. path)
end

--- @param t table
function table.shallow_copy(t)
  local t2 = {}
  for k, v in pairs(t) do
    t2[k] = v
  end
  return t2
end

require('opts')
require('cmds')
require('plugins')
require('impatient')
