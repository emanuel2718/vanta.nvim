local Colors = require("vanta.colors")
local Config = require("vanta.config")

local M = {}

function M.get()
  ---@type VantaPalette
  local colors = Colors.get()
  local config = Config.values

  Colors.apply()

  local statusline_bg = "#141414"
  local statusline_bg_alt = "#1E1E1E"
  local statusline_bg_nc = "#0F0F0F"
  local statusline_mode_normal_bg = "#0E2A3D"
  local statusline_mode_insert_bg = "#163523"
  local statusline_mode_visual_bg = "#3A2242"
  local statusline_mode_replace_bg = "#3A1616"
  local statusline_mode_command_bg = "#3A2E12"
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
    IncSearch = { fg = colors.yellow, bg = "NONE", bold = config.bold },
    CurSearch = { bg = colors.blue_neutral, fg = colors.slate, bold = config.bold },

    Pmenu = { bg = completion_bg, fg = colors.slate },
    PmenuSel = { bg = colors.blue_neutral, fg = colors.slate, bold = config.bold },
    PmenuSbar = { bg = colors.black_opaque },
    PmenuThumb = { bg = colors.grey_neutral },

    StatusLine = { bg = statusline_bg, fg = colors.slate, bold = config.bold },
    StatusLineNC = { bg = statusline_bg_nc, fg = colors.grey_neutral },

    Comment = { fg = colors.grey_light, italic = config.italic.comments },
    SpecialComment = { fg = colors.grey_light, italic = config.italic.comments },
    WarningMsg = { fg = warning_fg, bold = config.bold },
    Todo = { bg = colors.gold, fg = colors.slate, italic = config.italic.comments, bold = config.bold },
    Done = { bg = colors.green_dark, fg = colors.slate, italic = config.italic.comments, bold = config.bold },
    Error = { bg = colors.red, fg = colors.slate, italic = config.italic.comments, bold = config.bold },

    Constant = { fg = colors.green_neutral },
    Identifier = { fg = colors.slate },
    Type = { fg = colors.green_muted },
    Special = { fg = colors.slate },
    Function = { fg = colors.green_muted },
    Keyword = { fg = colors.slate },
    Operator = { fg = colors.slate, italic = config.italic.operators },
    Delimiter = { fg = colors.slate },

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
    DiffAdd = { fg = colors.green_bright },
    DiffDelete = { fg = colors.red },
    DiffChange = { fg = colors.blue_bright },
    DiffText = { fg = colors.blue_bright, bold = config.bold },

    GitSignsAdd = { fg = colors.green_bright },
    GitSignsChange = { fg = warning_fg },
    GitSignsDelete = { fg = colors.red },

    -- Mini
    MiniStatuslineDevinfo = { bg = statusline_bg_alt, fg = colors.grey_light },
    MiniStatuslineFileinfo = { bg = statusline_bg, fg = colors.grey_light },
    MiniStatuslineLocation = { bg = statusline_bg_alt, fg = colors.blue_bright },
    MiniStatuslineFilename = { bg = statusline_bg, fg = colors.slate, bold = config.bold },
    MiniStatuslineModeNormal = { bg = statusline_mode_normal_bg, fg = colors.blue_bright, bold = config.bold },
    MiniStatuslineModeInsert = { bg = statusline_mode_insert_bg, fg = colors.green_bright, bold = config.bold },
    MiniStatuslineModeVisual = { bg = statusline_mode_visual_bg, fg = colors.slate, bold = config.bold },
    MiniStatuslineModeReplace = { bg = statusline_mode_replace_bg, fg = colors.red, bold = config.bold },
    MiniStatuslineModeCommand = { bg = statusline_mode_command_bg, fg = colors.yellow, bold = config.bold },
    MiniStatuslineModeOther = { bg = statusline_bg_alt, fg = colors.slate, bold = config.bold },
    MiniStatuslineInactive = { link = "StatusLineNC" },
    MiniStatusLineModeNormal = { link = "MiniStatuslineModeNormal" },
    MiniStatusLineModeInsert = { link = "MiniStatuslineModeInsert" },
    MiniStatusLineModeVisual = { link = "MiniStatuslineModeVisual" },
    MiniStatusLineModeReplace = { link = "MiniStatuslineModeReplace" },
    MiniStatusLineModeCommand = { link = "MiniStatuslineModeCommand" },
    MiniStatusLineModeOther = { link = "MiniStatuslineModeOther" },

    -- fff.nvim
    FFFMatched = { fg = colors.yellow, bold = config.bold },

    -- Completion menu
    CmpItemAbbr = { fg = colors.slate },
    CmpItemAbbrDeprecated = { fg = colors.grey_neutral, strikethrough = true },
    CmpItemAbbrMatch = { fg = colors.grey_light },
    CmpItemAbbrMatchFuzzy = { fg = colors.grey_light },
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
    BlinkCmpLabelMatch = { fg = colors.grey_light },
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

    ["@variable"] = { link = "Identifier" },
    ["@variable.builtin"] = { link = "Identifier" },
    ["@variable.member"] = { link = "@field" },
    ["@variable.parameter"] = { link = "@parameter" },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { link = "Constant" },

    ["@function"] = { link = "Function" },
    ["@function.call"] = { link = "Function" },
    ["@function.builtin"] = { link = "Function" },
    ["@function.method"] = { link = "@method" },
    ["@function.method.call"] = { link = "@method" },

    ["@operator"] = { link = "Operator" },
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { link = "Keyword" },
    ["@keyword.operator"] = { link = "Operator" },
    ["@keyword.return"] = { link = "Keyword" },

    ["@property"] = { link = "Identifier" },
    ["@field"] = { link = "Identifier" },
    ["@method"] = { link = "Function" },
    ["@symbol"] = { link = "Identifier" },
    ["@parameter"] = { link = "Identifier" },
    ["@punctuation.bracket"] = { link = "Delimiter" },
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    ["@constructor"] = { link = "Type" },

    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@module"] = { link = "Identifier" },
    ["@namespace"] = { link = "Identifier" },

    ["@string"] = { link = "String" },
    ["@string.regex"] = { link = "String" },
    ["@string.regexp"] = { link = "String" },
    ["@string.escape"] = { link = "String" },
    ["@number"] = { link = "Number" },
    ["@float"] = { link = "Float" },
    ["@boolean"] = { link = "Boolean" },

    -- LSP semantic tokens
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.number"] = { link = "@number" },
    ["@lsp.type.operator"] = { link = "@operator" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.string"] = { link = "@string" },
    ["@lsp.type.struct"] = { link = "@type" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type" },
    ["@lsp.type.variable"] = { link = "@variable" },
  }

  return g
end

return M
