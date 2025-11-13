--  _      ___________ 
-- | |    /  ___| ___ \
-- | |    \ `--.| |_/ /
-- | |     `--. \  __/ 
-- | |____/\__/ / |    
-- \_____/\____/\_|    
return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            "neovim/nvim-lspconfig", {"mason-org/mason.nvim", opts = {}}
        }
    }, {
        "nvimdev/lspsaga.nvim",
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter", -- optional
            "nvim-tree/nvim-web-devicons" -- optional
        },
        keys = {
            {"K", ":Lspsaga show_cursor_diagnostics<cr>"},
            {"<leader>k", ":Lspsaga hover_doc<cr>"},
            {"<leader>la", ":Lspsaga code_action<cr>"}
        }
    }, {
        "stevearc/conform.nvim",
        event = {"BufWritePre"},
        cmd = {"ConformInfo"},
        ---@type conform.setupOpts
        opts = {
            notify_no_formatters = true,
            format_on_save = {lsp_format = "never"},
            formatters_by_ft = {
                lua = {"lua-format"},
                javascript = {"biome", "biome-organize-imports"},
                javascriptreact = {"biome", "biome-organize-imports"},
                typescript = {"biome", "biome-organize-imports"},
                typescriptreact = {"biome", "biome-organize-imports"}
            }
        }
    }, {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                {path = "${3rd}/luv/library", words = {"vim%.uv"}}
            }
        }
    },
    { -- optional blink completion source for require statements and module annotations
        "saghen/blink.cmp",
        version = "1.*",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = "default",
                ["<Enter>"] = {"select_and_accept", "fallback"}
            },
            sources = {
                -- add lazydev to your completion providers
                default = {"lazydev", "lsp", "path", "snippets"},
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        -- make lazydev completions top priority (see `:h blink.cmp`)
                        score_offset = 100
                    }
                }
            }
        }
    }
}
