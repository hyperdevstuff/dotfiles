return {
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    -- priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard" -- soft, medium, hard
      vim.g.gruvbox_material_foreground = "material" -- material, mix, original
      vim.g.gruvbox_material_better_performance = true
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      -- vim.cmd.colorscheme("gruvbox-material")
      -- { ./../config/lazy.lua}
    end,
  },
  -- another testing colorscheme
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = true,
    -- { ./../config/lazy.lua}
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },
}
