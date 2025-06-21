local Colors = require("vanta.colors")

local M = {}

function M.get()
  ---@type VantaPalette
  local colors = Colors.get()

  Colors.apply()

  local g = {
    Normal = { bg = colors.black, fg = colors.slate },
    CursorLine = { bg = colors.blue_dark },
  }

  return g
end

return M
