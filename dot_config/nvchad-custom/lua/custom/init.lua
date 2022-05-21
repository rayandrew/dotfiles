require "custom.fonts"

local opt = vim.opt

vim.api.nvim_command([[
  autocmd BufWritePre * :%s/\s\+$//e
]])

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
