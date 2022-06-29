return {
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },

  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("media_files")
    end,
  },

  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require("custom.plugins.truezen")
    end,
  },

  ["mg979/vim-visual-multi"] = {
    -- shamelessly copied from
    -- https://github.com/jceb/vimrc/blob/master/lua/plugins.lua
    opt = true,
    keys = {
      { "n", "<C-j>" },
      { "n", "<C-k>" },
      { "n", "<C-c>" },
      { "n", "<C-d>" },
      { "v", "<C-d>" },
    },
    setup = function()
      vim.cmd([[
      let g:VM_Mono_hl   = 'Substitute'
      let g:VM_Cursor_hl = 'IncSearch'
      ]])
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Next"] = "n",
        ["Previous"] = "N",
        ["Skip"] = "q",
        -- ["Add Cursor Down"] = "<C-j>",
        -- ["Add Cursor Up"] = "<C-k>",
        -- ["Select l"] = "<S-Left>",
        -- ["Select r"] = "<S-Right>",
        -- ["Add Cursor at Position"] = [[\\\]],
        ["Select All"] = "<C-c>",
        ["Visual All"] = "<C-c>",
        ["Exit"] = "<Esc>",
      }
      -- let g:VM_leader = {'default': '\', 'visual': '\', 'buffer': 'z'}
    end,
    -- config = function()
    --   -- _G.VM_leader = {}
    --
    --   vim.g.VM_maps = {}
    --   vim.g.VM_maps["Find Under"] = "<c-d>"
    --   vim.g.VM_maps["Find Subword Under"] = "<c-d>"
    -- end
  },

  ["nathom/filetype.nvim"] = {
    config = function()
      require("custom.plugins.filetype")
    end,
  },

  ["luukvbaal/stabilize.nvim"] = {
    config = function()
      require("stabilize").setup()
    end,
  },

  -- ["folke/which-key.nvim"] = {
  --   config = function()
  --     require("which-key").setup()
  --   end
  -- },

  ["francoiscabrol/ranger.vim"] = {
    setup = function()
      vim.g.ranger_map_keys = 0
    end,
  },

  ["TimUntersberger/neogit"] = {
    requires = "nvim-lua/plenary.nvim",
  },

  ["tpope/vim-fugitive"] = {
    cmd = {
      "Git",
    },
  },

  ["aserowy/tmux.nvim"] = {
    config = function()
      require("custom.plugins.tmux")
    end,
  },

  ["folke/trouble.nvim"] = {
    config = function()
      require("custom.plugins.trouble").setup()
    end,
  },

  ["nvim-treesitter/nvim-treesitter-context"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.treesitter-context")
    end,
  },

  ["kdheepak/lazygit.nvim"] = {},

  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    -- config = function()
    --   require("nvim-treesitter.configs").setup({
    --
    --   })
    -- end,
  },

  ["stevearc/dressing.nvim"] = {
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
    config = function()
      require("custom.plugins.dressing")
    end,
  },

  ["lambdalisue/suda.vim"] = {
    -- cmd = {
    --   "SudaWrite",
    --   "SudaRead",
    -- },
    config = function()
      vim.g.suda_smart_edit = 1
    end,
  },
}
