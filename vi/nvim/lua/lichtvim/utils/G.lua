function _G.Dump(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

_G.api = require("lichtvim.utils.api")
_G.map = require("lichtvim.utils.mapping")
