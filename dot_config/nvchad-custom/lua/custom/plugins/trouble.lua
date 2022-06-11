local present, trouble = pcall(require, "trouble")

if not present then
  return
end

local M = {}

M.setup = function()
  trouble.setup({})
end

return M
