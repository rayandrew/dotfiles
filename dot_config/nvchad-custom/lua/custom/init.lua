require("custom.fonts")

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*",
  command = ":%s/s+$//e",
})

vim.wo.relativenumber = true
-- vim.wo.colorcolumn = "120"

-- vim.api.nvim_command([[
--   autocmd BufWritePre * :%s/\s\+$//e
--
--   :set relativenumber
--   :set rnu
-- ]])

-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
