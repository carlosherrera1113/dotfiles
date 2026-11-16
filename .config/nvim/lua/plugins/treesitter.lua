return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'hcl', 'terraform', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'swift', 'vim', 'vimdoc' },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
}
