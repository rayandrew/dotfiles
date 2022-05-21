local overrides = require "custom.plugins.overrides"
local userPlugins = require "custom.plugins"
local mappings = require "custom.mappings"

local M = {}

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },

    statusline = {
      separator_style = "round",
    },
  },

  override = {
    ["NvChad/nvterm"] = overrides.nvterm,
    ["kyazdani42/nvim-tree.lua"] = overrides.nvimtree,
    ["nvim-telescope/telescope.nvim"] = overrides.telescope,
  },

  user = userPlugins,
}

M.ui = {
  theme = "onedark",
}

M.mappings = mappings;

return M
