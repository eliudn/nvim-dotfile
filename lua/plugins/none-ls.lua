return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function()
    return require "server-lsp.none-ls"
  end,
  --[[ config = function (opts)
    require("null-ls").setup(opts)
  end ]]
}
