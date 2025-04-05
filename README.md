<h1 align="center" style="font-size: 6rem;">
vanta.nvim
</h1>

<p align="center">
    <a href="#install">Install</a>
    ·
    <a href="#usage">Usage</a>
    ·
    <a href="#configuration">Configuration</a>
    ·
    <a href="#looks">Looks</a>
  </p>
</p>

# Prerequisites

Neovim 0.8.0+

# Install

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{ "emanuel2718/vanta.nvim", priority = 1000, config = true, opts = ...  }
```

[mini.deps](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-deps.md)

```lua
add({ source = "emanuel2718/vanta.nvim", name = "vanta" })
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "emanuel2718/vata.nvim", as = "vanta" }
```

[vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'emanuel2718/vanta.nvim', { 'as': 'vanta' }
```

# Usage

```vim
" vim
colorscheme vanta
```

```lua
-- neovim
vim.cmd.colorscheme "vanta"
```

# Configuration

```lua
require("vanta").setup({
  -- Enable terminal colors (recommended)
  terminal_colors = true,

  -- Style options
  undercurl = false,  -- Use undercurls for diagnostics and spellcheck
  underline = false,  -- Use underlines for references and matching words
  bold = true,        -- Use bold for headings, keywords, and UI elements

  -- Window appearance
  dim_inactive = false,  -- Dim text in inactive windows
  transparent = false,   -- Use transparent backgrounds

  -- Italic options
  italic = {
    string = false,    -- Italicize strings
    operator = false,  -- Italicize operators
    emphasis = false,  -- Italicize emphasized text
    comment = true,    -- Italicize comments
    folds = true,      -- Italicize fold markers
  },
})
```

# Looks

### Idle

<img width="1277" alt="Image" src="https://github.com/user-attachments/assets/fbe3c520-2a10-4bfa-aacc-f143bbc021fe" />

### Completions

<img width="1276" alt="Image" src="https://github.com/user-attachments/assets/0b664374-28ba-4008-b7d1-695a9f9b367f" />
