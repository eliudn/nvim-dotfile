return {
  {
    "vhyrro/luarocks.nvim",
    config = function()
      require("luarocks").setup({})
    end,
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "luarocks.nvim",
      "nvim-telescope/telescope.nvim",
    },
    ft = "http",
    config = function()
      local rest_nvim = require "rest-nvim"

      rest_nvim.setup({
        client = "curl",
        env_file = ".env",
        env_pattern = "\\.env$",
        env_edit_command = "tabedit",
        encode_url = true,
        skip_ssl_verification = false,
        custom_dynamic_variables = {},
        logs = {
          level = "info",
          save = true,
        },
        result = {
          split = {
            horizontal = false,
            in_place = false,
            stay_in_current_window_after_split = true,
          },
          behavior = {
            decode_url = true,
            show_info = {
              url = true,
              headers = true,
              http_info = true,
              curl_command = true,
            },
            statistics = {
              enable = true,
              ---@see https://curl.se/libcurl/c/curl_easy_getinfo.html
              stats = {
                { "total_time",      title = "Time taken:" },
                { "size_download_t", title = "Download size:" },
              },
            },
            formatters = {
              json = "jq",
              html = function(body)
                if vim.fn.executable("tidy") == 0 then
                  return body, { found = false, name = "tidy" }
                end
                local fmt_body = vim.fn.system({
                  "tidy",
                  "-i",
                  "-q",
                  "--tidy-mark", "no",
                  "--show-body-only", "auto",
                  "--show-errors", "0",
                  "--show-warnings", "0",
                  "-",
                }, body):gsub("\n$", "")

                return fmt_body, { found = true, name = "tidy" }
              end,
            },
          },
        },
        keybinds = {
          {
            "<leader>hn", "<cmd>Rest run<cr>", "Run request under the cursor",
          },
          {
            "<leader>hl", "<cmd>Rest run last<cr>", "Re-run latest request",
          },
        },
        highlight = {
          enable = true,
          timeout = 750,
        },
      })
      -- first load extension telescope
      require("telescope").load_extension("rest")
      -- then use it, you can also use the `:Telescope rest select_env` command
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",
        callback = function()
          local buff = tonumber(vim.fn.expand "<abuf>", 10)
          vim.keymap.set(
            "n",
            "<leader>he",
            function()
              require("telescope").extensions.rest.select_env()
            end,
            { noremap = true, buffer = buff, desc = "select env" }
          )
        end,
      })
    end
  }
}
--[[
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",
        callback = function()
          local buff = tonumber(vim.fn.expand "<abuf>", 10)
          vim.keymap.set(
            "n",
            "<leader>hn",
            rest_nvim.run,
            { noremap = true, buffer = buff, desc = "Run near http request" }
          )
          vim.keymap.set(
            "n",
            "<leader>hl",
            rest_nvim.last,
            { noremap = true, buffer = buff, desc = "Run last http resquest" }
          )
          vim.keymap.set("n", "<leader>hp", function()
            rest_nvim.run(true)
          end, { noremap = true, buffer = buff, desc = "Preview http curl" })
        end,
      }) ]]
