return {
  'JellyApple102/flote.nvim',
  keys = {
    {
      "<leader>s",
      "<cmd>Flote<CR>",
      desc = " Open notes Flote"
    }
  },
  event = { "VeryLazy" },
  enabled = true,
  opts = {
    q_to_quit = true,
    window_style = 'minimal',
    window_border = 'solid',
    window_title = true,
    notes_dir = vim.fn.stdpath('cache') .. '/flote',
    files = {
      global = 'flote-global.md',
      cwd = function()
        local bufPath = vim.api.nvim_buf_get_name(0)
        -- return vim.fn.getcwd()
        local cwd = require("lspconfig").util.root_pattern ".git" (bufPath)

        return cwd
      end,
      file_name = function(cwd)
        local base_name = vim.fs.basename(cwd)
        local parent_base_name = vim.fs.basename(vim.fs.dirname(cwd))
        return parent_base_name .. '_' .. base_name .. '.md'
      end
    }
  }
}
