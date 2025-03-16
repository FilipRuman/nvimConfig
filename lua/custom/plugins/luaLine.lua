return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'horizon', -- "auto" will set the theme dynamically based on the colorscheme
        },
      }
    end,
  },
}
