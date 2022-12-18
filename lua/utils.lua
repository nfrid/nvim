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

_G.cfgdir = vim.fn.fnamemodify(vim.fn.expand('$MYVIMRC'), ':h') .. '/'
--- @param path string
_G.source = function(path)
  vim.cmd('source ' .. cfgdir .. path)
end

--- @param t table
function table.shallow_copy(t)
  local t2 = {}
  for k, v in pairs(t) do
    t2[k] = v
  end
  return t2
end

--- @param this_file string
--- @param after_cmd string|nil
_G.hot_reload = function(this_file, after_cmd)
  local group = vim.api.nvim_create_augroup(this_file, { clear = true })
  local cmd = 'source <afile>'
  if after_cmd then
    cmd = cmd .. ' | ' .. after_cmd
  end
  vim.api.nvim_create_autocmd('BufWritePost', {
    command = cmd,
    group = group,
    pattern = this_file,
  })
end

hot_reload(debug.getinfo(1).source:sub(2))
