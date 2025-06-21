local config = require('vanta.config')
local palette = require('vanta.palette')

local M = {}


---@return table<string,string>
function M.get()
  local bg = vim.o.background

  local colors = {
    dark = {
      bg0 = palette.bg0,
      fg0 = palette.fg0,
    },
    light = {
      bg0 = palette.fg0,
      fg0 = palette.bg0,

    }
  }

  return colors[bg]
end

function M.apply()
  local cfg = config.values
  if not cfg.terminal_colors then return end
  local c = M.get()
  local t = {
    c.bg0,
    c.fg0
  }

  for i, v in ipairs(t) do
    vim.g['terminal_color_' .. (i - 1)] = v
  end
end

return M
