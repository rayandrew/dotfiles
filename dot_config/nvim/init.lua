vim.g.did_load_filetypes = 1

-- require 'impatient'

local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local utils = require 'config.utils'
local opt = utils.opt
local autocmd = utils.autocmd
local map = utils.map

-- Leader/local leader
g.mapleader = [[ ]]
g.maplocalleader = [[,]]

o.clipboard = 'unnamedplus'

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  'gzip',
  'man',
  'matchit',
  'matchparen',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
}

for i = 1, 10 do
  g['loaded_' .. disabled_built_ins[i]] = 1
end

-- Settings
local buffer = { o, bo }
local window = { o, wo }
opt('textwidth', 100, buffer)
opt('scrolloff', 7)
opt('wildignore', '*.o,*~,*.pyc')
opt('wildmode', 'longest,full')
opt('whichwrap', vim.o.whichwrap .. '<,>,h,l')
opt('inccommand', 'nosplit')
opt('lazyredraw', true)
opt('showmatch', true)
opt('ignorecase', true)
opt('smartcase', true)
opt('tabstop', 2, buffer)
opt('softtabstop', 0, buffer)
opt('expandtab', true, buffer)
opt('shiftwidth', 2, buffer)
opt('number', true, window)
opt('relativenumber', true, window)
opt('smartindent', true, buffer)
opt('laststatus', 2)
opt('showmode', false)
opt('shada', [['20,<50,s10,h,/100]])
opt('hidden', true)
opt('shortmess', o.shortmess .. 'c')
opt('joinspaces', false)
opt('guicursor', [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
opt('updatetime', 500)
opt('conceallevel', 2, window)
opt('concealcursor', 'nc', window)
opt('previewheight', 5)
opt('undofile', true, buffer)
opt('synmaxcol', 500, buffer)
opt('display', 'msgsep')
opt('cursorline', true, window)
opt('modeline', false, buffer)
opt('mouse', 'nivh')
opt('signcolumn', 'yes:1', window)

-- Colorscheme
opt('termguicolors', true)
opt('background', 'dark')
-- cmd [[colorscheme gruvbox-material]]
-- cmd [[colorscheme dracula]]
-- cmd [[colorscheme challenger_deep]]

cmd [[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]]
cmd [[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]]
cmd [[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]]
cmd [[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]]
cmd [[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]]

-- Keybindings
local silent = { silent = true }

-- Disable annoying F1 binding
map('', '<f1>', '<cmd>FloatermToggle<cr>')

-- Basic Vim
map({ 'n', 'v' }, '<leader>d', '"_d')
map('v', '<leader>p', '"_dP')

-- Run a build
map('n', '<localleader><localleader>', '<cmd>Make<cr>', silent)

-- Quit, close buffers, etc.
map('n', '<leader>q', '<cmd>Sayonara<cr>', silent)
map('n', '<leader>qa', '<cmd>qa<cr>', silent)
map('n', '<leader>x', '<cmd>x!<cr>', silent)
-- map('n', '<leader>d', '<cmd>Sayonara<cr>', { silent = true, nowait = true })

-- A little Emacs in my Neovim
map('i', '<c-x><c-s>', '<esc><cmd>w<cr>a', silent)

-- DOOM Emacs
map('n', '<leader>fs', '<cmd>w<cr>', silent)
map('n', '<leader>bd', '<cmd>bd<cr>', silent) -- buffer delete 

---- Window
map('n', '<leader>ws', '<cmd>split<cr>', silent) -- split horizontal 
map('n', '<leader>wv', '<cmd>vsplit<cr>', silent) -- split vertical 
map('n', '<leader>wq', '<cmd>Sayonara<cr>')
-- map('n', '<leader>wq', '<c-w>q') -- quit
map('n', '<leader>wh', '<c-w>h') -- go to window left
map('n', '<leader>wj', '<c-w>j') -- go to window bottom 
map('n', '<leader>wk', '<c-w>k') -- go to window up 
map('n', '<leader>wl', '<c-w>l') -- go to window right 

map('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", silent)
map('n', '<leader>fb', "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", { silent = true, noremap = true })
map('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", silent)
map('n', '<leader>bb', "<cmd>lua require('telescope.builtin').buffers()<cr>", silent)
map('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", silent)

map('n', '<leader>z', '<cmd>ZenMode<cr>', silent)

-- Version control
map('n', 'gs', '<cmd>Neogit<cr>', silent)

-- map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', silent) -- find files
