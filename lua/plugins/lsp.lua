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
        ---@module 'lspsaga'
        ---@type LspsagaConfig
        opts = {lightbulb = {sign = false}},
        dependencies = {
            "nvim-tree/nvim-web-devicons" -- optional
        },
        keys = {
            {"K", ":Lspsaga show_cursor_diagnostics<cr>"},
            {"<leader>k", ":Lspsaga hover_doc<cr>"},
            {"<leader>lr", ":Lspsaga rename<cr>"},
            {"<leader>lf", ":Lspsaga finder<cr>"},
            {"<leader>la", ":Lspsaga code_action<cr>"},
            {"<leader>ld", ":Lspsaga goto_definition<cr>"},
            {"<leader>lt", ":Lspsaga goto_type_definition<cr>"}
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
                typescript = {"biomeFix"},
                typescriptreact = {"biomeFix"}
            },
            formatters = {
                biomeFix = {
                    stdin = true,
                    command = "biome",
                    args = {
                        "check", "--write", "--stdin-file-path", "$FILENAME"
                    }
                }
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
    }, {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load({
                paths = "~/.config/nvim/lua/snippets"
            })
            require("luasnip.loaders.from_snipmate").lazy_load({
                paths = "~/.config/nvim/lua/snippets"
            })
        end
    },
    { -- optional blink completion source for require statements and module annotations
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = {'L3MON4D3/LuaSnip', version = "v2.*"},
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            snippets = {preset = "luasnip"},
            completion = {
                documentation = {auto_show = true},
                menu = {
                    draw = {
                        treesitter = {'lsp'},
                        columns = {
                            {"kind_icon", gap = 2},
                            {'label', 'label_description', "kind", gap = 2}
                        }
                    }
                }
            },
            keymap = {
                preset = "default",
                ["<Enter>"] = {"select_and_accept", "fallback"}
            },
            signature = {},
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
    }, {"ThePrimeagen/refactoring.nvim", opts = {}}
}
