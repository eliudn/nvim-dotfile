return {
  "mfussenegger/nvim-dap",
  config = function ()
    require("core.util").load_mappings("dap")
  end
}
