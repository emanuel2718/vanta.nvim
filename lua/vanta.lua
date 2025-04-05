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

      normal_mode = "#0000ff",
      insert_mode = "#005F60",
      visual_mode = "#5F005F",
      replace_mode = "#5F0000",
      command_mode = "#5F5F00",
    },
    light = {},
  }

  local c = colors[vim.o.background]

  vim.g.terminal_color_1 = c.red0
  vim.g.terminal_color_2 = c.green0
  vim.g.terminal_color_3 = c.yellow0
  vim.g.terminal_color_4 = c.blue0
  vim.g.terminal_color_5 = c.visual_mode
  vim.g.terminal_color_6 = c.cyan0

  return c
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

    Search = { fg = colors.bg0, bg = colors.teal0 },
    IncSearch = { fg = colors.bg0, bg = colors.blue0 },
    CurSearch = { link = "IncSearch" },

    StatusLine = { fg = colors.fg0, bg = colors.normal_mode },
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
    PmenuSbar = { bg = colors.bg1 },
    PmenuThumb = { bg = colors.fg2 },

    DiffDelete = { bg = colors.red0 },
    DiffAdd = { bg = colors.green0 },
    DiffChange = { bg = colors.cyan0 },
    DiffText = { bg = colors.yellow0, fg = colors.bg0 },

    MiniStatuslineDevinfo = { fg = colors.fg0, bg = colors.normal_mode },
    MiniStatuslineFileinfo = { fg = colors.fg0, bg = colors.normal_mode },
    MiniStatuslineFilename = { fg = colors.fg0, bg = colors.normal_mode },
    MiniStatuslineInactive = { link = "StatusLineNc" },
    MiniStatuslineModeCommand = { fg = colors.fg0, bg = colors.command_mode, bold = config.bold },
    MiniStatuslineModeInsert = { fg = colors.fg0, bg = colors.insert_mode, bold = config.bold },
    MiniStatuslineModeNormal = { fg = colors.fg0, bg = colors.normal_mode, bold = config.bold },
    MiniStatuslineModeOther = { fg = colors.fg0, bg = colors.normal_mode, bold = config.bold },
    MiniStatuslineModeReplace = { fg = colors.fg0, bg = colors.replace_mode, bold = config.bold },
    MiniStatuslineModeVisual = { fg = colors.fg0, bg = colors.visual_mode, bold = config.bold },

    -- TreeSitter
    ["@variable"] = { fg = colors.fg1 },
    ["@function"] = { fg = colors.green1 },
    ["@function.call"] = { fg = colors.green1 },
    ["@operator"] = { fg = colors.fg1 },
    ["@keyword"] = { fg = colors.fg1 },
    ["@keyword.function"] = { fg = colors.fg1 },
    ["@keyword.operator"] = { fg = colors.fg1, italic = config.italic.operator },
    ["@keyword.return"] = { fg = colors.fg1 },
    ["@property"] = { fg = colors.teal1 },
    ["@field"] = { fg = colors.teal1 },
    ["@parameter"] = { fg = colors.fg1 },
    ["@punctuation.bracket"] = { fg = colors.fg1 },
    ["@punctuation.delimiter"] = { fg = colors.fg1 },
    ["@tag"] = { fg = colors.fg1 },
    ["@tag.attribute"] = { fg = colors.green1 },
    ["@tag.delimiter"] = { fg = colors.fg1 },
    ["@text"] = { fg = colors.fg0 },
    ["@text.emphasis"] = { italic = config.italic.emphasis },
    ["@text.strong"] = { bold = config.bold },
    ["@text.title"] = { fg = colors.fg0, bold = config.bold },
    ["@text.uri"] = { fg = colors.teal0, underline = config.underline },
    ["@type"] = { fg = colors.green2 },
    ["@string"] = { fg = colors.emerald0, italic = config.italic.string },
    ["@comment"] = { link = "Comment" },

    -- Git
    GitSignsAdd = { fg = colors.green0 },
    GitSignsChange = { fg = colors.cyan0 },
    GitSignsDelete = { fg = colors.red0 },
    GitGutterAdd = { fg = colors.green0 },
    GitGutterChange = { fg = colors.cyan0 },
    GitGutterDelete = { fg = colors.red0 },

    -- LSP
    DiagnosticError = { fg = colors.red0 },
    DiagnosticWarn = { fg = colors.yellow0 },
    DiagnosticInfo = { fg = colors.teal1 },
    DiagnosticHint = { fg = colors.green1 },
    DiagnosticUnderlineError = { undercurl = config.undercurl, sp = colors.red0 },
    DiagnosticUnderlineWarn = { undercurl = config.undercurl, sp = colors.yellow0 },
    DiagnosticUnderlineInfo = { undercurl = config.undercurl, sp = colors.teal1 },
    DiagnosticUnderlineHint = { undercurl = config.undercurl, sp = colors.green1 },
    DiagnosticVirtualTextError = { fg = colors.red0, bg = config.transparent and "NONE" or colors.bg1 },
    DiagnosticVirtualTextWarn = { fg = colors.yellow0, bg = config.transparent and "NONE" or colors.bg1 },
    DiagnosticVirtualTextInfo = { fg = colors.teal1, bg = config.transparent and "NONE" or colors.bg1 },
    DiagnosticVirtualTextHint = { fg = colors.green1, bg = config.transparent and "NONE" or colors.bg1 },
    DiagnosticFloatingError = { fg = colors.red0 },
    DiagnosticFloatingWarn = { fg = colors.yellow0 },
    DiagnosticFloatingInfo = { fg = colors.teal1 },
    DiagnosticFloatingHint = { fg = colors.green1 },
    DiagnosticSignError = { fg = colors.red0 },
    DiagnosticSignWarn = { fg = colors.yellow0 },
    DiagnosticSignInfo = { fg = colors.teal1 },
    DiagnosticSignHint = { fg = colors.green1 },

    -- LSP references
    LspReferenceText = { bg = colors.blue0, fg = colors.fg0 },
    LspReferenceRead = { bg = colors.blue0, fg = colors.fg0 },
    LspReferenceWrite = { bg = colors.blue0, fg = colors.fg0 },

    -- LSP code lens and inlay hints
    LspCodeLens = { fg = colors.fg2, italic = true },
    LspInlayHint = { fg = colors.fg2, bg = config.transparent and "NONE" or colors.bg1, italic = true },

    Terminal = { fg = colors.fg0, bg = colors.bg0 },

    -- Fold
    Folded = { fg = colors.fg2, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = { fg = colors.fg2 },

    SignColumn = { fg = colors.fg2, bg = config.transparent and "NONE" or colors.bg0 },
    MatchParen = { fg = colors.fg0, bg = colors.blue2, bold = config.bold },

    -- Tabs
    TabLine = { fg = colors.fg2, bg = colors.bg1 },
    TabLineFill = { fg = colors.fg2, bg = colors.bg1 },
    TabLineSel = { fg = colors.fg0, bg = colors.blue0 },

    SpellBad = { undercurl = config.undercurl, sp = colors.red0 },
    SpellCap = { undercurl = config.undercurl, sp = colors.yellow0 },
    SpellLocal = { undercurl = config.undercurl, sp = colors.cyan0 },
    SpellRare = { undercurl = config.undercurl, sp = colors.teal0 },

    -- Completion menu
    CmpItemAbbrMatch = { fg = colors.teal0, bold = config.bold },
    CmpItemAbbrMatchFuzzy = { fg = colors.teal0, bold = config.bold },
    CmpItemKind = { fg = colors.green1 },
    CmpItemMenu = { fg = colors.fg2 },

    -- Lazygit
    LazygitBranch = { fg = colors.cyan0, bold = config.bold },
    LazygitDiffAdd = { fg = colors.green0 },
    LazygitDiffChange = { fg = colors.cyan0 },
    LazygitDiffDelete = { fg = colors.red0 },
    LazygitCommitHash = { fg = colors.fg2 },
    LazygitCommitDate = { fg = colors.fg2 },
    LazygitCommitAuthor = { fg = colors.fg1 },
    LazygitCommitMessage = { fg = colors.fg0 },
    LazygitStatusModified = { fg = colors.cyan0 },
    LazygitStatusAdded = { fg = colors.green0 },
    LazygitStatusDeleted = { fg = colors.red0 },
    LazygitStatusRenamed = { fg = colors.cyan0 },
    LazygitStatusCopied = { fg = colors.green0 },
    LazygitStatusTypeChange = { fg = colors.yellow0 },
    LazygitStatusUnmerged = { fg = colors.red0 },
    LazygitStatusUntracked = { fg = colors.red0 },
    LazygitInstructions = { fg = colors.fg2 },
    LazygitCurrentFile = { fg = colors.fg0, bg = colors.blue0 },  -- MSDOS blue highlight
    LazygitSelected = { fg = colors.fg0, bg = colors.blue0 },     -- MSDOS blue highlight
    LazygitSelectedFile = { fg = colors.fg0, bg = colors.blue0 }, -- MSDOS blue highlight
    LazygitSectionTitle = { fg = colors.fg0, bold = config.bold },
    LazygitConflictMarker = { fg = colors.red0, bold = config.bold },

    TermCursor = { bg = colors.fg0 },
    TermCursorNC = { bg = colors.fg2 },

    NvimTreeCursorLine = { bg = colors.blue0 },

    FloatBorder = { fg = colors.fg0, bg = colors.bg1 },

    -- Additional highlight groups that might affect terminal UI
    WildMenu = { fg = colors.fg0, bg = colors.blue0 },
    Cursor = { fg = colors.bg0, bg = colors.fg0 },
    lCursor = { fg = colors.bg0, bg = colors.fg0 },

    -- Telescope
    TelescopeNormal = { fg = colors.fg0, bg = colors.bg0 },
    TelescopeBorder = { fg = colors.fg0, bg = colors.bg0 },
    TelescopeSelection = { fg = colors.fg0, bg = colors.blue0 }, -- MSDOS blue for selection
    TelescopeSelectionCaret = { fg = colors.emerald0, bg = colors.blue0 },
    TelescopeMultiSelection = { fg = colors.fg0, bg = colors.bg1 },
    TelescopeMatching = { fg = colors.cyan0, bold = config.bold },
    TelescopePromptPrefix = { fg = colors.emerald0 },
    TelescopePromptCounter = { fg = colors.fg2 },

    Directory = { fg = colors.teal1 },
    LineNr = { fg = colors.fg2 },

    -- FZF-Lua highlight groups (complete set from documentation)
    -- Main window
    FzfLuaNormal = { fg = colors.fg0, bg = colors.bg0 },
    FzfLuaBorder = { fg = colors.fg0, bg = colors.bg0 },
    FzfLuaTitle = { fg = colors.emerald0, bold = config.bold },
    FzfLuaTitleFlags = { fg = colors.emerald1, bg = colors.bg1 },
    FzfLuaBackdrop = { bg = colors.bg0 },

    -- Preview window
    FzfLuaPreviewNormal = { fg = colors.fg0, bg = colors.bg0 },
    FzfLuaPreviewBorder = { fg = colors.fg0, bg = colors.bg0 },
    FzfLuaPreviewTitle = { fg = colors.emerald0, bold = config.bold },
    FzfLuaCursor = { fg = colors.bg0, bg = colors.fg0 },
    FzfLuaCursorLine = { bg = colors.blue0, fg = colors.fg0 },
    FzfLuaCursorLineNr = { fg = colors.emerald0, bold = config.bold },
    FzfLuaSearch = { fg = colors.bg0, bg = colors.teal0 },

    -- Scrollbar elements
    FzfLuaScrollBorderEmpty = { fg = colors.fg2 },
    FzfLuaScrollBorderFull = { fg = colors.fg0 },
    FzfLuaScrollFloatEmpty = { bg = colors.bg1 },
    FzfLuaScrollFloatFull = { bg = colors.fg2 },

    -- Help window
    FzfLuaHelpNormal = { fg = colors.fg0, bg = colors.bg0 },
    FzfLuaHelpBorder = { fg = colors.fg2, bg = colors.bg0 },

    -- Header elements
    FzfLuaHeaderBind = { fg = colors.emerald0 },
    FzfLuaHeaderText = { fg = colors.fg1 },

    -- Path elements (for grep, quickfix, diagnostics)
    FzfLuaPathColNr = { fg = colors.cyan0 },
    FzfLuaPathLineNr = { fg = colors.green1 },

    -- Buffer elements
    FzfLuaBufName = { fg = colors.teal1 },
    FzfLuaBufId = { fg = colors.fg2 },
    FzfLuaBufNr = { fg = colors.emerald0 },
    FzfLuaBufLineNr = { fg = colors.green1 },
    FzfLuaBufFlagCur = { fg = colors.emerald0 },
    FzfLuaBufFlagAlt = { fg = colors.cyan0 },

    -- Tab elements
    FzfLuaTabTitle = { fg = colors.teal0 },
    FzfLuaTabMarker = { fg = colors.emerald0 },

    -- Path formatting
    -- FzfLuaDirIcon = { fg = colors.teal0 },
    -- FzfLuaDirPart = { fg = colors.teal1 },
    -- FzfLuaFilePart = { fg = colors.fg0 },

    FzfLuaLivePrompt = { fg = colors.emerald0 },
    FzfLuaLiveSym = { fg = colors.emerald0 },

    -- FZF (?)
    FzfLuaFzfNormal = { fg = colors.fg0, bg = colors.bg0 },
    FzfLuaFzfCursorLine = { bg = colors.blue0, fg = colors.fg0 },
    FzfLuaFzfMatch = { fg = colors.emerald0, bold = config.bold },
    FzfLuaFzfBorder = { fg = colors.fg0, bg = colors.bg0 },
    FzfLuaFzfScrollbar = { fg = colors.fg2 },
    FzfLuaFzfSeparator = { fg = colors.fg2 },
    FzfLuaFzfGutter = { bg = colors.bg0 },
    FzfLuaFzfHeader = { fg = colors.emerald0, bold = config.bold },
    FzfLuaFzfInfo = { fg = colors.fg2 },
    FzfLuaFzfPointer = { fg = colors.emerald0 },
    FzfLuaFzfMarker = { fg = colors.emerald0 },
    FzfLuaFzfSpinner = { fg = colors.emerald0 },
    FzfLuaFzfPrompt = { fg = colors.emerald0 },
    FzfLuaFzfQuery = { fg = colors.fg0 },

    diffFile = { fg = colors.teal1 },
    diffLine = { fg = colors.green1 }
  }

  -- TODO: implement overrides
  return groups
end

--@param config VantaConfig?
Vanta.setup = function(config)
  Vanta.config = vim.tbl_deep_extend("force", Vanta.config, config or {})
end

Vanta.update_statusline = function()
  local mode = vim.api.nvim_get_mode().mode
  local colors = get_colors()
  local mode_color = colors.normal_mode

  if mode == "i" then
    mode_color = colors.insert_mode
  elseif mode:find("v") or mode:find("V") or mode == "\22" then
    mode_color = colors.visual_mode
  elseif mode == "R" then
    mode_color = colors.replace_mode
  elseif mode == "c" then
    mode_color = colors.command_mode
  end

  vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.fg0, bg = mode_color })
  vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { fg = colors.fg0, bg = mode_color })
  vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { fg = colors.fg0, bg = mode_color })
  vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { fg = colors.fg0, bg = mode_color })
end

Vanta.load = function()
  if vim.version().minor < 8 then
    vim.notify_once("vanta.nvim: you must use neovim 0.8 or higher to use this colorscheme")
    return
  end

  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end

  vim.g.colors_name = "vanta"
  vim.o.termguicolors = true

  local groups = get_groups()

  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  local vanta_augroup = vim.api.nvim_create_augroup("VantaStatusline", { clear = true })
  vim.api.nvim_create_autocmd("ModeChanged", {
    group = vanta_augroup,
    pattern = "*:*",
    callback = Vanta.update_statusline,
  })

  Vanta.update_statusline()

  local colors = get_colors()
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_1 = colors.red0
  vim.g.terminal_color_2 = colors.green0
  vim.g.terminal_color_3 = colors.yellow0
  vim.g.terminal_color_4 = colors.blue0
  vim.g.terminal_color_5 = colors.visual_mode
  vim.g.terminal_color_6 = colors.cyan0
  vim.g.terminal_color_7 = colors.fg0
  vim.g.terminal_color_8 = colors.bg1
  vim.g.terminal_color_9 = colors.red0
  vim.g.terminal_color_10 = colors.green0
  vim.g.terminal_color_11 = colors.yellow0
  vim.g.terminal_color_12 = colors.blue0
  vim.g.terminal_color_13 = colors.visual_mode
  vim.g.terminal_color_14 = colors.cyan0
  vim.g.terminal_color_15 = colors.fg1
end

return Vanta
