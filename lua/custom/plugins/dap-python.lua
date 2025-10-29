return {
  'mfussenegger/nvim-dap-python',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    -- Point to your neovim venv's python
    local dap_python = require 'dap-python'
    dap_python.setup '~/.config/nvim/venv/bin/python'

    -- Use project's venv for debugging
    dap_python.resolve_python = function()
      -- Check if project has .venv
      local cwd = vim.fn.getcwd()
      local venv_python = cwd .. '/.venv/bin/python'

      if vim.fn.filereadable(venv_python) == 1 then
        return venv_python
      end

      -- Fallback to neovim venv
      return '~/.config/nvim/venv/bin/python'
    end

    -- Keybindings
    vim.keymap.set('n', '<leader>dn', dap_python.test_method, { desc = '[D]ebug [N]earest test' })
    vim.keymap.set('n', '<leader>dc', dap_python.test_class, { desc = '[D]ebug test [C]lass' })
  end,
}
