return {
  {
    'easymotion/vim-easymotion',
    opts = {},
    config = function()
      -- move to back of a world - search forward
      vim.cmd 'map <leader>b <Plug>(easymotion-w)'
      -- move to back of a world - search backwards
      vim.cmd 'map <leader>B <Plug>(easymotion-b)'

      -- move to front of a world - search forward
      vim.cmd 'map <leader>e <Plug>(easymotion-e)'
      -- move to front of a world - search backwards
      vim.cmd 'map <leader>E <Plug>(easymotion-ge)'
    end,
  },
}
