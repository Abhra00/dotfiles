return {
  "rcarriga/nvim-notify",
  opts = {
    render = "default",
    stages = "fade_in_slide_out",
    fps = 120,
    timeout = 6000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    on_open = function(win)
      vim.api.nvim_win_set_config(win, { zindex = 100 })
    end,
    background_colour = "FloatShadow",
  },
  config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require("notify")
  end
}
