local function apply_marker_highlights()
  local highlights = {
    GitSignsAdd = '#7ee787',
    GitSignsChange = '#ffd866',
    GitSignsDelete = '#ff6b6b',
    GitSignsChangedelete = '#ffd866',
    GitSignsTopdelete = '#ff6b6b',
    GitSignsUntracked = '#7ee787',
    GitSignsStagedAdd = '#7ee787',
    GitSignsStagedChange = '#ffd866',
    GitSignsStagedDelete = '#ff6b6b',
    GitSignsStagedChangedelete = '#ffd866',
    GitSignsStagedTopdelete = '#ff6b6b',
    GitSignsStagedUntracked = '#7ee787',
  }

  for group, fg in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, { fg = fg, bold = true })
  end
end

return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk('next')
        end
      end, 'Next git hunk')

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk('prev')
        end
      end, 'Previous git hunk')

      map('n', '<leader>hp', gitsigns.preview_hunk, 'Preview git hunk')
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, 'Preview git hunk inline')
    end,
  },
  config = function(_, opts)
    require('gitsigns').setup(opts)
    apply_marker_highlights()

    vim.api.nvim_create_autocmd('ColorScheme', {
      group = vim.api.nvim_create_augroup('kickstart-gitsigns-highlights', { clear = true }),
      callback = function()
        vim.schedule(apply_marker_highlights)
      end,
    })
  end,
}
