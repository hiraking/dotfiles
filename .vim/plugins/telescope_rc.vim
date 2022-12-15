" c.f. https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
lua << EOF
local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local fb_actions = require "telescope".extensions.file_browser.actions
-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      'node_modules', '.git'
    },
    vimgrep_arguments = vimgrep_arguments,
    mappings = {
      n = {
        ["<esc>"] = require('telescope.actions').close,
        ["q"] = require('telescope.actions').close,
        ["<C-a>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
        ["<C-s>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
      },
      i = {
        -- ["<esc>"] = require('telescope.actions').close,
        ["<C-a>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
        ["<C-s>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist,
        ["<C-n>"] = false,
        ["<C-p>"] = false,
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      cwd_to_path = true,
      display_stat = false,
      mappings = {
        ["n"] = {
          ["h"] = fb_actions.goto_parent_dir,
          ["H"] = fb_actions.toggle_hidden,
        },
        ["i"] = {
          ["C-l"] = fb_actions.goto_cwd,
          ["C-h"] = fb_actions.goto_parent_dir,
        },
      },
    },
  },
}
require('telescope').load_extension('file_browser')
require('telescope').load_extension('fzf')
require('telescope').load_extension('frecency')
EOF
