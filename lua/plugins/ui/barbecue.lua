return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  event = { "BufReadPost", "User FileOpened", "BufNewFile" },
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  --opts = {
    -- configurations go here
  --},
  config = function()
      require('barbecue.ui').toggle(true)
  end
}
