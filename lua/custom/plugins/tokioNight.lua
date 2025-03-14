return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require('tokyonight').setup {
        style = 'night', -- moon, night, (storm, day)
        transparent = false,
        styles = {
          -- dark, transparent or normal
          sidebars = 'transparent',
          floats = 'dark',
        },
        lualine_bold = true,
        on_colors = function(colors)
          colors.bg = '#13131c' -- Use the darker background of 'night' style.
          colors.comment = '#626784' -- Use a more gray comment.
        end,
      }
      vim.cmd 'colorscheme tokyonight-night'
    end,
  },
}
