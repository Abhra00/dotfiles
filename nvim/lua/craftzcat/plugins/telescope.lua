return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local transform_mod = require("telescope.actions.mt").transform_mod
		local fb_actions = require("telescope").extensions.file_browser.actions
		local trouble = require("trouble")
		local trouble_telescope = require("trouble.sources.telescope")

		-- or create your custom action
		local custom_actions = transform_mod({
			open_trouble_qflist = function(prompt_bufnr)
				trouble.toggle("quickfix")
			end,
		})

		telescope.setup({
			defaults = {
				prompt_prefix = "   ",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble_telescope.open,
					},
				},
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					mappings = {
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

		-- Find Plugin File
		vim.keymap.set("n", "<leader>fP", function()
			require("telescope.builtin").find_files({
				cwd = require("lazy.core.config").options.root,
			})
		end, { desc = "Find Plugin File" })

		-- Lists files in current directory, respects .gitignore
		vim.keymap.set("n", "<leader>;f", function()
			local builtin = require("telescope.builtin")
			builtin.find_files({
				no_ignore = false,
				hidden = true,
			})
		end, { desc = "Lists files in your current working directory, respects .gitignore" })

		-- Live grep in current directory, respects .gitignore
		vim.keymap.set("n", "<leader>;r", function()
			local builtin = require("telescope.builtin")
			builtin.live_grep({
				additional_args = { "--hidden" },
			})
		end, {
			desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
		})

		-- Lists open buffers
		vim.keymap.set("n", "<leader>\\\\", function()
			local builtin = require("telescope.builtin")
			builtin.buffers()
		end, { desc = "Lists open buffers" })

		-- Lists available help tags and opens relevant help info on <cr>
		vim.keymap.set("n", "<leader>;t", function()
			local builtin = require("telescope.builtin")
			builtin.help_tags()
		end, { desc = "Lists available help tags and opens a new window with the relevant help info on <cr>" })

		-- Resume the previous telescope picker
		vim.keymap.set("n", "<leader>;;", function()
			local builtin = require("telescope.builtin")
			builtin.resume()
		end, { desc = "Resume the previous telescope picker" })

		-- Lists diagnostics for all open buffers or a specific buffer
		vim.keymap.set("n", "<leader>;e", function()
			local builtin = require("telescope.builtin")
			builtin.diagnostics()
		end, { desc = "Lists Diagnostics for all open buffers or a specific buffer" })

		-- Lists function names, variables, from Treesitter
		vim.keymap.set("n", "<leader>;s", function()
			local builtin = require("telescope.builtin")
			builtin.treesitter()
		end, { desc = "Lists Function names, variables, from Treesitter" })

		-- Open File Browser with the path of the current buffer
		vim.keymap.set("n", "<leader>fm", function()
			local telescope = require("telescope")

			local function telescope_buffer_dir()
				return vim.fn.expand("%:p:h")
			end

			telescope.extensions.file_browser.file_browser({
				path = "%:p:h",
				cwd = telescope_buffer_dir(),
				respect_gitignore = false,
				hidden = true,
				grouped = true,
				previewer = false,
				initial_mode = "normal",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
			})
		end, { desc = "Open File Browser with the path of the current buffer" })
	end,
}
