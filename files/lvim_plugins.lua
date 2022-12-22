-- https://www.lunarvim.org/docs/plugins/extra-plugins 

lvim.plugins = {
  -- trouble.nvim
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
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
  -- diffview
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  -- vim-surround
  {
    "tpope/vim-surround",
    
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
      --  vim.o.timeoutlen = 500
    -- end
  },
}

vim.opt.mouse = ""
vim.opt.list = true
vim.opt.updatetime = 50
vim.opt.relativenumber = true

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
