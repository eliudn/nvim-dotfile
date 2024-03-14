 return {
 --[[ "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    require("core.util").load_mappings "nvimtree"
  end,
  opts = function()
    return require "config.nvimtree"
  end,
  config = function(_,opts)
    require("nvim-tree").setup(opts)
  end,
  enabled = false,]]
}
