return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count
        local p = require("rose-pine.palette")
        local config = require("rose-pine.config")
        local bg_base = p.base
        if config.options.styles.transparency then
            bg_base = "NONE"
        end

        local rose_pine_theme = {
            normal = {
                a = { bg = p.rose, fg = p.base, gui = "bold" },
                b = { bg = p.overlay, fg = p.rose },
                c = { bg = bg_base, fg = p.text },
            },
            insert = {
                a = { bg = p.foam, fg = p.base, gui = "bold" },
                b = { bg = p.overlay, fg = p.foam },
                c = { bg = bg_base, fg = p.text },
            },
            visual = {
                a = { bg = p.iris, fg = p.base, gui = "bold" },
                b = { bg = p.overlay, fg = p.iris },
                c = { bg = bg_base, fg = p.text },
            },
            replace = {
                a = { bg = p.pine, fg = p.base, gui = "bold" },
                b = { bg = p.overlay, fg = p.pine },
                c = { bg = bg_base, fg = p.text },
            },
            command = {
                a = { bg = p.love, fg = p.base, gui = "bold" },
                b = { bg = p.overlay, fg = p.love },
                c = { bg = bg_base, fg = p.text },
            },
            inactive = {
                a = { bg = bg_base, fg = p.muted, gui = "bold" },
                b = { bg = bg_base, fg = p.muted },
                c = { bg = bg_base, fg = p.muted },
            },
        }

        -- configure lualine with modified theme
        lualine.setup({
        options = {
        theme = rose_pine_theme,
    },
        sections = {
            lualine_x = {
                {
                    lazy_status.updates,
                    cond = lazy_status.has_updates,
                    color = { fg = "#ff9e64" },
                },
                { "encoding" },
                { "fileformat" },
                { "filetype" },
            },
        },
    })
    end,
}
