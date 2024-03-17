local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
require("null-ls").setup({ debug = true })
local null_ls = require("null-ls")
local b = null_ls.builtins

local opts = {
  sources = {
    b.diagnostics.djlint,
    b.diagnostics.phpstan,
    b.formatting.phpcsfixer,
    b.diagnostics.mypy,
    b.formatting.black,
    b.formatting.prettierd,
    require("none-ls.diagnostics.ruff"),
    -- require("none-ls.diagnostics.curlylint"),

    -- b.formatting.djint,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end,
  -- debug = true
}

return opts
