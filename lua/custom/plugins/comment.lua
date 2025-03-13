return {
  {
    --https://github.com/numToStr/Comment.nvim
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
      require('Comment').setup {
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
      }
    end,
  },
}
