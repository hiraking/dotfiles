local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
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
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
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
        config = function()
            require("nvim-treesitter.configs").setup {
                matchup = {
                    enable = true,
                },
            }
        end,
        event = "BufRead"
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = "nord",
            },
        },
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
        opts = { visual = "<Leader>s" },
    },
    {
        "numToStr/Comment.nvim",
        lazy = true,
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
        lazy = false,
        config = function()
            require("leap").add_default_mappings()
        end,
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
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = true,
        keys = { "%", },
    },
    {
        "kevinhwang91/nvim-bqf",
        lazy = true,
        ft = "qf",
    },
    {
        "vigoux/notifier.nvim",
        lazy = false,
        config = true,
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
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
        }
    }
}
