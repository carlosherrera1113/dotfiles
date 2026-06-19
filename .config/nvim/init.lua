vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.loaded_python3_provider = 0
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'
require 'autocmds'
require 'lazy-bootstrap'

require('lazy').setup('plugins', require 'lazy-options')

-- vim: ts=2 sts=2 sw=2 et
