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

" LSP desteği için
Plug 'neovim/nvim-lspconfig'

" Otomatik tamamlama için
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'

" React/React Native
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

"Telescope.nvim
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-lua/plenary.nvim'

"Git Sign
Plug 'lewis6991/gitsigns.nvim'

"Prettier
Plug 'nvimtools/none-ls.nvim' " eski adı null-ls

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

" Git GUI benzeri panel
Plug 'TimUntersberger/neogit'

" Tema
Plug 'morhetz/gruvbox'

call plug#end()

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

-- LSP Ayarı
local lspconfig = require("lspconfig")
lspconfig.ts_ls.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
  end,
  filetypes = {"typescript", "typescriptreact", "javascript", "javascriptreact"},
  cmd = { "typescript-language-server", "--stdio" }
}

-- Otomatik tamamlama (cmp)
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
  }, {
    { name = 'buffer' },
  }),
  formatting = {
    format = require("lspkind").cmp_format({ maxwidth = 50 })
  },
})

-- null-ls (prettier)
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})
EOF

" -------------------------
" Kısayollar
" -------------------------
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>

"Ctrl+s ile kaydetmek icin
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Neogit açmak için
nnoremap <leader>gg :Neogit<CR>

"Blame toggle
nnoremap <leader>gb :lua require('gitsigns').toggle_current_line_blame()<CR>
nnoremap <leader>gp :lua require('gitsigns').preview_hunk()<CR>
nnoremap <leader>gs :lua require('gitsigns').stage_hunk()<CR>

" TODO yorumlarını hızlıca bulmak için
nnoremap <leader>td :TodoTelescope<CR>

