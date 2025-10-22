local group = vim.api.nvim_create_augroup('autosave', {})

vim.api.nvim_create_autocmd('User', {
  pattern = 'AutoSaveWritePost',
  group = group,
  callback = function(opts)
    if opts.data.saved_buffer ~= nil then
      local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
      if filename ~= nil and filename ~= '' then -- do not write a message if the filename is empty
        vim.notify('AutoSave: saved ' .. filename .. ' at ' .. vim.fn.strftime '%H:%M:%S', vim.log.levels.INFO)
      end
    end
  end,
})

-- some recommended exclusions. you can use `:lua print(vim.bo.filetype)` to
-- get the filetype string of the current buffer
local excluded_filetypes = {
  -- this one is especially useful if you use neovim as a commit message editor
  'gitcommit',
  -- most of these are usually set to non-modifiable, which prevents autosaving
  -- by default, but it doesn't hurt to be extra safe.
  'NvimTree',
  'Outline',
  'TelescopePrompt',
  'alpha',
  'dashboard',
  'lazygit',
  'neo-tree',
  'oil',
  'prompt',
  'toggleterm',
}

local excluded_filenames = {
  'do-not-autosave-me.lua',
}

local function save_condition(buf)
  if vim.tbl_contains(excluded_filetypes, vim.fn.getbufvar(buf, '&filetype')) or vim.tbl_contains(excluded_filenames, vim.fn.expand '%:t') then
    return false
  end
  return true
end

return {
  'okuuva/auto-save.nvim',
  version = '*',
  cmd = 'ASToggle', -- optional for lazy loading on command
  event = { 'InsertLeave', 'TextChanged' },
  condition = save_condition,
  opts = {
    enabled = true,
    debounce_delay = 1000, -- ms delay before save
  },
}
