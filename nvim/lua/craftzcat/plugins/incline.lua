return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  dependencies = { "folke/tokyonight.nvim" },
  config = function()
    local colors = require("tokyonight.colors").setup()
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = colors.rainbow[3], guifg = colors.bg_dark },
          InclineNormalNC = { guifg = colors.fg_dark, guibg = colors.blue7 },
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
