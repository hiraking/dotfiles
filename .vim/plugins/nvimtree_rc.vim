lua << EOF
require("nvim-tree").setup{
  hijack_netrw = true,
  open_on_setup = true,
  remove_keymaps = {"<BS>"},
  view = {
    width = 25,
    preserve_window_proportions = true,
    mappings = {
      custom_only = false,
      list = {
        { key = "l", action = "edit" },
        { key = "h", action = "close_node" },
      },
    },
  },
}
EOF
