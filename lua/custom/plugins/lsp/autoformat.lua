return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        'x',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = true,
      formatters = {
        csharpier = {
          command = 'dotnet-csharpier-config',
          args = { '$FILENAME', '--write-stdout' },
        },
      },
      formatters_by_ft = {
        cs = { 'csharpier' },
        lua = { 'stylua' },
        cpp = { 'clang-format' },
        nix = { 'alejandra' },
        rust = { 'rustfmt' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },
}
