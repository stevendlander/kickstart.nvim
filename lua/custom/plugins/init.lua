-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'tpope/vim-fugitive',
  {
    'easymotion/vim-easymotion',
    config = function()
      vim.keymap.set('n', '<leader>ef', '<Plug>(easymotion-overwin-f2)', { desc = '[E]asy Motion move [F]orward' })
    end,
  },
}
