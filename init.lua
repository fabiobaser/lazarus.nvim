if vim.env.VSCODE then
  vim.g.vscode = true
end

if vim.loader then
  vim.loader.enable()
end

require("config.options")
require("config.lazy")
require("config.keymaps")
