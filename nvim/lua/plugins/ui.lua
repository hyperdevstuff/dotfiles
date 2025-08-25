return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options = vim.tbl_deep_extend("keep", opts.options or {}, {
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      })

      if opts.extensions then
        local new_extensions = { "oil", "mason", "nvim-dap-ui", "quickfix", "man", "assistant", "ctrlspace" }
        for _, ext in ipairs(new_extensions) do
          if not vim.tbl_contains(opts.extensions, ext) then
            table.insert(opts.extensions, ext)
          end
        end
      end

      if opts.sections then
        if opts.sections.lualine_a then
          opts.sections.lualine_a[1] = {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          }
        end
        if opts.sections.lualine_y then
          opts.sections.lualine_y = {
            { "location", padding = { left = 0, right = 1 } },
            { "searchcount", maxcount = 999, timeout = 500 },
          }
        end
        if opts.sections.lualine_z then
          opts.sections.lualine_z = {
            { "progress", separator = "", padding = { left = 1, right = 1 } },
          }
        end
      end
    end,
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = { min_width = 35 },
    },
  },
  {

    "folke/noice.nvim",
    opts = {
      presets = {
        bottom_search = false,
      },
    },
  },
}
