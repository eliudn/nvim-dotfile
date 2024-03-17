return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      opts = {

        history = true,

        -- This one is cool cause if you have dynamic snippets, it updatesas you type!
        updateevents = "TextChanged,TextChangedI",

        -- Autosnippets:
        enable_autosnippets = true,

      },
      config = function(_, opts)
        require("luasnip").config.set_config(opts)


        require("luasnip").filetype_extend("typescript", { "javascript" })
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }
      end
    },
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",
    "saadparwaiz1/cmp_luasnip",
    "windwp/nvim-autopairs",
    "onsails/lspkind.nvim",
  },
  event = "VeryLazy",
  main = "config.cmp",
  config = true,
  --[[ opts = function ()
    return require "config.cmp_opts"
  end,
  config = function ( _, opts)
    require("cmp").setup(opts)
  end, ]]
}
