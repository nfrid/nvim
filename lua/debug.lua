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
    if (next(o)) then s = s .. '\n' else return s .. '}' end
    tb = tb + 1
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"' .. k .. '"' end
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
