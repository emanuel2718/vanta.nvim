local Colors = require("vanta.colors")
local Config = require("vanta.config")

local M = {}

function M.get()
  ---@type VantaPalette
  local colors = Colors.get()
  local config = Config.values

  Colors.apply()

  local statusline_bg = "#C0C0C0"
  local statusline_bg_nc = "#7A7A7A"
  local statusline_mode_bg = "#3A3A3A"
  local completion_bg = colors.grey_dark
  local completion_border = colors.grey_neutral
  local warning_fg = "#FFD75F"
  local warning_bg = "#302400"

  local g = {
    Normal = { bg = colors.black, fg = colors.slate },
    NormalNC = config.dim_inactive and { bg = colors.grey_dark, fg = colors.slate } or { link = "Normal" },
    NormalFloat = { bg = colors.grey_dark, fg = colors.slate },

    Visual = { bg = colors.blue_neutral, fg = colors.slate },

    CursorLine = { bg = colors.blue_dark },

    MatchParen = { bg = colors.blue_light, fg = colors.slate, bold = config.bold },

    Search = { bg = colors.green_opaque, fg = colors.slate },
    IncSearch = { bg = colors.blue_neutral, fg = colors.slate },
    CurSearch = { link = "IncSearch" },

    Pmenu = { bg = completion_bg, fg = colors.slate },
    PmenuSel = { bg = colors.blue_neutral, fg = colors.slate, bold = config.bold },
    PmenuSbar = { bg = colors.black_opaque },
    PmenuThumb = { bg = colors.grey_neutral },

    StatusLine = { bg = statusline_bg, fg = colors.black, bold = config.bold },
    StatusLineNC = { bg = statusline_bg_nc, fg = colors.slate },

    Comment = { fg = colors.grey_light, italic = config.italic.comments },
    SpecialComment = { fg = colors.grey_light, italic = config.italic.comments },
    WarningMsg = { fg = warning_fg, bold = config.bold },
    Todo = { bg = colors.gold, fg = colors.slate, italic = config.italic.comments, bold = config.bold },
    Done = { bg = colors.green_dark, fg = colors.slate, italic = config.italic.comments, bold = config.bold },
    Error = { bg = colors.red, fg = colors.slate, italic = config.italic.comments, bold = config.bold },

    Type = { fg = colors.green_muted },
    Special = { fg = colors.green_muted },
    Function = { fg = colors.green_muted, bold = config.bold },

    String = { fg = colors.green_bright, italic = config.italic.strings },
    Character = { fg = colors.green_bright },
    Boolean = { fg = colors.green_muted },
    Number = { fg = colors.green_muted },
    Float = { fg = colors.green_muted },

    -- Spell
    SpellBad = { undercurl = config.undercurl, sp = colors.red },
    SpellCap = { undercurl = config.undercurl, sp = warning_fg },
    SpellLocal = { undercurl = config.undercurl, sp = colors.blue_bright },
    SpellRare = { undercurl = config.undercurl, sp = colors.gold },

    -- Git (neogit style: colored backgrounds, contrasting text)
    DiffAdd = { bg = colors.green_dark, fg = colors.green_bright },
    DiffDelete = { bg = colors.red_dark, fg = colors.red },
    DiffChange = { bg = colors.blue_dark, fg = colors.blue_bright },
    DiffText = { bg = colors.blue_dark, fg = colors.blue_bright },

    GitSignsAdd = { fg = colors.green_bright },
    GitSignsChange = { fg = warning_fg },
    GitSignsDelete = { fg = colors.red },

    -- Mini
    MiniStatuslineDevinfo = { bg = statusline_bg, fg = colors.black },
    MiniStatuslineFileinfo = { bg = statusline_bg, fg = colors.black },
    MiniStatuslineLocation = { bg = statusline_bg, fg = colors.black },
    MiniStatuslineFilename = { bg = statusline_bg, fg = colors.black },
    MiniStatuslineModeNormal = { bg = statusline_mode_bg, fg = colors.blue_bright, bold = config.bold },
    MiniStatuslineModeInsert = { bg = statusline_mode_bg, fg = colors.green_bright, bold = config.bold },
    MiniStatuslineModeVisual = { bg = statusline_mode_bg, fg = colors.violet, bold = config.bold },
    MiniStatuslineModeReplace = { bg = statusline_mode_bg, fg = colors.red, bold = config.bold },
    MiniStatuslineModeCommand = { bg = statusline_mode_bg, fg = colors.yellow, bold = config.bold },
    MiniStatuslineInactive = { link = "StatusLineNC" },

    -- Completion menu
    CmpItemAbbr = { fg = colors.slate },
    CmpItemAbbrDeprecated = { fg = colors.grey_neutral, strikethrough = true },
    CmpItemAbbrMatch = { fg = colors.blue_bright, bold = config.bold },
    CmpItemAbbrMatchFuzzy = { fg = colors.blue_bright, bold = config.bold },
    CmpItemKind = { fg = colors.green_bright },
    CmpItemMenu = { fg = colors.grey_light, italic = config.italic.comments },

    -- Blink.cmp
    BlinkCmpMenu = { bg = completion_bg, fg = colors.slate },
    BlinkCmpMenuBorder = { bg = completion_bg, fg = completion_border },
    BlinkCmpMenuSelection = { bg = colors.blue_neutral, fg = colors.slate, bold = config.bold },
    BlinkCmpScrollBarThumb = { bg = colors.grey_neutral },
    BlinkCmpScrollBarGutter = { bg = completion_bg },
    BlinkCmpDoc = { bg = completion_bg, fg = colors.slate },
    BlinkCmpDocBorder = { bg = completion_bg, fg = completion_border },
    BlinkCmpDocSeparator = { bg = completion_bg, fg = completion_border },
    BlinkCmpSignatureHelp = { bg = completion_bg, fg = colors.slate },
    BlinkCmpSignatureHelpBorder = { bg = completion_bg, fg = completion_border },
    BlinkCmpSignatureHelpActiveParameter = { fg = colors.yellow, bold = config.bold },
    BlinkCmpKindFunction = { fg = colors.slate },
    BlinkCmpKindMethod = { fg = colors.slate },
    BlinkCmpKindField = { fg = colors.slate },
    BlinkCmpLabel = { fg = colors.slate },
    BlinkCmpLabelDeprecated = { fg = colors.grey_neutral, strikethrough = true },
    BlinkCmpLabelMatch = { fg = colors.blue_bright, bold = config.bold },
    BlinkCmpLabelDetail = { fg = colors.grey_light },
    BlinkCmpLabelDescription = { fg = colors.grey_neutral, italic = config.italic.comments },
    BlinkCmpSource = { fg = colors.grey_light },
    BlinkCmpKind = { fg = colors.slate },
    BlinkCmpKindText = { fg = colors.slate },
    BlinkCmpKindConstructor = { fg = colors.slate },
    BlinkCmpKindVariable = { fg = colors.slate },
    BlinkCmpKindClass = { fg = colors.slate },
    BlinkCmpKindInterface = { fg = colors.slate },
    BlinkCmpKindModule = { fg = colors.slate },
    BlinkCmpKindProperty = { fg = colors.slate },
    BlinkCmpKindUnit = { fg = colors.slate },
    BlinkCmpKindValue = { fg = colors.slate },
    BlinkCmpKindEnum = { fg = colors.slate },
    BlinkCmpKindKeyword = { fg = colors.slate },
    BlinkCmpKindSnippet = { fg = colors.slate },
    BlinkCmpKindColor = { fg = colors.slate },
    BlinkCmpKindFile = { fg = colors.slate },
    BlinkCmpKindReference = { fg = colors.slate },
    BlinkCmpKindFolder = { fg = colors.slate },
    BlinkCmpKindEnumMember = { fg = colors.slate },
    BlinkCmpKindConstant = { fg = colors.slate },
    BlinkCmpKindStruct = { fg = colors.slate },
    BlinkCmpKindEvent = { fg = colors.slate },
    BlinkCmpKindOperator = { fg = colors.slate },
    BlinkCmpKindTypeParameter = { fg = colors.slate },

    -- LSP
    LspReferenceText = { bg = colors.blue_neutral, fg = colors.slate },
    LspReferenceRead = { bg = colors.blue_neutral, fg = colors.slate },
    LspReferenceWrite = { bg = colors.blue_neutral, fg = colors.slate },

    DiagnosticError = { fg = colors.red },
    DiagnosticWarn = { fg = warning_fg, bold = config.bold },
    DiagnosticInfo = { fg = colors.blue_light },
    DiagnosticHint = { fg = colors.gold },
    DiagnosticUnderlineError = { undercurl = config.undercurl, sp = colors.red },
    DiagnosticUnderlineWarn = { undercurl = config.undercurl, sp = warning_fg },
    DiagnosticUnderlineInfo = { undercurl = config.undercurl, sp = colors.blue_light },
    DiagnosticUnderlineHint = { undercurl = config.undercurl, sp = colors.gold },
    DiagnosticVirtualTextError = { bg = colors.black, fg = colors.red },
    DiagnosticVirtualTextWarn = { bg = warning_bg, fg = warning_fg, bold = config.bold },
    DiagnosticVirtualTextInfo = { bg = colors.black, fg = colors.blue_light },
    DiagnosticVirtualTextHint = { bg = colors.black, fg = colors.gold },
    DiagnosticFloatingError = { fg = colors.red },
    DiagnosticFloatingWarn = { fg = warning_fg, bold = config.bold },
    DiagnosticFloatingInfo = { fg = colors.blue_light },
    DiagnosticFloatingHint = { fg = colors.gold },
    DiagnosticSignError = { fg = colors.red },
    DiagnosticSignWarn = { fg = warning_fg, bold = config.bold },
    DiagnosticSignInfo = { fg = colors.blue_light },
    DiagnosticSignHint = { fg = colors.gold },

    -- Treesitter
    ["@comment"] = { link = "Comment" },
    ["@comment.documentation"] = { link = "Comment" },
    ["@comment.error"] = { link = "Error" },
    ["@comment.todo"] = { link = "Todo" },
    ["@comment.note"] = { link = "Todo" },
    ["@comment.warning"] = { link = "WarningMsg" },
    ["@string.documentation"] = { link = "Comment" },
    ["@markup"] = { fg = colors.grey_light },
    ["@markup.heading"] = { fg = colors.grey_light, bold = config.bold },
    ["@markup.list"] = { fg = colors.grey_light },
    ["@markup.raw"] = { fg = colors.grey_light },
    ["@markup.raw.block"] = { fg = colors.grey_light },
    ["@markup.raw.delimiter"] = { fg = colors.grey_neutral },
    ["@variable"] = { fg = colors.slate },
    ["@variable.member"] = { fg = colors.green_muted },
    ["@function"] = { fg = colors.green_muted },
    ["@function.call"] = { fg = colors.green_opaque },
    ["@operator"] = { fg = colors.slate },
    ["@keyword"] = { fg = colors.slate },
    ["@keyword.function"] = { fg = colors.slate },
    ["@keyword.operator"] = { fg = colors.slate, italic = config.italic.operators },
    ["@keyword.return"] = { fg = colors.slate },
    ["@property"] = { fg = colors.slate },
    ["@field"] = { fg = colors.slate },
    ["@method"] = { fg = colors.green_muted },
    ["@symbol"] = { fg = colors.green_teal },
    ["@parameter"] = { fg = colors.slate },
    ["@punctuation.bracket"] = { fg = colors.slate },
    ["@punctuation.delimiter"] = { fg = colors.slate },
    ["@constructor"] = { fg = colors.slate },
    ["@string.regex"] = { link = "String" },
    ["@string.regexp"] = { link = "String" },
    ["@string.escape"] = { link = "String" },
    ["@type"] = { fg = colors.green_muted },
  }

  return g
end

return M
