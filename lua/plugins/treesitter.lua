return {
  "nvim-treesitter/nvim-treesitter",
  dependecies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = "VeryLazy",
 -- event = { "BufReadPost", "BufNewFile"},
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = function()
    return require "config.tresitter"
  end,
  config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
  end,
}

