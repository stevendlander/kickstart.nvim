return {
  -- This will merge with the existing telescope config
  'nvim-telescope/telescope.nvim',
  keys = {
    -- Add your custom telescope keybinds here
    { '<leader>rb', '<cmd>!black %<cr>', desc = '[R]un [B]lack' },
    { '<leader>sc', '<cmd>Telescope colorscheme<cr>', desc = '[S]earch [C]olorscheme' },
  },

  -- If you need to configure which-key groups
  dependencies = {
    {
      'folke/which-key.nvim',
      opts = function(_, opts)
        -- Ensure opts.spec exists
        opts.spec = opts.spec or {}

        -- Add your leader group documentation
        table.insert(opts.spec, {
          { '<leader>b', group = '[R]un', icon = '' },
        })

        return opts
      end,
    },
  },
}
