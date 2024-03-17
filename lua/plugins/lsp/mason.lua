return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  opts = function()
    return require "config.mason"
  end,
  config = function(_, opts)
    require("mason").setup(opts)
    require("mason-lspconfig").setup({
      ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "phpactor",
        "sqlls",
        "yamlls",
        "jdtls",
        "omnisharp_mono",
        -- "prettierd",
      },
      automatic_installation = true
    })

    --[[vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})]]
  end

}
