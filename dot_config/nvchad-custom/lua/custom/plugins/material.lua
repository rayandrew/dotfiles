local present, material = pcall(require, "material")

if not present then
  return
end

material.setup({})
