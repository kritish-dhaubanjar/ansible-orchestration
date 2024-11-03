vim.opt.mouse = ""
vim.opt.list = true
vim.opt.wrap = true
vim.opt.updatetime = 50;
vim.opt.relativenumber = true;
vim.opt.fillchars = {
  vert = "▕", -- alternatives │
  fold = " ",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "╱", -- alternatives = ⣿ ░ ─
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

lvim.keys.normal_mode["<M-l>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<M-h>"] = ":BufferLineMovePrev<CR>"

-- lvim.colorscheme = "catppuccin" -- catppuccin catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
lvim.colorscheme = "catppuccin-mocha" -- catppuccin catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
lvim.transparent_window = false
lvim.builtin.terminal.open_mapping = "<c-t>"

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

lvim.plugins = {
  -- diffview
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  -- trouble.nvim
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- vim-surround
  {
    "tpope/vim-surround",

    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  -- vim-sanegx
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  -- todo-comments.nvim
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  -- git-blame
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  --- mini.map
  {
    "echasnovski/mini.map",
    branch = "stable",
    config = function()
      require('mini.map').setup()
      local map = require('mini.map')
      map.setup({
        symbols = {
          encode = map.gen_encode_symbols.dot('4x2'),
        }
      })
    end
  },
  -- nvim-ts-autotag
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- orgmode
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
    event = 'VeryLazy',
    config = function()
      -- Setup treesitter
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'org' },
        },
        ensure_installed = { 'org' },
      })

      -- Setup orgmode
      require('orgmode').setup({
        org_agenda_files = '~/kritish-dhaubanjar/org-archives/**/*',
        org_default_notes_file = '~/kritish-dhaubanjar/org-archives/refile.org',
      })
    end,
  }
}

-- mini.map
lvim.autocommands = {
  {
    { "BufEnter", "Filetype" },
    {
      desc = "Open mini.map and exclude some filetypes",
      pattern = { "*" },
      callback = function()
        local exclude_ft = {
          "qf",
          "NvimTree",
          "toggleterm",
          "TelescopePrompt",
          "alpha",
          "netrw",
        }

        local map = require('mini.map')
        if vim.tbl_contains(exclude_ft, vim.o.filetype) then
          vim.b.minimap_disable = true
          map.close()
        elseif vim.o.buftype == "" then
          map.open()
        end
      end,
    },
  },
}

-- telescope
lvim.builtin.telescope = {
  active = true,
  defaults = {
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.7,
    }
  }
}
