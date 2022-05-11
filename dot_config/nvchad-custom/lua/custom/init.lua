require "custom.mappings"
require "custom.fonts"

vim.api.nvim_command([[
  autocmd BufWritePre * :%s/\s\+$//e
]])
