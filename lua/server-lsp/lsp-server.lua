local config = require("config.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.phpactor.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "php" }
})

lspconfig.html.setup({

  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.cssls.setup({

  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.pylsp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {"python"},
})


lspconfig.jdtls.setup({
  capabilities = capabilities,
  on_attach = on_attach,

})

lspconfig.omnisharp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig.volar.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'vue', 'json' }
})
