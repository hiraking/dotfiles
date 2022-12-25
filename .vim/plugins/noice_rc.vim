" NOTE message is disabled now
lua << EOF
require('noice').setup{
  views = {
    cmdline_popup = {
      position = {
        row = 11,
        col = "50%",
      },
      size = {
        min_width = 60,
        width = "auto",
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 14,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
        max_height = 15,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
    mini = {
      timeout = 3000,
      position = {
        row = -1,
        col = "100%",
      },
    },
    confirm = {
      backend = "mini",
      position = {
        row = -1,
        col = "100%",
        -- col = 0,
      },
      size = "auto",
      border = {
        style = "rounded",
        padding = { 0, 1 },
        text = {
          top = " Confirm ",
        },
      },
      zindex = 60,
      win_options = {
        winblend = 30,
        winhighlight = {
          Normal = "NoiceConfirm",
          FloatBorder = "NoiceConfirmBorder",
        },
      },
    },
  },
  cmdline = {
    format = {
      filter = { pattern = "^:%s*!", icon = "$", lang = "zsh" },
    },
  },
  messages = {
    view = "mini",
    view_warn = "mini",
    view_error = "mini",
    view_search = false,
  },
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
        find = "written",
      },
      opts = { skip = true },
    },
    {
      filter = {
        event = "msg_show",
        min_height = 10,
      },
      view = "split",
    },
  },
  presets = {
    bottom_search = true,
    inc_rename = false,
    lsp_doc_border = false,
  },
}
EOF
