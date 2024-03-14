local M = {
  n = {
    ["gD"] = {
      function() vim.lsp.buf.declaration() end,"LSP declaration",
    },

    ["gd"] = {
      function() vim.lsp.buf.definition() end, "LSP definition",
    },-- Cambiar a telescope

    ["K"] = {
      function() vim.lsp.buf.hover() end, "LSP hover",
    },

    ["gi"] = {
      function() vim.lsp.buf.implementation() end, "LSP implementation",
    }, --Cambiar  con telescpoe

    ["<leader>ls"] = {
      function() vim.lsp.buf.signature_help() end, "LSP signature help",
    },

    ["<leader>D"] = {
      function() vim.lsp.buf.type_definition() end, "LSP definition type",
    },

    --[[["<leader>ra"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },]]

    ["<leader>ca"] = {
      function() vim.lsp.buf.code_action() end, "LSP code action",
    },

    ["gr"] = {
      function() vim.lsp.buf.references() end, "LSP references",
    },

    ["<leader>lf"] = {
      function() vim.diagnostic.open_float { border = "rounded" } end, "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>X"] = {
      function() vim.diagnostic.setloclist() end, "Diagnostic setloclist",
    },

    ["<leader>wa"] = {
      function() vim.lsp.buf.add_workspace_folder() end, "Add workspace folder",
    },

    ["<leader>wr"] = {
      function() vim.lsp.buf.remove_workspace_folder() end, "Remove workspace folder",
    },

    ["<leader>wl"] = {
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders",
    },
    ["<leader>fo"] = {
      function () vim.lsp.buf.format{async = true} end, "format"
    }
  },

  v = {
    ["<leader>ca"] = {
      function() vim.lsp.buf.code_action() end, "LSP code action",
    },
  },
}

return M
