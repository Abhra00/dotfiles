function ColorMyNvim(color)
  color = color or "base16-gruvbox-material-dark-hard"
  vim.cmd.colorscheme(color)

  -- -- Set transparency for various highlights
  -- vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight NonText guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight LineNr guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight CursorLine guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight EndOfBuffer guibg=NONE ctermbg=NONE]])
  --
  -- -- Set transparency for Telescope highlights
  -- vim.cmd([[highlight TelescopeNormal guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight TelescopeBorder guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight TelescopePromptNormal guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight TelescopePromptBorder guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight TelescopeResultsNormal guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight TelescopeResultsBorder guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight TelescopePreviewNormal guibg=NONE ctermbg=NONE]])
  -- vim.cmd([[highlight TelescopePreviewBorder guibg=NONE ctermbg=NONE]])
end

return {
  {
    "RRethy/base16-nvim",
    config = function()
      ColorMyNvim()
    end,
  },
}
