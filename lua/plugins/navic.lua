return {
  "SmiteshP/nvim-navic",
  dependecies = {
    "neovim/nvim-lspconfig",
  },
  event = "VeryLazy",
  --enabled = false,
  config = function()
    local navic = require("nvim-navic")
    vim.g.navic_silence = false
    --    local on_attach = function(client, bufnr)
    --    if client.server_capabilities.documentSymbolProvider then
    --      navic.attach(client, bufnr)
    --    end
    --    end
    local on_attach = function(client, bufnr)
      navic.attach(client, bufnr)
    end

    require("lspconfig").clangd.setup {
      on_attach = on_attach
    }
  end
}
