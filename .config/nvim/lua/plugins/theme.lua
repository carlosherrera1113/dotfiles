return {
  'olimorris/onedarkpro.nvim',
  priority = 1000,
  config = function()
    require('onedarkpro').setup {
      highlights = {},
    }
    vim.cmd.colorscheme 'onedark'
  end,
}
