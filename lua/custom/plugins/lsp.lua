-- Run ruff on python files
-- return {
--   {
--     'neovim/nvim-lspconfig',
--     opts = {
--       servers = {
--         ruff = {
--           cmd = { 'ruff', 'server' },
--           filetypes = { 'python' },
--         },
--       },
--     },
--   },
-- }

return {
  'neovim/nvim-lspconfig',
  config = function()
    vim.lsp.enable 'ruff'
  end,
}
