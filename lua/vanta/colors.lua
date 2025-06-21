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
      black_opaque = palette.black_opaque,
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
      green_muted = palette.green_muted,
      green_teal = palette.green_teal,
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

  vim.g.terminal_color_0 = c.black         -- Black
  vim.g.terminal_color_1 = c.red           -- Red
  vim.g.terminal_color_2 = c.green_bright  -- Green
  vim.g.terminal_color_3 = c.gold          -- Yellow
  vim.g.terminal_color_4 = c.blue_light    -- Blue
  vim.g.terminal_color_5 = c.violet        -- Magenta
  vim.g.terminal_color_6 = c.blue_bright   -- Cyan
  vim.g.terminal_color_7 = c.slate         -- White
  vim.g.terminal_color_8 = c.grey_dark     -- Bright Black (Dark Grey)
  vim.g.terminal_color_9 = c.red           -- Bright Red
  vim.g.terminal_color_10 = c.green_bright -- Bright Green
  vim.g.terminal_color_11 = c.yellow       -- Bright Yellow
  vim.g.terminal_color_12 = c.blue_bright  -- Bright Blue
  vim.g.terminal_color_13 = c.violet       -- Bright Magenta
  vim.g.terminal_color_14 = c.blue_bright  -- Bright Cyan
  vim.g.terminal_color_15 = c.slate        -- Bright White
end

return M
