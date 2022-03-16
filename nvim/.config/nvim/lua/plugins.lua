Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'L3MON4D3/LuaSnip'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'andweeb/presence.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'simrat39/rust-tools.nvim'
Plug 'mhinz/vim-startify'
Plug 'terrortylor/nvim-comment'
Plug 'jiangmiao/auto-pairs'
Plug('dracula/vim', {['as'] = 'dracula'})

vim.call 'plug#end'

require 'plugins.treesitter'
require 'plugins.cmp'
require'rust-tools'.setup{}
require'nvim_comment'.setup{
	line_mapping = '<C-_>'
}
