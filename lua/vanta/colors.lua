local config = require("vanta.config")
local palette = require("vanta.palette")

local M = {}

---@return VantaPalette
function M.get()
  local bg = vim.o.background

  ---@type table<string, VantaPalette>
  local colors = {
    dark = {
      black = palette.black,
      slate = palette.slate,
      grey_dark = palette.grey_dark,
      grey_neutral = palette.grey_neutral,
      grey_light = palette.grey_light,
      blue_dark = palette.blue_dark,
      blue_neutral = palette.blue_neutral,
      blue_light = palette.blue_light,
      blue_bright = palette.blue_bright,
      green_dark = palette.green_dark,
      green_opaque = palette.green_opaque,
      green_neutral = palette.green_neutral,
      green_light = palette.green_light,
      green_bright = palette.green_bright,
      red = palette.red,
      yellow = palette.yellow,
      violet = palette.violet,
      gold = palette.gold,
    },
    ---@diagnostic disable-next-line: missing-fields
    light = {},
  }

  return colors[bg]
end

function M.apply()
  local cfg = config.values
  if not cfg.terminal_colors then
    return
  end

  ---@type VantaPalette
  local c = M.get()
  local t = {
    c.black,
    c.slate,
    c.grey_dark,
    c.grey_neutral,
    c.grey_light,
    c.blue_dark,
    c.blue_neutral,
    c.blue_light,
    c.blue_bright,
    c.green_dark,
    c.green_opaque,
    c.green_neutral,
    c.green_light,
    c.green_bright,
    c.red,
    c.yellow,
    c.violet,
    c.gold,
  }

  for i, v in ipairs(t) do
    vim.g["terminal_color_" .. (i - 1)] = v
  end
end

return M
