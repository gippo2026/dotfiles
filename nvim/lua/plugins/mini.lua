return {
  { "nvim-mini/mini.pairs", opts = {} },
  { "nvim-mini/mini.surround", opts = {} },

  {
    "nvim-mini/mini.icons",
    lazy = true,
    opts = {},
    config = function(_, opts)
      local icons = require("mini.icons")
      icons.setup(opts)
      icons.mock_nvim_web_devicons()
    end,
  },
}
