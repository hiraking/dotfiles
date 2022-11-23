set laststatus=3

lua << EOF
require('lualine').setup {
  options = {
    theme = 'onedark',
    globalstatus = true,
    disabled_filetypes = {
      winbar = {'fern', 'NvimTree'},
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
        diff_color = {
          added = { fg = '#41bdbf' },
          modified = { fg = '#c9c542' },
          removed = { fg = '#e84e6a' },
        },
      }, 
      'diagnostics',
    },
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
      },
    },
  },
  winbar = {
    lualine_a = {},
    lualine_b = {
      {
        'filetype',
        colored = true,
        icon_only = true,
      },
    },
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {
      {
        'filetype',
        colored = true,
        icon_only = true,
      },
    },
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  }
}
EOF

