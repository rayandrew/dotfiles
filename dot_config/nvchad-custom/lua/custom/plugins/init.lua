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
      require("telescope").load_extension "media_files"
    end,
  },

  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  -- ["mg979/vim-visual-multi"] = {
  --   config = function()
  --     -- _G.VM_leader = {}
  --     vim.g.VM_maps = {}
  --     vim.g.VM_maps['Find Under'] = "<c-d>"
  --     vim.g.VM_maps['Find Subword Under'] = "<c-d>"
  --   end
  -- },

  ["nathom/filetype.nvim"] = {
    config = function()
      require "custom.plugins.filetype"
    end,
  },

  ["luukvbaal/stabilize.nvim"] = {
    config = function()
      require("stabilize").setup()
    end
  },

  ["folke/which-key.nvim"] = {
    config = function()
      require("which-key").setup()
    end
  },

  --
  -- ["francoiscabrol/ranger.vim"] = {
  -- },
  --
  -- ["mcchrish/nnn.vim"] = {
  --   config = function()
  --     vim.g.nnn = {}
  --     vim.g.nnn["set_default_mappings"] = 0
  --   end
  -- },

  ["kevinhwang91/rnvimr"] = {
    cmd = { "RnvimrToggle" },
    setup = function()
      require("custom.plugins.rnvimr").setup()
    end
  }
}
