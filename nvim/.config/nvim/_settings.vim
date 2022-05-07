set number number
set mouse=a
set tabstop=2
set shiftwidth=2

set ma
set clipboard=unnamed

colorscheme dracula

hi Normal guibg=NONE ctermbg=NONE

lua require'lspconfig'.rust_analyzer.setup{}




"===NERDTree===
"auto start NERDTree
autocmd VimEnter * NERDTree | wincmd p

"auto close NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"===Completion===
set completeopt=menuone,noinsert,noselect
set shortmess+=c

lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

"===Startify===
" start header
let g:startify_custom_header = [
\ '     ____    _    __  __ _____ _ __     _____ __  __  ',
\ '    / ___|  / \  |  \/  | ____| |\ \   / /_ _|  \/  | ',
\ '   | |     / _ \ | |\/| |  _| | | \ \ / / | || |\/| | ',
\ '   | |___ / ___ \| |  | | |___| |__\ V /  | || |  | | ',
\ '    \____/_/   \_\_|  |_|_____|_____\_/  |___|_|  |_| ',
\ '                 ,,__                                 ',
\ '       ..  ..   / o._)                                ',   
\ '      /--`/--\  \-`|                                  ',       
\ '     /        \_/ /                                   ',     
\ '   .`\  \__\  __.`                                    ',     
\ '     )\ |  )\ |                                       ',   
\ '    // \\ // \\                                       ',
\ '   ||_  \\|_  \\_                                     ',
\ '   `--` `--`` `--`                                    ',
\ ]