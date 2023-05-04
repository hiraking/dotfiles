
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup{
    {
        "folke/tokyonight.nvim",
        branch = "main",
        lazy = false,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        event = "CursorHold",
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        event = "CursorHold",
    },
    {
        "neoclide/coc.nvim",
        branch = "release",
        lazy = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        lazy = true,
        event = "BufRead",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "David-Kunz/treesitter-unit",
            "haringsrob/nvim_context_vt",
            "m-demare/hlargs.nvim",
            "andymass/vim-matchup",
            "yioneko/nvim-yati",
            "SmiteshP/nvim-gps",
        },
        config = function()
            require("nvim-treesitter.configs").setup {
                matchup = {
                    enable = true,
                },
                yati = {
                    enable  = true,
                    default_lazy = true,
                    default_fallback = "auto",
                },
                indent = {
                    enable = false,
                },
                ensure_installed = {
                    "css","html", "javascript",
                    "lua", "python", "scss", "tsx", 
                    "typescript", "vim", "vue",
                },
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer"
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
            }
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = true,
    },
    {
        "yioneko/nvim-yati",
        lazy = true,
        version = "*",
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        lazy = true,
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
    },
    {
        "haringsrob/nvim_context_vt",
        lazy = true,
    },
    {
        "David-Kunz/treesitter-unit",
        lazy = true,
        config = function()
            vim.keymap.set("x", "iu", ":lua require('treesitter-unit').select()<CR>")
            vim.keymap.set("x", "au", ":lua require('treesitter-unit').select(true)<CR>")
            vim.keymap.set("o", "iu", ":<C-u>lua require('treesitter-unit').select()<CR>")
            vim.keymap.set("o", "au", ":<C-u>lua require('treesitter-unit').select(true)<CR>")
        end,
    },
    {
        "mfussenegger/nvim-treehopper",
        lazy = true,
        keys = {
            "c", "d", "y", "v",
        },
        config = function()
            vim.keymap.set("o", "m", ":<C-u>lua require('tsht').nodes()<CR>")
            vim.keymap.set("x", "m", ":lua require('tsht').nodes()<CR>")
        end,
    },
    {
        "m-demare/hlargs.nvim",
        lazy = true,
        config = true,
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { 
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup {
                options = {
                    theme = "nord",
                },
            }
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        cond = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "tiagovla/scope.nvim",
        },
        opts = {
            options = {

            },
        },
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
            "lewis6991/gitsigns.nvim",
            "tiagovla/scope.nvim",
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {},
        version = "^1.0.0",
    },
    {
        "tiagovla/scope.nvim",
        lazy = true,
        config = true,
    },
    {
        "kylechui/nvim-surround",
        lazy = true,
        keys = {
            "ys", "ds", "cs",
            { mode = "x", "<Leader>s" },
        },
        opts = { visual = "<Leader>s" },
    },
    {
        "numToStr/Comment.nvim",
        lazy = true,
        dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
        config = function()
            require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end,
    },
    {
        "kevinhwang91/nvim-hlslens",
        opts = {
            calm_down = true,
        },
    },
    {
        "haya14busa/vim-asterisk",
        lazy = true,
        keys = {
            "*", "#",
        }
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },
    {
        "sindrets/diffview.nvim",
        lazy = true,
    },
    {
        "nvim-lua/plenary.nvim",
        lazy = true,
    },
    {
        "TimUntersberger/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            disable_commit_confirmation = true,
            integrations = { diffview = true },
        },
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure({
                delay = 300,
            })
        end,
    },
    {
        "windwp/nvim-autopairs",
        lazy = true,
        event = "InsertEnter",
        opts = {
            map_c_h = true,
            map_c_w = true,
        },
    },
    {
        "norcalli/nvim-colorizer.lua",
        lazy = true,
        cmd = "ColorizerAttachToBuffer",
    },
    {
        "ggandor/leap.nvim",
        lazy = true,
        keys = { "s", "S" },
        config = function()
            require("leap").add_default_mappings()
        end,
    },
    {
        "ggandor/flit.nvim",
        lazy = true,
        config = true,
        keys = { "f", "t" },
        dependencies = {
            "ggandor/leap.nvim",
            "tpope/vim-repeat",
        },
    },
    {
        "tpope/vim-repeat",
        lazy = true,
    },
    {
        "phaazon/hop.nvim",
        branch = "v2",
        config = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "tsakirist/telescope-lazy.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "fannheyward/telescope-coc.nvim",
        },
        config = function()
            require("telescope").setup {

            }
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("lazy")
            require("telescope").load_extension("coc")
            require("telescope").load_extension("frecency")
            require("telescope").load_extension("neoclip")
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = true,
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    {
        "tsakirist/telescope-lazy.nvim",
        lazy = true,
    },
    {
        "fannheyward/telescope-coc.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        lazy = true,
        dependencies = { "kkharji/sqlite.lua" }
    },
    {
        "AckslD/nvim-neoclip.lua",
        lazy = true,
        key = { "y", { "y", mode = "x" } },
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "kkharji/sqlite.lua",
        },
        config = function()
            require("neoclip").setup({
                keys = {
                    telescope = {
                        i = {
                            select = "<cr>",
                            paste = "<c-p>",
                            paste_behind = "<c-k>",
                            replay = "<c-q>",
                            delete = "<c-d>",
                            edit = "<c-e>",
                            custom = {},
                        },
                        n = {
                            select = "<cr>",
                            paste = { "p", "<C-p>" },
                            paste_behind = "P",
                            replay = "q",
                            delete = "d",
                            edit = "e",
                            custom = {},
                        },  
                    }
                }
            })
        end,
    },
    {
        "kkharji/sqlite.lua",
        lazy = true,
    },
    {
        "vim-jp/vimdoc-ja",
        lazy = true,
        event = "CmdlineEnter",
    },
    {
        "simeji/winresizer",
        lazy = true,
        cmd = "WinResizerStartResize",
        config = function()
            vim.g.winresizer_horiz_resize = 1
            vim.g.winresizer_vert_resize = 1
        end,
        init = function()
            vim.keymap.set("n", "<C-e>", ":<C-u>WinResizerStartResize<CR>")
        end,
    },
    {
        "famiu/bufdelete.nvim",
        lazy = true,
        cmd = "Bdelete",
        init = function()
            vim.keymap.set("n", "<Leader>x", "<cmd>Bdelete<CR>")
            vim.keymap.set("n", "<Leader>X", "<cmd>Bdelete!<CR>")
        end,
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },
    {
        "markonm/traces.vim",
        lazy = true,
        event = "CmdlineEnter",
    },
    {
        "karb94/neoscroll.nvim",
        lazy = true,
        keys = {
            "<C-u>", "<C-d>",
            { "<C-d>", mode = "x" },
            { "<C-u>", mode = "x" },
        },
        config = function()
            require("neoscroll").setup({
                mappings = {},
            })
            local t = {}
            t['<C-u>'] = {'scroll', {'-vim.wo.scroll', 'true', '100'}}
            t['<C-d>'] = {'scroll', {'vim.wo.scroll', 'true', '100'}}
            t['zt'] = {'zt', {'100'}}
            t['zz'] = {'zz', {'100'}}
            t['zb'] = {'zb', {'100'}}
            require('neoscroll.config').set_mappings(t)
        end,
    },
    {
        "andymass/vim-matchup",
        lazy = true,
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,
    },
    {
        "kevinhwang91/nvim-bqf",
        lazy = true,
        ft = "qf",
    },
    {
        "MunifTanjim/nui.nvim",
        lazy = true,
    },
    {
        "folke/noice.nvim",
        lazy = false,
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        },
    },
    {
        "tpope/vim-abolish",
        lazy = true,
        cmd = "Subvert",
    },
    {
        "kana/vim-textobj-user",
        lazy = true,
    },
    {
        "kana/vim-textobj-entire",
        lazy = true,
        dependencies = { "kana/vim-textobj-user" },
        keys = { "c", "d", "y", "v" },
    },
    {
        "wellle/targets.vim",
        lazy = true,
        keys = { "c", "d", "y", "v" },
    },
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        config = true,
        ft = {
            "html",
            "xml",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
    },
    {
        "folke/todo-comments.nvim",
        lazy = true,
        event = "CursorHold",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },
    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup()
        end,
    },
    {
        "petertriho/nvim-scrollbar",
        lazy = false,
        opts = {
            handlers = {
                cursor = false,
                gitsigns = true,
                search = true,
            },
        },
    },
    {
        "tversteeg/registers.nvim",
        lazy = true,
        keys = {
            { "\"", mode = { "n", "v" } },
            { "<C-r>", mode = "i" },
        },
        cmd = "Registers",
        config = function()
            local registers = require("registers")
            registers.setup({
                bind_keys = {
                    normal    = registers.show_window({ mode = "motion" }),
                    visual    = registers.show_window({ mode = "motion" }),
                    insert    = registers.show_window({ mode = "insert" }),

                    registers = registers.apply_register({ delay = 0.1 }),
                    -- Immediately apply the selected register line when pressing the return key
                    ["<CR>"]  = registers.apply_register(),
                    -- Close the registers window when pressing the Esc key
                    ["<Esc>"] = registers.close_window(),

                    -- Move the cursor in the registers window down when pressing <C-n>
                    ["<C-n>"] = registers.move_cursor_down(),
                    -- Move the cursor in the registers window up when pressing <C-p>
                    ["<C-p>"] = registers.move_cursor_up(),
                    -- Move the cursor in the registers window down when pressing <C-j>
                    ["<C-j>"] = registers.move_cursor_down(),
                    -- Move the cursor in the registers window up when pressing <C-k>
                    ["<C-k>"] = registers.move_cursor_up(),
                    -- Clear the register of the highlighted line when pressing <DeL>
                    ["<Del>"] = registers.clear_highlighted_register(),
                    -- Clear the register of the highlighted line when pressing <BS>
                    ["<BS>"]  = registers.clear_highlighted_register(),
                },
            })
        end,
    },
}
