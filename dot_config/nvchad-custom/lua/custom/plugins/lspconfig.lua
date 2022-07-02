local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require("lspconfig")

  local servers = {
    ["html"] = true,
    ["cssls"] = true,
    ["bashls"] = true,
    ["emmet_ls"] = true,
    ["tsserver"] = false,
    ["clangd"] = true,
    ["solargraph"] = true,
    ["tailwindcss"] = true,
    ["pyright"] = true,
    ["sumneko_lua"] = false,
    ["eslint"] = true,
    ["svelte"] = false,
    ["jsonls"] = true,
  }

  for lsp, format in pairs(servers) do
    if not format then
      lspconfig[lsp].setup({
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false
          attach(client, bufnr)
        end,
        capabilities = capabilities,
      })
    else
      lspconfig[lsp].setup({
        on_attach = attach,
        capabilities = capabilities,
      })
    end
  end
end

return M
