---@class Vanta
---@field config VantaConfig
local Vanta = {}

---@class ItalicsConfig
---@field string boolean
---@field operator boolean
---@field emphasis boolean
---@field folds boolean
---@field comment boolean

---@class VantaConfig
---@field terminal_colors boolean?
---@field undercurl boolean?
---@field underline boolean?
---@field bold boolean?
---@field dim_inactive boolean?
---@field transparent boolean?
---@field italic ItalicsConfig?
Vanta.config = {
  terminal_colors = true,
  undercurl = false,
  bold = true,
  underline = false,
  dim_inactive = false,
  transparent = false,
  italic = {
    string = false,
    operator = false,
    emphasis = false,
    comment = true,
    folds = true,
  },
}
-- hex list of vanta colors
local function get_colors()
  local colors = {
    dark = {
      bg0 = "#000000",
      bg1 = "#1A1A1A",
      bg2 = "#0f172a",
      fg0 = "#f8fafc",
      fg1 = "#e2e8f0",
      fg2 = "#94a3b8",
      blue0 = "#0000ff",
      blue1 = "#2563eb",
      blue2 = "#1e3a8a",
      blue3 = "#172554",
      gray0 = "#808080",
      green0 = "#22c55e",
      green1 = "#91AE4E",
      green2 = "#839D48",
      cyan0 = "#22d3ee",
      teal0 = "#14b8a6",
      teal1 = "#5FAA9C",
      teal2 = "#5BA9A1",
      emerald0 = "#92FFB8",
      emerald1 = "#34d399",
      yellow0 = "#fde047",
      red0 = "#ef4444",
    },
    light = {},
  }
  return colors[vim.o.background]
end

local function get_groups()
  local colors = get_colors()
  local config = Vanta.config

  if config.terminal_colors then
    local term_colors = {
      colors.bg,
      colors.fg,
    }

    for index, value in ipairs(term_colors) do
      vim.g["terminal_color_" .. index - 1] = value
    end
  end

  local groups = {
    VantaBg = { fg = colors.bg },

    Normal = config.transparent and { fg = colors.fg0, bg = nil } or { fg = colors.fg0, bg = colors.bg0 },
    NormalNC = config.dim_inactive and { fg = colors.fg2, bg = colors.bg1 } or { link = "Normal" },
    NormalFloat = config.transparent and { fg = colors.fg0, bg = nil } or { fg = colors.fg0, bg = colors.bg1 },

    Visual = { bg = colors.blue0, fg = colors.fg0 },
    CursorLine = { bg = colors.bg2 },
    CursorLineNr = { fg = colors.emerald0 },
    CursorColumn = { link = "CursorLine" },

    Search = { fg = colors.fg0, bg = colors.teal0 },
    IncSearch = { fg = colors.fg0, bg = colors.blue0 },
    CurSearch = { link = "IncSearch" },

    StatusLine = { fg = colors.fg0, bg = colors.blue0 },
    StatusLineNc = { fg = colors.bg0, bg = colors.fg2 },

    Comment = { fg = colors.gray0, italic = config.italic.comment },
    Todo = { fg = colors.bg0, bg = colors.yellow0, bold = config.bold },
    Done = { fg = colors.bg0, bg = colors.cyan0, bold = config.bold },
    Error = { fg = colors.bg0, bg = colors.red0, bold = config.bold },

    Type = { fg = colors.green2 },
    Special = { fg = colors.green2 },
    Statement = { fg = colors.fg1 },
    Identifier = { fg = colors.fg1 },
    Function = { fg = colors.green1 },
    Delimeter = { fg = colors.fg1 },

    String = { fg = colors.emerald0 },
    Character = { fg = colors.emerald1 },
    Boolean = { fg = colors.green2 },
    Number = { fg = colors.green2 },
    Float = { fg = colors.green2 },

    Pmenu = { fg = colors.fg0, bg = colors.bg0 },
    PmenuSel = { fg = colors.fg0, bg = colors.blue0, bold = config.bold },
    -- PmenuSbar = { bg = colors.bg2 },
    -- PmenuThumb = { bg = colors.bg4 },

    DiffDelete = { bg = colors.red0 },
    DiffAdd = { bg = colors.green0 },
    DiffChange = { bg = colors.cyan0 },
    DiffText = { bg = colors.yellow0, fg = colors.bg0 },

    TelescopeSelection = { bg = colors.blue0 },

    MiniStatuslineDevinfo = { link = "StatusLine" },
    MiniStatuslineFileinfo = { link = "StatusLine" },
    MiniStatuslineFilename = { fg = colors.fg0, bg = colors.blue0 },
    MiniStatuslineInactive = { link = "StatusLineNc" },
    MiniStatuslineModeCommand = { fg = colors.fg0, bg = colors.blue, bold = config.bold },
    MiniStatuslineModeInsert = { fg = colors.fg0, bg = colors.blue, bold = config.bold },
    MiniStatuslineModeNormal = { fg = colors.fg0, bg = colors.blue, bold = config.bold },
    MiniStatuslineModeOther = { fg = colors.fg0, bg = colors.blue, bold = config.bold },
    MiniStatuslineModeReplace = { fg = colors.fg0, bg = colors.blue, bold = config.bold },
    MiniStatuslineModeVisual = { fg = colors.fg0, bg = colors.blue, bold = config.bold },

    -- TODO: do the treesitter links
    -- ["@property"] = { fg = colors.teal0 },
    ["@variable"] = { fg = colors.fg1 },
  }

  -- TODO: implement overrides
  return groups
end

--@param config VantaConfig?
Vanta.setup = function(config)
  Vanta.config = vim.tbl_deep_extend("force", Vanta.config, config or {})
end

Vanta.load = function()
  if vim.version().minor < 8 then
    vim.notify_once("vanta.nvim: you must use neovim 0.8 or higher to use this colorscheme")
    return
  end

  -- reset
  if vim.g.colors_name then
    -- TODO: this much clearing might not be needed
    vim.cmd.hi("clear")
    vim.cmd("highlight clear")
    vim.cmd("hi Search guifg=NONE guibg=NONE gui=NONE")
  end

  -- NOTE: this might not be needed after we are done
  if vim.fn.exists("syntax on") then
    vim.cmd("syntax clear")
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "vanta"
  vim.o.termguicolors = true

  local groups = get_groups()

  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return Vanta
