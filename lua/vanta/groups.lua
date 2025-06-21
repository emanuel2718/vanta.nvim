local Colors = require('vanta.colors')

local M = {}

function M.get()
  local colors = Colors.get()

  Colors.apply()

  local g = {
    Normal = { bg = colors.bg0, fg = colors.fg0 },
    CursorLine = { bg = colors.fg0 },
  }


  return g
end

return M
