Constants = require("custom.core.constants")
local M = {}

M.gitsigns = {
	signs = {
		add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		untracked = { text = "┆" },
	},
	-- on_attach = function(bufnr)
	-- 	vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr })
	-- 	vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { buffer = bufnr })
	-- 	vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr })
	-- 	vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr })
	-- 	vim.keymap.set("n", "<leader>hj", gitsigns.next_hunk, { buffer = bufnr })
	-- 	vim.keymap.set("n", "<leader>hk", gitsigns.prev_hunk, { buffer = bufnr })
	-- end,

	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	trouble = false,
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
	-- current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 10000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
}

M.treesitter = {
	ensure_installed = Constants.ensure_installed.treesitter,
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	auto_install = true,
	ignore_install = { "latex" },
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "css", "latex" },
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "python", "css", "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" },
		extended_mode = true,
		max_file_lines = nil,
		-- colors = {},
		-- termcolors = {}
	},
	playground = {
		enable = false,
		disable = {},
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = "o", -- Переключает редактор запросов, когда игровая площадка сфокусирована.
			toggle_hl_groups = "i", -- Переключает видимость групп подсветки.
			toggle_injected_languages = "t", -- Переключает видимость вводимых языков.
			toggle_anonymous_nodes = "a", -- Переключает видимость анонимных узлов.
			toggle_language_display = "I", -- Переключает видимость языка, к которому принадлежит узел.
			focus_language = "f", -- Фокусирует дерево языка под курсором на игровой площадке. Редактор запросов теперь будет использовать специализированный язык.
			unfocus_language = "F", -- Расфокусирует текущий язык.
			update = "R", -- Обновляет представление игровой площадки при фокусировке или перезагружает запрос при фокусировке редактора запросов.
			goto_node = "<cr>", -- Перейти к текущему узлу в буфере кода
			show_help = "?",
		},
	},
	query_linter = {
		enable = false,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
}

M.mason = {
	ensure_installed = Constants.ensure_installed.mason,
}

-- git support in nvimtree
local tree_cb = require("nvim-tree.config").nvim_tree_callback
M.nvimtree = {
	-- auto_reload_on_write = true,
	-- hijack_unnamed_buffer_when_opening = false,
	-- ignore_buffer_on_setup = false,
	-- open_on_setup = false,
	-- open_on_setup_file = false,
	-- sort_by = "case_sensitive", --"name",
	-- root_dirs = {},
	-- prefer_startup_root = false,
	-- reload_on_bufenter = false,
	-- on_attach = "disable",
	-- remove_keymaps = false,
	-- select_prompts = false,

	-- sync_root_with_cwd = true,
	-- respect_buf_cwd = true,
	-- disable_netrw = true,
	-- hijack_netrw = true,
	-- hijack_cursor = true,
	-- respect_buf_cwd = false,
	-- update_cwd = false,
	-- actions = {
	--   open_file = {
	--     quit_on_open = true,
	--   },
	--   change_dir = {
	--     enable = false,
	--     global = false,
	--     restrict_above_cwd = false,
	--   },
	--   use_system_clipboard = true,
	--   expand_all = {
	--     max_folder_discovery = 300,
	--     exclude = {},
	--   },
	--   file_popup = {
	--     open_win_config = {
	--       col = 1,
	--       row = 1,
	--       relative = "cursor",
	--       border = "shadow",
	--       style = "minimal",
	--     },
	--   },
	--   remove_file = {
	--     close_window = true,
	--   },
	-- },
	git = {
		enable = true,
		--     ignore = false,
		--     show_on_dirs = true,
		--     show_on_open_dirs = true,
		--     timeout = 500,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		-- ignore_list = {},
		-- update_root = true,
	},
	renderer = {
		-- add_trailing = false,
		-- group_empty = false,
		highlight_git = false,
		-- full_name = false,
		-- highlight_opened_files = "none",
		-- --highlight_modified = "none",
		-- root_folder_label = ":~:s?$?/..?",
		-- indent_width = 2,
		-- indent_markers = {
		--   enable = true,
		--   inline_arrows = true,
		--   icons = {
		--     corner = "└",
		--     edge = "│",
		--     item = "│",
		--     bottom = "─",
		--     none = " ",
		--   },
		-- },
		root_folder_modifier = ":t",
		icons = {
			show = {
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		-- special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
		-- symlink_destination = true,
	},
	-- hijack_directories = {
	--   enable = true,
	--   auto_open = true,
	-- },
	-- update_focused_file = {
	--   enable = true,
	--   update_root = false,
	--   ignore_list = {},
	-- },
	-- ignore_ft_on_setup = {},
	-- system_open = {
	--   cmd = "",
	--   args = {},
	-- },
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		-- show_on_open_dirs = true,
		-- debounce_delay = 50,
		-- severity = {
		--   min = vim.diagnostic.severity.HINT,
		--   max = vim.diagnostic.severity.ERROR,
		-- },
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 30,
		side = "left",
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "u", action = "dir_up" },
			},
		},
		-- centralize_selection = false,
		-- --cursorline = true,
		-- hide_root_folder = false,
		-- preserve_window_proportions = false,
		-- number = false,
		-- relativenumber = false,
		-- signcolumn = "yes",
		-- float = {
		--   enable = false,
		--   quit_on_focus_loss = true,
		--   open_win_config = {
		--     relative = "editor",
		--     border = "rounded",
		--     width = 30,
		--     height = 30,
		--     row = 1,
		--     col = 1,
		--   },
		-- },
	},
	-- filesystem_watchers = {
	--   enable = true,
	--   debounce_delay = 50,
	--   ignore_dirs = {},
	-- },

	-- trash = {
	--   cmd = "gio trash",
	-- },
	-- live_filter = {
	--   prefix = "[FILTER]: ",
	--   always_show_folders = true,
	-- },
	-- tab = {
	--   sync = {
	--     open = false,
	--     close = false,
	--     ignore = {},
	--   },
	-- },
	-- notify = {
	--   threshold = vim.log.levels.INFO,
	-- },
	-- log = {
	--   enable = false,
	--   truncate = false,
	--   types = {
	--     all = false,
	--     config = false,
	--     copy_paste = false,
	--     dev = false,
	--     diagnostics = false,
	--     git = false,
	--     profile = false,
	--     watcher = false,
	--   },
	-- },
}

M.cmp = {
	sources = Constants.completion.sources,
}

return M
