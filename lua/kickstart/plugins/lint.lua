return {
  --https://blog.productsway.com/c-spell-setup-in-neovim-a-comprehensive-guide
  {
    'mfussenegger/nvim-lint',
    event = 'VeryLazy',
    opts = {
      linters_by_ft = {
        ['*'] = {
          'cspell' --[[ , 'codespell' ]],
        }, -- Install with: pip install codespell
      },
    },
    config = function(_, opts)
      local lint = require 'lint'
      lint.linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
        callback = function()
          local names = lint._resolve_linter_by_ft(vim.bo.filetype)

          -- Create a copy of the names table to avoid modifying the original.
          names = vim.list_extend({}, names)

          -- Add fallback linters.
          if #names == 0 then
            vim.list_extend(names, lint.linters_by_ft['_'] or {})
          end

          -- Add global linters.
          vim.list_extend(names, lint.linters_by_ft['*'] or {})

          -- Run linters.
          if #names > 0 then
            -- Check if the linter is available, otherwise it will throw an error.
            for _, name in ipairs(names) do
              local cmd = vim.fn.executable(name)
              if cmd == 0 then
                vim.notify('Linter ' .. name .. ' is not available', vim.log.levels.INFO)
                return
              else
                -- Run the linter
                lint.try_lint(name)
              end
            end
          end
        end,
      })
      vim.keymap.set(
        'n',
        '<leader>z=',
        "<cmd>lua require('utils.cspell').add_word_to_c_spell_dictionary()<CR>",
        { noremap = true, silent = true, desc = 'Add unknown word to cspell dictionary' }
      )
    end,
  },
}
