" -------------------------
" Genel Ayarlar
" -------------------------
set number
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
filetype plugin indent on
set clipboard=unnamedplus
set mouse=a
set hidden
set noswapfile
set termguicolors
set background=dark

let mapleader = " "

"-------------------------
" Plug Eklentileri
" -------------------------
call plug#begin('~/.config/nvim/plugged')

" UI & Navigasyon
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" Tamamlama ve snippet'lar
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" React/React Native
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"Telescope.nvim
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-lua/plenary.nvim'

"Git Sign
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'

"Emmet
Plug 'mattn/emmet-vim'

"Comment
Plug 'numToStr/Comment.nvim'

"Which Key
Plug 'folke/which-key.nvim'

"Lsp otomatik tamamlanan ikonlar
Plug 'onsails/lspkind-nvim'

" Renk gösterici
Plug 'norcalli/nvim-colorizer.lua'

" TODO / FIXME yorumlarını vurgulayan eklenti
Plug 'folke/todo-comments.nvim'
Plug 'nvim-lua/plenary.nvim'  " bağımlılığı

" Git GUI benzeri panel
Plug 'TimUntersberger/neogit'
Plug 'nvim-lua/plenary.nvim'  " bu zaten varsa tekrar yazmana gerek yok


" Tema
Plug 'morhetz/gruvbox'

call plug#end()


"Prettier
autocmd BufWritePre *.tsx,*.ts,*.js,*.jsx,*.json,*.css,*.md :silent! !prettier --write %

" -------------------------
" Tema & UI Ayarları
" -------------------------
colorscheme gruvbox

lua << EOF
require('lualine').setup()
require('nvim-tree').setup()
require('telescope').setup()
require('gitsigns').setup()
require('Comment').setup()
require("which-key").setup()
require('colorizer').setup()
require("todo-comments").setup()
require("neogit").setup()
EOF

" -------------------------
" LSP (tsserver)
" -------------------------
lua << EOF
local lspconfig = require("lspconfig")

lspconfig.tsserver = nil  -- tsserver kullanımını pasifleştir
lspconfig.ts_ls.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end
})

EOF

" -------------------------
" cmp Ayarları (Otomatik Tamamlama)
" -------------------------
lua << EOF
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }),
formatting = {
  format = require("lspkind").cmp_format({ maxwidth = 50 })
}

})
EOF

" -------------------------
" Kısayollar
" -------------------------
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
" Neogit açmak için
nnoremap <leader>gg :Neogit<CR>

" TODO yorumlarını hızlıca bulmak için
nnoremap <leader>td :TodoTelescope<CR>

" Format on save for JS, TS, JSX, TSX, JSON, CSS, Markdown
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.md silent! execute '!prettier --write ' . shellescape(@%)

