return {
    {
        "CRAG666/code_runner.nvim",
        opts = {
            filetype = {
                typescript = function()

                    local clients = vim.lsp.get_clients({name = "vtsls"})

                    local root_dir = clients[1].config.root_dir

                    return "pnpm tsx $dir/$fileName$end"

                end
            }
        },
        keys = {{"<leader>rf", "<Cmd>RunFile<CR>", desc = "[R]un [F]ile"}}
    }
}
