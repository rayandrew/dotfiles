local pluginConfs = require("custom.plugins.configs")

-- let g:neovide_input_use_logo=v:true

local M = {}

M.plugins = {

   options = {
      -- lspconfig = {
      --    setup_lspconf = "custom.plugins.lspconfig",
      -- },

      statusline = {
         separator_style = "round",
      },
   },

   override = {
     ["NvChad/nvterm"] = pluginConfs.nvterm,
   },

   -- user = userPlugins,
}

M.ui = {
   theme = "one_light",
}

return M
