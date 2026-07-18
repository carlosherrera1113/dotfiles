return {
  'echasnovski/mini.nvim',
  config = function()
    local ai = require 'mini.ai'
    ai.setup {
      n_lines = 500,
      custom_textobjects = {
        F = ai.gen_spec.treesitter {
          a = '@function.outer',
          i = '@function.inner',
        },
      },
    }

    require('mini.surround').setup()
    require('mini.pairs').setup()
  end,
}
