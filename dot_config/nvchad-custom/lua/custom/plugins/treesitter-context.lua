local present, context = pcall(require, "treesitter-context")

if not present then
  return
end

context.setup({
  enable = true,
})
