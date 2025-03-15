return {
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {

        highlights = {
          -- Highlight groups to override, adding new groups is also possible
          -- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

          Comment = { fg = '#a1c639', italic = true },
        },
      }
      vim.cmd 'colorscheme cyberdream'
    end,
  },
}
