return {
  {
    "stevearc/oil.nvim",
    lazy = true,
    cmd = "Oil",
    event = "VeryLazy",
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open Oil file explorer" },
    },
    opts = {
      default_file_explorer = true,
    },
    config = function()
      require("oil").setup({
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        constrain_cursor = "name",
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        win_options = {
          signcolumn = "yes",
          winblend = 10,
        },
        view_options = {
          show_hidden = true,
          natural_order = "fast",
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
          end,
        },
        keymaps = {
          ["\\"] = "actions.close",
          ["q"] = "actions.close",
          ["<C-CR>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
          ["<C-h>"] = false,
          ["<C-l>"] = false,
        },
        -- Floating window configuration
        float = {
          padding = 3,
          max_width = 100,
          max_height = 0,
          border = "rounded",
          win_options = {
            signcolumn = "yes",
            winblend = 10,
          },
          preview_split = "right",
          override = function(conf)
            return conf
          end,
        },
        git = {
          add = function(path)
            return true
          end,
          mv = function(src_path, dest_path)
            return true
          end,
          rm = function(path)
            return true
          end,
        },
      })
    end,
  },
  --extending-oil
  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    opts = {},
  },
  {
    "JezerM/oil-lsp-diagnostics.nvim",
    dependencies = { "stevearc/oil.nvim" },
    opts = {},
  },

  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    lazy = true,
    keys = {
      {
        "<leader>-",
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<c-up>",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    opts = {
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
}
