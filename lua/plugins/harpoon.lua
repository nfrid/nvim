local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local mx = require('mapx')

local leader = '<leader>'
-- mx.nname(leader, 'harpoon')

local function map(key, cmd, label)
  local lhs
  if type(key) == 'table' then
    lhs = key[1]
  else
    lhs = leader .. key
  end
  local rhs
  if type(cmd) == 'string' then
    rhs = cmd
  else
    rhs = function()
      cmd()
    end
  end
  mx.nnoremap(lhs, rhs, label)
end

map('<leader>', ui.toggle_quick_menu, 'Harpoon Menu')
map('h', mark.add_file, 'Harpoon File')
map({ '<C-h>' }, ui.nav_prev, 'Prev Harpoon File')
map({ '<C-l>' }, ui.nav_next, 'Next Harpoon File')
