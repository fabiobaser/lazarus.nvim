if vim.env.VSCODE then vim.g.vscode = true end

if vim.loader then vim.loader.enable() end

---@module 'snacks'
---@type Snacks
Snacks = Snacks

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.registers")

vim.api.nvim_command("highlight SnacksIndent guifg=#493d64")
