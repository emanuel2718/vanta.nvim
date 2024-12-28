<h1 align="center" style="font-size: 3rem;">
vanta.nvim
</h1>

# 🚧 Work in Progress 🚧

This colorscheme is currently in active development and contains only the minimal requirements to make it usable for *my* daily editing.

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
