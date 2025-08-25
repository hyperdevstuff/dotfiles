return {
  -- rest
  {
    "mistweaverco/kulala.nvim",
    keys = {
      { "<leader>rs", "<cmd>lua require('kulala').run()<cr>", desc = "Send the request from any file" },
      { "<leader>rd", "<cmd>lua require('kulala').scratchpad()<cr>", desc = "Open scratchpad" },
      { "<leader>rr", "<cmd>lua require('kulala').replay()<cr>", desc = "Replay the last request" },
    },
    opts = {

      kulala_keymaps = {
        ["Show verbose"] = {
          ">",
          function()
            require("kulala.ui").show_verbose()
          end,
        },
      },
      request_timeout = 5000,
      ui = {
        split_direction = "horizontal",
        default_winbar_panes = { "body", "headers", "headers_body", "verbose" },

        icons = {
          inlay = {
            loading = "",
            done = "󰄳 ",
            error = "⨯",
          },
          lualine = "🐨",
          textHighlight = "WarningMsg",
          lineHighlight = "Normal",
        },

        pickers = {
          snacks = {
            layout = function()
              local has_snacks, snacks_picker = pcall(require, "snacks.picker")
              return not has_snacks and {}
                or vim.tbl_deep_extend("force", snacks_picker.config.layout("telescope"), {
                  reverse = true,
                  layout = {
                    { { win = "list" }, { height = 1, win = "input" }, box = "vertical" },
                    { win = "preview", width = 0.6 },
                    box = "horizontal",
                    width = 0.8,
                  },
                })
            end,
          },
        },
        show_variable_info_text = "float",
      },
    },
  },
}
