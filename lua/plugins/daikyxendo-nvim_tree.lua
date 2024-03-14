return {
  "DaikyXendo/nvim-tree.lua",
  dependencies = {
    "DaikyXendo/nvim-material-icon"
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
}
