return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "folke/neodev.nvim",
  },
  config = function()
    require "config.lspconfig"
    require "server-lsp.lsp-server"
  end
}
