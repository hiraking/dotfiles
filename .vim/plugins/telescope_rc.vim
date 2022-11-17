nnoremap <C-x> <CR>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      'node_modules', '.git'
    },
    mappings = {
      n = {
        ["<esc>"] = require('telescope.actions').close,
      },
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-a>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
        ["<C-q>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
        ["<C-n>"] = false,
        ["<C-p>"] = false,
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    }
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  }
}
EOF
