local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  -- b.formatting.deno_fmt,
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "astro" } },

  -- js/ts/jsx/tsx
  -- b.formatting.prettier,
  b.formatting.prettierd,
  b.formatting.eslint_d,
  b.code_actions.eslint_d,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with({ extra_args = { "--global vim" } }),

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

  -- cpp
  b.formatting.clang_format,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local M = {}

M.setup = function()
  null_ls.setup({
    debug = true,
    sources = sources,
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
            vim.lsp.buf.formatting_sync()
          end,
        })
      end
    end,
  })
end

return M
