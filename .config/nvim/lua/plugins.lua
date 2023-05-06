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
        "neoclide/coc.nvim",
        branch = "release",
        cond = false,
    },
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
        "neovim/nvim-lspconfig",
        event = "BufRead",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "Decodetalkers/csharpls-extended-lsp.nvim",
        },
        config = function()
            -- mason.nvim -> mason-lspconfig.nvim -> lspconfig
            require("mason").setup()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "csharp_ls", "clangd", "html", "cssls",
                    "jsonls", "tsserver", "lua_ls", "marksman",
                    "jedi_language_server",
                },
            }

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {}
            lspconfig.jedi_language_server.setup {}

            local config = {
                handlers = {
                    ["textDocument/definition"] = require('csharpls_extended').handler,
                },
                cmd = { "csharp-ls" },
            }
            lspconfig.csharp_ls.setup(config)

        end,
    },
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        lazy = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        lazy = true,
    },
    {
        "Decodetalkers/csharpls-extended-lsp.nvim",
        lazy = true,
    },
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = {
                    enable = false,
                },
            })
        end,
        dependencies = {
            {"nvim-tree/nvim-web-devicons"},
            {"nvim-treesitter/nvim-treesitter"},
        },
    },
    {
        "folke/lsp-colors.nvim",
        event = "LspAttach",
        config = true,
    },
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "LspAttach",
        config = function()
            require("trouble").setup {

            }
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = "BufRead",
        config = true,
    },
    {
        "hrsh7th/nvim-cmp",
    },
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    {
        "hrsh7th/cmp-nvim-lsp-document-symbol",
    },
    {
        "hrsh7th/cmp-buffer",
    },
    {
        "hrsh7th/cmp-cmdline",
    },
    {
        "hrsh7th/cmp-calc",
    },
    {
        "hrsh7th/cmp-path",
    },
    {
        "hrsh7th/cmp-nvim-lua",
    },
    {
        "zbirenbaum/copilot-cmp",
    },
    {
        "f3fora/cmp-spell",
    },
    {
        "uga-rosa/cmp-dictionary",
    },
    {
        "saadparwaiz1/cmp_luasnip",
    },
    {
        "tzachar/cmp-tabnine",
    },
    {
        "ray-x/cmp-treesitter",
    },
    {
        "onsails/lspkind.nvim"
    },
    {
        "L3MON4D3/LuaSnip",
        version = "1.*",
        build = "make install_jsregexp",
        event = "InsertEnter",
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
                --yati = {
                --    enable  = true,
                --    default_lazy = true,
                --    default_fallback = "auto",
                --},
                indent = {
                    enable = true,
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
        keys = { "g", { "g", mode = { "x" } } },
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
        },
        config = function()
            require("telescope").setup {

            }
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("lazy")
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
                    ["<CR>"]  = registers.apply_register(),
                    ["<Esc>"] = registers.close_window(),
                    ["<C-n>"] = registers.move_cursor_down(),
                    ["<C-p>"] = registers.move_cursor_up(),
                    ["<C-j>"] = registers.move_cursor_down(),
                    ["<C-k>"] = registers.move_cursor_up(),
                    ["<Del>"] = registers.clear_highlighted_register(),
                    ["<BS>"]  = registers.clear_highlighted_register(),
                },
            })
        end,
    },
    {
        "AndrewRadev/linediff.vim",
        lazy = true,
        config = false,
        cmd = "Linediff",
    },
    {
        "chentoast/marks.nvim",
        lazy = true,
        config = true,
        keys = { "m" },
    },
    {
        "rmagatti/auto-session",
        lazy = false,
        opts = {
            auto_session_suppress_dirs = {" ~/ "},
        },
    },
    {
        "tyru/capture.vim",
        lazy = true,
        config = false,
        cmd = "Capture",
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        lazy = true,
        config = true,
        cmd = "ToggleTerm",
        init = function()
            vim.keymap.set("n", "<Leader>tf", "ToggleTerm direction=float")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = true,
    },
    {
        "LudoPinelli/comment-box.nvim",
        cmd = { "CBllbox", "CBlcbox", "CBline", "CBrline" },
    },
    {
        "michaelb/sniprun",
        build = "bash ./install.sh",
        lazy = true,
        cmd = "SnipRun",
    },
    {
        "ntpeters/vim-better-whitespace",
        event = "InsertEnter",
        config = function()
            vim.g.better_whitespace_enabled=0
        end,
    },
    {
        "mfussenegger/nvim-dap",
        ft = {
            "cs",
        },
        config = function()
            local dap = require("dap")
            dap.adapters.coreclr = {
                type = 'executable',
                command = '/usr/local/bin/netcoredbg/netcoredbg',
                args = {'--interpreter=vscode'}
            }
            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                    end,
                },
            }

            vim.keymap.set('n', '<F5>', function() dap.continue() end)
            vim.keymap.set('n', '<F10>', function() dap.step_over() end)
            vim.keymap.set('n', '<F11>', function() dap.step_into() end)
            vim.keymap.set('n', '<F12>', function() dap.step_out() end)
            vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
            vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint() end)
            vim.keymap.set('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
            vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
            vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
            vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
                require('dap.ui.widgets').hover()
            end)
            vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
                require('dap.ui.widgets').preview()
            end)
            vim.keymap.set('n', '<Leader>df', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.frames)
            end)
            vim.keymap.set('n', '<Leader>ds', function()
                local widgets = require('dap.ui.widgets')
                widgets.centered_float(widgets.scopes)
            end)
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
        dependencies = { "mfussenegger/nvim-dap" },
        ft = { "cs" },
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "cs" },
    },
    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({
                library = {
                    plugins = { "nvim-dap-ui" },
                    types = true,
                },
            })
        end,
    },
}
