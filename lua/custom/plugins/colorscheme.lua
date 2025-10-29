return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    -- priority = 1000,
    ---@type solarized.config
    opts = {},
    -- config = function(_, opts)
    --   vim.o.termguicolors = true
    --   vim.o.background = 'light'
    --   require('solarized').setup(opts)
    --   vim.cmd.colorscheme 'solarized'
    -- end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false, -- load immediately
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false, -- load immediately
    priority = 1000, -- make sure it loads before other plugins
    config = function()
      require('gruvbox').setup {
        contrast = 'hard', -- "hard" = high contrast; "soft" = low; "medium" = default
        transparent_mode = false,
      }

      -- Apply the colorscheme
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },
}
