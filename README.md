<h1 align="center" style="font-size: 3rem;">
vanta.nvim
</h1>

# Prerequisites

Neovim 0.8.0+

# Installing

## With `lazy.nvim`

```lua
{ "emanuel2718/vanta.nvim", priority = 1000 , config = true, opts = ... }
```

# Usage

In `init.lua`

```lua
vim.o.background = "dark"
vim.cmd([[colorscheme vanta]])
```
