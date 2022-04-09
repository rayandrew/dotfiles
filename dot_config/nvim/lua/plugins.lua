local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local packer = nil
local function init()
  if packer == nil then
    packer = require 'packer'
    packer.init { 
      disable_commands = true,
      display = {
        open_fn = function()
          return require("packer.util").float { border = "rounded" }
        end,
      },
    }
  end

  local use = packer.use
  packer.reset()

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'
  use 'nathom/filetype.nvim'

  -- Async building & commands
  use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

  -- Registers
  -- use 'junegunn/vim-peekaboo'

  use 'mhinz/vim-sayonara'

  -- Git
  use {
    { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = false },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('config.gitsigns')]],
    },
    { 'TimUntersberger/neogit', cmd = 'Neogit', config = [[require('config.neogit')]] },
  }

  -- Highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'ChristianChiarulli/nvim-ts-rainbow',
      'nvim-treesitter/playground',
      'windwp/nvim-ts-autotag',
      'romgrk/nvim-treesitter-context',
      'mizlan/iswap.nvim',
    },
    run = ':TSUpdate',
  }

  -- Undo tree
  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
  }

  -- Search
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
        'nvim-telescope/telescope-file-browser.nvim'
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      setup = [[require('config.telescope_setup')]],
      config = [[require('config.telescope')]],
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }

  -- Zen
  use {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup {
        window = {
          options = {
            signcolumn = 'no', -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            cursorline = false, -- disable cursorline
            cursorcolumn = false, -- disable cursor column
            foldcolumn = "0", -- disable fold column
            list = false, -- disable whitespace characters
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false, -- disables the ruler text in the cmd line area
            showcmd = false, -- disables the command in the last line of the screen
          },
          tmux = { enabled = true },
          twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
          gitsigns = { enabled = true }, -- disables git signs
        },
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      'lukas-reineke/cmp-under-comparator',
      { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
    },
    config = [[require('config.cmp')]],
    event = 'InsertEnter *',
  }

  -- LSP
  use {
    { 
      'neovim/nvim-lspconfig',
      -- config = function()
      
        -- require('lspconfig').pyright.setup{}
        -- require('lspconfig').sumneko_lua.setup{}
      -- end,
    }, -- enable LSP
    { 
      'williamboman/nvim-lsp-installer', -- simple to use language server installer
      after = 'nvim-lspconfig',
      config = [[require('config.lsp')]],
    },
    'tamago324/nlsp-settings.nvim', -- language server settings defined in json for
    'jose-elias-alvarez/null-ls.nvim', -- for formatters and linters
    'filipdutescu/renamer.nvim',
    'simrat39/symbols-outline.nvim',
    'ray-x/lsp_signature.nvim',
    'b0o/SchemaStore.nvim',
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
  }

  -- Commenter
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  } 

  -- use { 
  --   'terrortylor/nvim-comment',
  --   config = function ()
  --     require('nvim_comment').setup()
  --   end
  -- }

  -- Multi cursor
  use {
    'mg979/vim-visual-multi'
  }
  
  -- Dracula
  -- use {'dracula/vim', as = 'dracula'}

  -- Challenger Deep
  use {
    'challenger-deep-theme/vim', 
    as = 'challenger-deep'
  }

  -- Tmux integration
  use {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup({
        -- overwrite default configuration
        -- here, e.g. to enable default bindings
        copy_sync = {
          -- enables copy sync and overwrites all register actions to
          -- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
          enable = true,
        },
        navigation = {
          -- enables default keybindings (C-hjkl) for normal mode
          enable_default_keybindings = true,
        },
        resize = {
          -- enables default keybindings (A-hjkl) for normal mode
          enable_default_keybindings = true,
        }
      })
    end
  }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
