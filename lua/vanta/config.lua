local Config = {}

---@class ItalicsConfig
---@field strings boolean
---@field comments boolean
---@field operators boolean
---@field emphasis boolean
---@field folds boolean

---@class VantaConfig
---@field terminal_colors boolean?
---@field undercurl boolean?
---@field underline boolean?
---@field bold boolean?
---@field italic ItalicsConfig?
---@field dim_inactive boolean?
-- ---@field transparent boolean?
Config.values = {
  terminal_colors = true,
  undercurl       = true,
  underline       = true,
  bold            = true,
  italic          = {
    strings   = true,
    comments  = true,
    operators = false,
    emphasis  = true,
    folds     = true,
  },
  dim_inactive    = false,
  -- transparent     = false,
}

---@param opts VantaConfig
function Config.setup(opts)
  Config.values = vim.tbl_deep_extend('force', Config.values, opts or {})
end

return Config
