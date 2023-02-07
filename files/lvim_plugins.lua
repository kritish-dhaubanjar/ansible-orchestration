-- add your own keymapping
lvim.keys.normal_mode["<M-l>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<M-h>"] = ":BufferLineMovePrev<CR>"

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
  {
    "nvim-treesitter/nvim-treesitter"
  },
  {
    "nvim-orgmode/orgmode",
    require('orgmode').setup_ts_grammar(),

    -- Treesitter configuration
    require('nvim-treesitter.configs').setup {
      -- If TS highlights are not enabled at all, or disabled via `disable` prop,
      -- highlighting will fallback to default Vim syntax highlighting
      highlight = {
        enable = true,
        -- Required for spellcheck, some LaTex highlights and
        -- code block highlights that do not have ts grammar
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' }, -- Or run :TSUpdate org
    },

    require('orgmode').setup({
      org_agenda_files = { '~/Dropbox/org/*', '~/my-orgs/**/*' },
      org_default_notes_file = '~/Dropbox/org/refile.org',
    })
  }
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

lvim.transparent_window = true
lvim.builtin.terminal.open_mapping = "<c-t>"
