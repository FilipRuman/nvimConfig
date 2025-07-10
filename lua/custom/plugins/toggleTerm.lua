return {

  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[tt]],
        direction = 'float',
        float_opts = {
          border = 'curved',
          winblend = 10,
        },
      }
    end,
  },
}
