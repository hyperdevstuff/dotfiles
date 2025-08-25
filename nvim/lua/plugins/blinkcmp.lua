return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "mikavilpas/blink-ripgrep.nvim",
      "xzbdmw/colorful-menu.nvim",
      "marcoSven/blink-cmp-yanky",
      { "petertriho/cmp-git", opts = {} },
    },
    opts = {
      fuzzy = {
        implementation = "rust",
      },
      keymap = {
        preset = "default",
        ["<C-space>"] = false,
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<Up>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<Down>"] = { "select_next", "snippet_forward", "fallback" },
        ["<C-d>"] = { "show", "show_documentation", "hide_documentation" },
        ["<S-k>"] = { "scroll_documentation_up", "fallback" },
        ["<S-j>"] = { "scroll_documentation_down", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      sources = {
        compat = { "git" },
        default = {
          "lsp",
          "snippets",
          "buffer",
          "path",
          "yank",
          "ripgrep",
          -- "tmux",
        },
        providers = {
          lsp = {
            name = "lsp",
            enabled = true,
            module = "blink.cmp.sources.lsp",
            fallbacks = { "snippets", "buffer" },
            -- score_offset = 100,
          },
          path = {
            name = "Path",
            module = "blink.cmp.sources.path",
            fallbacks = { "lsp", "snippets", "buffer" },
            opts = {
              trailing_slash = false,
              label_trailing_slash = true,
              get_cwd = function(context)
                return vim.fn.expand(("#%d:p:h"):format(context.bufnr))
              end,
              show_hidden_files_by_default = true,
            },
          },
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            opts = {
              prefix_min_len = 3,
              project_root_marker = ".git",
              fallback_to_regex_highlighting = true,
            },

            transform_items = function(_, items)
              for _, item in ipairs(items) do
                item.labelDetails = item.labelDetails or {}
                item.labelDetails.description = "(rg)"
              end
              return items
            end,
          },
          yank = {
            name = "yank",
            module = "blink-yanky",
            opts = {
              minLength = 5,
              onlyCurrentFiletype = true,
              trigger_characters = { '"' },
              kind_icon = "󰅍",
            },
          },
          cmdline = {
            min_keyword_length = function(ctx)
              -- when typing a command, only show when the keyword is 3 characters or longer
              if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                return 2
              end
              return 0
            end,
          },
          git = {
            score_offset = -1,
          },
        },
      },

      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          border = "rounded", -- move to vim.o.winborder
          draw = {
            columns = {
              { "kind_icon" },
              { "label", gap = 1 },
              { "source_name" },
            },
            components = {
              label = {
                width = { fill = true, max = 60 },
                text = function(ctx)
                  local highlights_info = require("colorful-menu").blink_highlights(ctx)
                  if highlights_info ~= nil then
                    return highlights_info.label
                  else
                    return ctx.label
                  end
                end,
                highlight = function(ctx)
                  local highlights = {}
                  local highlights_info = require("colorful-menu").blink_highlights(ctx)
                  if highlights_info ~= nil then
                    highlights = highlights_info.highlights
                  end
                  for _, idx in ipairs(ctx.label_matched_indices) do
                    table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
                  end
                  -- Do something else
                  return highlights
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 1000,
          treesitter_highlighting = false,
          window = { border = "rounded" },
        },
      },
      cmdline = {
        enabled = true,
        sources = { "buffer", "cmdline" },
        keymap = {
          ["<Up>"] = { "select_prev" },
          ["<Down>"] = { "select_next" },
          ["<Tab>"] = { "show_and_insert", "accept" },
          ["<CR>"] = { "accept_and_enter", "fallback" },
        },
        completion = {
          menu = {
            auto_show = true,
          },
          ghost_text = { enabled = true },
        },
      },

      term = {
        enabled = true,
        keymap = { preset = "inherit" }, -- Inherits from top level `keymap` config when not set
        sources = {},
        completion = {
          trigger = {
            show_on_blocked_trigger_characters = {},
            show_on_x_blocked_trigger_characters = nil, -- Inherits from top level `completion.trigger.show_on_blocked_trigger_characters` config when not set
          },
          -- Inherits from top level config options when not set
          list = {
            selection = {
              -- When `true`, will automatically select the first item in the completion list
              preselect = nil,
              -- When `true`, inserts the completion item automatically when selecting it
              auto_insert = nil,
            },
          },
          -- Whether to automatically show the window when new completion items are available
          menu = { auto_show = true },
          -- Displays a preview of the selected item on the current line
          ghost_text = { enabled = true },
        },
      },
      signature = {
        enabled = true,
        window = {
          show_documentation = false,
        },
      },
    },
  },
}
