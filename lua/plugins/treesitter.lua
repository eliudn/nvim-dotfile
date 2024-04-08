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
    local opts = require "config.tresitter"
    opts.ensure_installed = {
      "php",
      "phpdoc",
      "javascript",
      "typescript",
      "tsx",
      "python",
      "sql",
      "vue",
    }
    return opts
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
