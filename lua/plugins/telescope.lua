return {
  "nvim-telescope/telescope.nvim",
  event = 'VeryLazy',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    "nvim-tree/nvim-web-devicons",
  },
  init = function ()
    require("core.util").load_mappings "telescope"
  end,
  opts = function ()
    return require "config.telescope.telescope"
  end,
  config = function (_, opts)
    local telescope = require("telescope")

    telescope.setup(opts)
    require("config.telescope.ui")
    telescope.load_extension("fzf")
  end
}
