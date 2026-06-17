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

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
