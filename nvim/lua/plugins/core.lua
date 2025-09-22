return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "c",
        "rust",
        "http",
        "tsx",
        -- "latex",
        "json",
        "yaml",
        "bash",
        "regex",
        "typescript",
        "zig",
      })
      -- opts.incremental_selection.keymaps.init_selection = "<C-n>"
      -- opts.incremental_selection.keymaps.node_incremental = "<C-n>"
      -- opts.incremental_selection.keymaps.scope_incremental = "<A-n>"
    end,
  },
  {
    "mason-org/mason.nvim",
    version = "^2.0.0",
    opts = {
      ensure_installed = {
        "shellcheck",
        "shfmt",
      },
    },
  },
  {
    "folke/flash.nvim",
    jump = {
      {
        autojump = true,
      },
      label = {
        rainbow = {
          enabled = true,
          shade = 3,
        },
      },
      modes = {
        char = {
          jump_labels = true,
        },
      },
    },
  },
}
