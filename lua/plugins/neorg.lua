return {
  "nvim-neorg/neorg",
  version = "v7.0.0",       -- This is the important part!
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft ={"norg","md"},
  config = function()
    require("neorg").setup {
      load = {
        -- ["core.ui.calendar"] = {},
        -- ["core.tempus"] = {},
        ["core.defaults"] = {},  -- loads default behaviour
        ["core.concealer"] = {}, -- adds pretty icons to your documents
        ["core.journal"] = {},
        ["core.dirman"] = {      -- manages neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    }
  end,
  keys = {
    {
      "<leader>nn",
      "<cmd>Neorg keybind norg core.dirman.new.note<cr>",
      desc = "new note neorg"
    },
    {
      "<leader>ne",
      "<cmd>Neorg<cr>",
      desc = "show neorg"
    },
  }

}
