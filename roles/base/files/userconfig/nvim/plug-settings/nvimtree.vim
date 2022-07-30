
lua << EOF
require("nvim-tree").setup({
	open_on_setup = true,
	open_on_setup_file = true,
	hijack_cursor = true,
	prefer_startup_root = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
  view = {
    adaptive_size = true,
		centralize_selection = true,
    mappings = {
      list = {
				{ key = "l", action = "open" },
				{ key = "h", action = "dir_up" },
      },
    },
  },
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
})
EOF
