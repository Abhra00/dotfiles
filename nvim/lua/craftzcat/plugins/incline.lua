return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  dependencies = { "rose-pine/neovim", name = "rose-pine" },
  config = function()
    local colors = require("rose-pine.palette")
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = colors.love, guifg = colors.base },
          InclineNormalNC = { guifg = colors.base, guibg = colors.rose },
        },
      },
      window = { margin = { vertical = 0, horizontal = 1 } },
      hide = {
        cursorline = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
          filename = "[+] " .. filename
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        return { { icon, guifg = color }, { " " }, { filename } }
      end,
    })
  end,
}
