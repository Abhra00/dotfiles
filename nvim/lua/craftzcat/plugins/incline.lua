return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  config = function()
    local colors = require("base16-colorscheme").colors
    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = colors.base08, guifg = colors.base01 },
          InclineNormalNC = { guifg = colors.base01, guibg = colors.base09 },
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
