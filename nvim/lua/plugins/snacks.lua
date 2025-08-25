return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
    },
    notifier = {
      timeout = 2500,
      width = { min = 40, max = 0.9 },
      height = { min = 1, max = 0.9 },
      top_down = false,
    },
    picker = {
      sources = {
        explorer = {
          layout = { layout = { position = "right" } },
        },
      },
    },
    dashboard = {
      preset = {
        header = [[

            ██╗      ██████╗  ██████╗██╗  ██╗    ██╗███╗   ██╗          
            ██║     ██╔═══██╗██╔════╝██║ ██╔╝    ██║████╗  ██║          
            ██║     ██║   ██║██║     █████╔╝     ██║██╔██╗ ██║          
            ██║     ██║   ██║██║     ██╔═██╗     ██║██║╚██╗██║          
            ███████╗╚██████╔╝╚██████╗██║  ██╗    ██║██║ ╚████║          
            ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝    ╚═╝╚═╝  ╚═══╝          
          ]],
      },
    },
  },
  keys = {
    -- Top Pickers & Explorer
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers({ layout = { preset = "right", preview = "main" } })
        --Snacks.picker.buffers({ layout = { preset = "ivy", preview = "main" } })
      end,
      desc = "Buffers",
    },
    { "<leader>n", false },
  },
}
