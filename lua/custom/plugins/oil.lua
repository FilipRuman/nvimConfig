-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    config = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'OilEnter',
        callback = vim.schedule_wrap(function(args)
          local oil = require 'oil'
          if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
            oil.open_preview()
          end
        end),
      })
      require('oil').setup {
        win_options = {
          winbar = "%!v:lua.get_oil_winbar()",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        lsp_file_methods = {
          -- Enable or disable LSP file operations
          enabled = true,
          -- Time to wait for LSP file operations to complete before skipping
          timeout_ms = 1000,
          -- Set to true to autosave buffers that are updated with LSP willRenameFiles
          -- Set to "unmodified" to only save unmodified buffers
          autosave_changes = false,
        },
        keymaps = {
          ['<C-s>'] = false,
          ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
          ['<C-t>'] = { 'actions.select', opts = { tab = true } },
          ['<C-p>'] = false,
          ['<CR>'] = 'actions.select',
          ['-'] = { 'actions.parent', mode = 'n' },
          ['_'] = { 'actions.open_cwd', mode = 'n' },
          ['`'] = { 'actions.cd', mode = 'n' },
          ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
          ['gs'] = { 'actions.change_sort', mode = 'n' },
          ['gx'] = 'actions.open_external',
          ['g.'] = { 'actions.toggle_hidden', mode = 'n' },
          ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
        },
        columns = {
          "icon",
          -- "permissions",
         -- "size",
          -- "mtime",
        },
        view_options ={
            -- Show files and directories that start with "."
            show_hidden =false,
 is_hidden_file = function(name, bufnr)
      return  string.find(name,".uid")or string.find(name,".old")or string.find(name,".import")
    end,
          }, 
      }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
}
