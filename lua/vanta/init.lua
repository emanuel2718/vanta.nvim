local Vanta = {}
local Config = require('vanta.config')
local Groups = require('vanta.groups')

---@param cfg VantaConfig
function Vanta.setup(cfg)
  Config.setup(cfg)
end

function Vanta.load()
  if vim.version().minor < 8 then
    vim.notify_once('vanta.nvim: you must use Neovim 0.8 or higher.')
    return
  end

  vim.g.colors_name = "vanta"
  vim.o.termguicolors = true

  for group, spec in pairs(Groups.get()) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

return Vanta
