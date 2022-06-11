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

  -- ["mg979/vim-visual-multi"] = {
  --   config = function()
  --     -- _G.VM_leader = {}
  --     vim.g.VM_maps = {}
  --     vim.g.VM_maps["Find Under"] = "<c-d>"
  --     vim.g.VM_maps["Find Subword Under"] = "<c-d>"
  --   end
  -- },

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
}
