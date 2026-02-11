local Colors = require("vanta.colors")
local Config = require("vanta.config")

local M = {}

function M.get()
  ---@type VantaPalette
  local colors = Colors.get()
  local config = Config.values

  Colors.apply()

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

    StatusLine = { bg = colors.blue_neutral, fg = colors.slate },
    StatusLineNC = { bg = colors.grey_neutral, fg = colors.slate },

    Comment = { fg = colors.grey_light, italic = config.italic.comments },
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
    SpellCap = { undercurl = config.undercurl, sp = colors.yellow },
    SpellLocal = { undercurl = config.undercurl, sp = colors.blue_bright },
    SpellRare = { undercurl = config.undercurl, sp = colors.gold },

    -- Git (neogit style: colored backgrounds, contrasting text)
    DiffAdd = { bg = colors.green_dark, fg = colors.green_bright },
    DiffDelete = { bg = colors.red_dark, fg = colors.red },
    DiffChange = { bg = colors.blue_dark, fg = colors.blue_bright },
    DiffText = { bg = colors.blue_dark, fg = colors.blue_bright },

    GitSignsAdd = { fg = colors.green_bright },
    GitSignsChange = { fg = colors.gold },
    GitSignsDelete = { fg = colors.red },

    -- Mini
    MiniStatuslineDevinfo = { bg = colors.blue_neutral, fg = colors.slate },
    MiniStatuslineFileinfo = { bg = colors.blue_neutral, fg = colors.slate },
    MiniStatuslineLocation = { bg = colors.blue_neutral, fg = colors.slate },
    MiniStatuslineFilename = { bg = colors.blue_neutral, fg = colors.slate },
    MiniStatuslineModeNormal = { bg = colors.blue_neutral, fg = colors.slate },
    MiniStatuslineModeInsert = { bg = colors.green_teal, fg = colors.slate },
    MiniStatuslineModeVisual = { bg = colors.violet, fg = colors.slate },
    MiniStatuslineModeReplace = { bg = colors.red, fg = colors.slate },
    MiniStatuslineModeCommand = { bg = colors.gold, fg = colors.slate },
    MiniStatuslineInactive = { link = "StatusLineNc" },

    -- Completion menu
    CmpItemMenu = { bg = colors.red },
    CmpItemAbbrMatch = { fg = colors.green_opaque, bold = config.bold },
    CmpItemAbbrMatchFuzzy = { fg = colors.green_opaque, bold = config.bold },
    CmpItemKind = { fg = colors.green_bright },

    -- Blink.cmp
    BlinkCmpMenu = { bg = colors.black_opaque, fg = colors.slate },
    BlinkCmpMenuSelection = { bg = colors.blue_neutral, fg = colors.slate },
    BlinkCmpScrollBarThumb = { bg = colors.grey_neutral },
    BlinkCmpKindFunction = { fg = colors.slate },
    BlinkCmpKindMethod = { fg = colors.slate },
    BlinkCmpKindField = { fg = colors.slate },
    BlinkCmpMenuBorder = { fg = "NONE" },
    BlinkCmpScrollBarGutter = { bg = colors.black_opaque },
    BlinkCmpLabel = { fg = colors.slate },
    BlinkCmpLabelDeprecated = { fg = colors.grey_neutral, strikethrough = true },
    BlinkCmpLabelMatch = { fg = colors.slate, bold = config.bold },
    BlinkCmpLabelDetail = { fg = colors.green_opaque },
    BlinkCmpLabelDescription = { fg = colors.green_muted, italic = config.italic.comments },
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
    DiagnosticWarn = { fg = colors.yellow },
    DiagnosticInfo = { fg = colors.blue_light },
    DiagnosticHint = { fg = colors.gold },
    DiagnosticUnderlineError = { undercurl = config.undercurl, sp = colors.red },
    DiagnosticUnderlineWarn = { undercurl = config.undercurl, sp = colors.yellow },
    DiagnosticUnderlineInfo = { undercurl = config.undercurl, sp = colors.blue_light },
    DiagnosticUnderlineHint = { undercurl = config.undercurl, sp = colors.gold },
    DiagnosticVirtualTextError = { bg = colors.black, fg = colors.red },
    DiagnosticVirtualTextWarn = { bg = colors.black, fg = colors.yellow },
    DiagnosticVirtualTextInfo = { bg = colors.black, fg = colors.blue_light },
    DiagnosticVirtualTextHint = { bg = colors.black, fg = colors.gold },
    DiagnosticFloatingError = { fg = colors.red },
    DiagnosticFloatingWarn = { fg = colors.yellow },
    DiagnosticFloatingInfo = { fg = colors.blue_light },
    DiagnosticFloatingHint = { fg = colors.gold },
    DiagnosticSignError = { fg = colors.red },
    DiagnosticSignWarn = { fg = colors.yellow },
    DiagnosticSignInfo = { fg = colors.blue_light },
    DiagnosticSignHint = { fg = colors.gold },

    -- Treesitter
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

local function update_statusline()
  local augroup = vim.api.nvim_create_augroup("VantaStatusline", { clear = true })

  vim.api.nvim_create_autocmd({ "ModeChanged", "VimEnter" }, {
    group = augroup,
    callback = function()
      local mode = vim.fn.mode()
      local colors = require("vanta.colors").get()

      local mode_colors = {
        n = colors.blue_neutral, -- Normal
        i = colors.green_teal, -- Insert
        v = colors.violet, -- Visual
        V = colors.violet, -- Visual Line
        ["\22"] = colors.violet, -- Visual Block
        R = colors.red, -- Replace
        c = colors.gold, -- Command
        s = colors.violet, -- Select
        S = colors.violet, -- Select Line
        ["\19"] = colors.violet, -- Select Block
        t = colors.green_teal, -- Terminal
      }

      local bg_color = mode_colors[mode] or colors.blue_neutral

      vim.api.nvim_set_hl(0, "MiniStatuslineDevinfo", { bg = bg_color, fg = colors.slate })
      vim.api.nvim_set_hl(0, "MiniStatuslineFileinfo", { bg = bg_color, fg = colors.slate })
      vim.api.nvim_set_hl(0, "MiniStatuslineFilename", { bg = bg_color, fg = colors.slate })
      vim.api.nvim_set_hl(0, "MiniStatuslineLocation", { bg = bg_color, fg = colors.slate })
    end,
  })
end

update_statusline()

return M
