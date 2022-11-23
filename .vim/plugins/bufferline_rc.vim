nnoremap <silent><leader>pb :<C-u>BufferLinePick<CR>
nnoremap <silent><leader>pc :<C-u>BufferLinePickClose<CR>

lua << EOF
local selected_buffer_fg = '#dddec1'
local selected_buffer_bg = '#43545c'
local unselected_buffer_fg = '#9aadb5'
local unselected_buffer_bg = '#233036'
local background_color = '#0d1c21'
local modified_fg = '#ffabfe'
local pick_fg = '#ff0f5f'

require("bufferline").setup {
  options = {
    separator_style = 'slant',
    show_buffer_close_icons = false,
    show_close_icon = false,
    indicator = {
      style = 'none',
    },
   -- show_tab_indicators = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
      }
    },
  },
  highlights = {
    separator = {
      fg = background_color,
      bg = unselected_buffer_bg,
    },
    separator_visible = {
      fg = background_color,
      bg = selected_buffer_bg,
    },
    separator_selected = {
      fg = background_color,
      bg = selected_buffer_bg,
    },
    background = {
      fg = unselected_buffer_fg,
      bg = unselected_buffer_bg,
    },
    buffer_visible = {
      fg = selected_buffer_fg,
      bg = selected_buffer_bg,
      bold = true,
      italic = true,
    },
    buffer_selected = {
      fg = selected_buffer_fg,
      bg = selected_buffer_bg,
      bold = true,
      italic = true,
    },
    fill = {
      bg = background_color,
    },
    modified = {
      fg = modified_fg,
      bg = unselected_buffer_bg,
    },
    modified_visible = {
      fg = modified_fg,
      bg = selected_buffer_bg,
    },
    modified_selected = {
      fg = modified_fg,
      bg = selected_buffer_bg,
    },
    duplicate_selected = {
      fg = selected_buffer_fg,
      bg = selected_buffer_bg,
      italic = true,
    },
    duplicate_visible = {
      fg = selected_buffer_fg,
      bg = selected_buffer_bg,
      italic = true,
    },
    duplicate = {
      fg = unselected_buffer_fg,
      bg = unselected_buffer_bg,
      italic = true,
    },
    pick = {
      fg = pick_fg,
      bg = unselected_buffer_bg,
    },
    pick_selected = {
      fg = pick_fg,
      bg = unselected_buffer_bg,
    },
    pick_visible = {
      fg = pick_fg,
      bg = unselected_buffer_bg,
    },
    indicator_selected = {
      bg = selected_buffer_bg,
    },
    indicator_visible = {
      bg = selected_buffer_bg,
    },
    tab = {
      fg = unselected_buffer_fg,
      bg = unselected_buffer_bg,
    },
    tab_selected = {
      fg = selected_buffer_fg,
      bg = selected_buffer_bg,
    },
  },
}

EOF
