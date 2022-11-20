-- ~/.cache/dein/repos/github.com/akinsho/bufferline.nvim/lua/bufferline/tabpages.lua
-- Change "function render" as follows in order to hide the tab separator.
-- c.f. https://github.com/akinsho/bufferline.nvim/issues/569

local function render(tabpage, is_active, style, highlights)
  local h = highlights
  local hl = is_active and h.tab_selected.hl_group or h.tab.hl_group
  local separator_hl = is_active and h.tab_separator_selected.hl_group or h.tab_separator.hl_group
  local chars = constants.sep_chars[style] or constants.sep_chars.thin
  local name = padding .. padding .. tabpage.tabnr .. padding .. padding
  return {
    { highlight = hl, text = name, attr = { prefix = tab_click_component(tabpage.tabnr) } },
  }
end

