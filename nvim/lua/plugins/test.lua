-- super temporarily testing new plugins
return {
  {
    "tris203/hawtkeys.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = {
      customrMaps = {
        ["lazy"] = {
          method = "lazy",
        },
      },
    },
  },
  {
    "meznaric/key-analyzer.nvim",
    lazy = true,
    cmd = "KeyAnalyzer",
    opts = {},
  },
}
