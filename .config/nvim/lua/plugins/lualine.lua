local nerd = vim.g.have_nerd_font

return {
  'nvim-lualine/lualine.nvim',
  -- Filetype icons only make sense with a patched font; pull devicons only then.
  dependencies = nerd and { 'nvim-tree/nvim-web-devicons' } or {},
  config = function()
    require('lualine').setup {
      options = {
        theme = 'onedark',
        icons_enabled = nerd,
        -- Powerline arrows need a nerd font; fall back to plain dividers otherwise.
        component_separators = nerd and { left = '', right = '' } or { left = '│', right = '│' },
        section_separators = nerd and { left = '', right = '' } or { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
