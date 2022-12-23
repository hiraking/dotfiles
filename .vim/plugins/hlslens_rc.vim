lua << EOF

require('hlslens').setup {
  calm_down = false,
  nearest_only = true,
  override_lens = function(render, posList, nearest, idx, relIdx) 
    local text, chunks
    local lnum, col = unpack(posList[idx])

    local cnt = #posList
    text = ('[%d/%d]'):format(idx, cnt)

    if nearest then
      chunks = {{' ', 'Ignore'}, {text, 'HlSearchLensNear'}}
    else
      chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
    end
    render.setVirt(0, lnum - 1, col -1, chunks, nearest)
  end
}
local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

EOF
