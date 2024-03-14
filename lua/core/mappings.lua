local M      = {}

M.general    = {
  i = {
    -- Navegacion en modo insercion
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
    ["<C-l>"] = { "<Right>", "Move right" },
  },
  n = {
    ["<leader>w"] = { "<cmd> w <CR>", "Save file" },
    ["<leader>q"] = { "<cmd> q <CR>", "Quit file" },

    ["<leader>n"] = { "<cmd> set nu! <CR>", "Toggle line number" },
    ["<leader>rn"] = { "<cmd> set rnu! <CR>", "Toggle relative number" },

    -- Tab
    ["<A-tn>"] = { "<cmd> tabnew <CR>", "New tab" },
    ["<A-tq>"] = { "<cmd> tabclose <CR>", "Close tab" },
    ["<A-to>"] = { "<cmd> tabonly <CR>", "tab only" },
    ["<A-l>"] = { "<cmd> tabnext <CR>", "Next tab" },
    ["<A-h>"] = { "<cmd> tabprevious <CR>", "Previous tab" }
  },
  t = {
    ["<esc>"] = { "<C-\\><C-n>", "Exit mode term" }
  }
}
M.nvimtree   = require "core.mappings.nvimtree"
M.lspconfig  = require "core.mappings.lspconfig"
M.luasnip    = require "core.mappings.luasnip"
M.telescope  = require "core.mappings.telescope"
M.blankline  = require "core.mappings.blankline"
M.dap        = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" }
  }
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}
return M
