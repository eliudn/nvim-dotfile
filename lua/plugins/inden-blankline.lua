return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = function ()
    return require("config.indent-blankline")
  end,
  --opts = {},
  config = function ()
    require("core.util").load_mappings "blankline"
    --  require("indent_blankline").setup()

    require("ibl").setup()
  end

}
