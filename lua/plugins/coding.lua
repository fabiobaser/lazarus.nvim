--  _____           _ _             
-- /  __ \         | (_)            
-- | /  \/ ___   __| |_ _ __   __ _ 
-- | |    / _ \ / _` | | '_ \ / _` |
-- | \__/\ (_) | (_| | | | | | (_| |
--  \____/\___/ \__,_|_|_| |_|\__, |
--                             __/ |
--                            |___/ 
--
return {
    {
        "rachartier/tiny-glimmer.nvim",
        event = "VeryLazy",
        priority = 10,
        opts = {}
    },
    {'windwp/nvim-autopairs', event = "InsertEnter", config = true, opts = {}},
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)"
            }, {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)"
            }, {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)"
            }, {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)"
            }, {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)"
            }, {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)"
            }
        }
    }, {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        opts = {}
    }, {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@module 'flash'
        ---@type Flash.Config
        opts = {},
        keys = {
            {
                "s",
                mode = {"n", "x", "o"},
                function() require("flash").jump() end,
                desc = "Flash"
            }, {
                "<M-s>",
                mode = {"n", "x", "o"},
                function() require("flash").treesitter() end,
                desc = "Flash Treesitter"
            }, {
                "r",
                mode = "o",
                function() require("flash").remote() end,
                desc = "Remote Flash"
            }, {
                "R",
                mode = {"o", "x"},
                function() require("flash").treesitter_search() end,
                desc = "Treesitter Search"
            }, {
                "<c-s>",
                mode = {"c"},
                function() require("flash").toggle() end,
                desc = "Toggle Flash Search"
            }
        }
    },
    -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    }, {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1
    }, {"lewis6991/gitsigns.nvim", opts = {}}
}

--[[ 
--{
        "pmizio/typescript-tools.nvim",
        dependencies = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
        opts = {}
    
}
--]]

