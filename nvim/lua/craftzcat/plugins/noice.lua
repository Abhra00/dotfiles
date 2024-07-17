return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
          },
        },
        view = "mini",
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
      inc_rename = true,
    },
  },

  config = function(_, opts)
    require("noice").setup(opts)
    if vim.o.filetype == "lazy" then
      vim.cmd([[messages clear]])
    end

    -- Keymaps
    local keymap = vim.keymap -- for conciseness
    local noice = require("noice") -- for cociseness

    keymap.set("n", "<leader>sn", "", { desc = "+noice" })
    keymap.set("c", "<S-Enter>", function() noice.redirect(vim.fn.getcmdline()) end, { desc = "Redirect Cmdline" })
    keymap.set("n", "<leader>snl", function() noice.cmd("last") end, { desc = "Noice Last Message" })
    keymap.set("n", "<leader>snh", function() noice.cmd("history") end, { desc = "Noice History" })
    keymap.set("n", "<leader>sna", function() noice.cmd("all") end, { desc = "Noice All" })
    keymap.set("n", "<leader>snd", function() noice.cmd("dismiss") end, { desc = "Dismiss All" })
    keymap.set("n", "<leader>snt", function() noice.cmd("pick") end, { desc = "Noice Picker (Telescope/FzfLua)" })
    keymap.set({ "i", "n", "s" }, "<c-f>", function() if not noice.lsp.scroll(4) then return "<c-f>" end end, { silent = true, expr = true, desc = "Scroll Forward" })
    keymap.set({ "i", "n", "s" }, "<c-b>", function() if not noice.lsp.scroll(-4) then return "<c-b>" end end, { silent = true, expr = true, desc = "Scroll Backward" })

  end
}
