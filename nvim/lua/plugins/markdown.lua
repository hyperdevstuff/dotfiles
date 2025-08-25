return {
  {
    "OXY2DEV/markview.nvim",
    enabled = true,
    lazy = false,
    priority = 49,
    dependencies = {
      "saghen/blink.cmp",
    },
    opts = {
      preview = {
        modes = { "i", "n", "no", "c" },
        hybrid_modes = { "n", "i" },
        icon_provider = "mini",
        callbacks = {
          on_enable = function(_, win)
            vim.wo[win].conceallevel = 2
            vim.wo[win].concealcursor = "c"
          end,
        },
      },

      markdown = {
        headings = function()
          return require("markview.presets").headings.slanted
        end,
        horizontal_rules = function()
          return require("markview.presets").horizontal_rules.thin
        end,
        tables = function()
          return require("markview.presets").tables.rounded
        end,

        -- Enhanced block quotes for Obsidian callouts
        block_quotes = {
          default = { icon = "󰋼", hl_group = "MarkviewBlockQuoteDefault" },
          note = { icon = "󰋽", hl_group = "MarkviewBlockQuoteNote" },
          info = { icon = "󰋼", hl_group = "MarkviewBlockQuoteDefault" },
          todo = { icon = "", hl_group = "MarkviewBlockQuoteSpecial" },
          tip = { icon = "󰌶", hl_group = "MarkviewBlockQuoteOk" },
          success = { icon = "󰄴", hl_group = "MarkviewBlockQuoteOk" },
          question = { icon = "󰋗", hl_group = "MarkviewBlockQuoteSpecial" },
          warning = { icon = "󰀪", hl_group = "MarkviewBlockQuoteWarn" },
          failure = { icon = "󰅖", hl_group = "MarkviewBlockQuoteError" },
          danger = { icon = "󱃍", hl_group = "MarkviewBlockQuoteError" },
          bug = { icon = "", hl_group = "MarkviewBlockQuoteError" },
          example = { icon = "󰋀", hl_group = "MarkviewBlockQuoteNote" },
          quote = { icon = "󱆨", hl_group = "MarkviewBlockQuoteDefault" },
        },
      },

      markdown_inline = {
        internal_links = {
          enable = true,
          icon = "󰌹", -- A nice icon for internal links
        },
        checkboxes = {
          icons = {
            checked = { icon = "󰄴", hl_group = "MarkviewCheckboxChecked" },
            unchecked = { icon = "󰄱", hl_group = "MarkviewCheckboxUnchecked" },
            cancelled = { icon = "󰹴", hl_group = "MarkviewCheckboxCancelled" },
            progress = { icon = "󰡪", hl_group = "MarkviewCheckboxProgress" },
          },
        },
      },
    },

    config = function(_, opts)
      require("markview").setup(opts)

      -- === EXTRA MODULES SETUP ("THE GOOD STUFF") ===

      -- 1. Interactive Checkboxes
      require("markview.extras.checkboxes").setup()
      -- Keymap for interactive mode. In this mode, use h/j/k/l to cycle through states.
      vim.keymap.set("n", "<leader>ct", ":Checkbox interactive<CR>", {
        silent = true,
        desc = "Markview: Interactive Checkbox",
      })

      -- 2. Heading Level Changer
      require("markview.extras.headings").setup()
      -- Keymaps to increase/decrease heading level
      vim.keymap.set("n", "<leader>ch=", ":Heading increase<CR>", {
        silent = true,
        desc = "Markview: Increase Heading Level",
      })
      vim.keymap.set("n", "<leader>ch-", ":Heading decrease<CR>", {
        silent = true,
        desc = "Markview: Decrease Heading Level",
      })

      -- 3. Code Block Editor
      require("markview.extras.editor").setup()
      -- Keymap to open the code block editor in a floating window
      vim.keymap.set("n", "<leader>ce", ":EditCodeblock<CR>", {
        silent = true,
        desc = "Markview: Edit Code Block",
      })
    end,
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    -- ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    event = {
      "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Harsh's Space/*.md",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {},
  },
}
