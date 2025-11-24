--  _   __
-- | | / /
-- | |/ /  ___ _   _ _ __ ___   __ _ _ __  ___
-- |    \ / _ \ | | | '_ ` _ \ / _` | '_ \/ __|
-- | |\  \  __/ |_| | | | | | | (_| | |_) \__ \
-- \_| \_/\___|\__, |_| |_| |_|\__,_| .__/|___/
--              __/ |               | |
--             |___/                |_|
--
--
---@module 'snacks'
---@type Snacks
Snacks = Snacks

Snacks.keymap.set("n", "<leader>s", ":w<cr>")
Snacks.keymap.set("n", "<leader>q", ":q<cr>", {desc = "Quit"})
Snacks.keymap.set("n", "<leader>Q", ":qall<cr>", {desc = "Quit All"})
Snacks.keymap.set("n", "<leader>h", ":nohl<cr>", {desc = "Quit All"})
Snacks.keymap.set("t", "<Esc>", "<C-\\><C-n>",
                  {desc = "Exit Insert Mode (Terminal)"})

Snacks.keymap.set("n", "<leader>Ni", "<Cmd>Inspect<cr>",
                  {desc = "[N]eovoim [I]nspect"})

Snacks.keymap.set("n", "<C-h>", "<C-w>h")
Snacks.keymap.set("n", "<C-j>", "<C-w>j")
Snacks.keymap.set("n", "<C-k>", "<C-w>k")
Snacks.keymap.set("n", "<C-l>", "<C-w>l")

Snacks.keymap.set("n", "<M-j>", "<Cmd>m .+1<CR>")
Snacks.keymap.set("n", "<M-k>", "<Cmd>m .-2<CR>")

Snacks.keymap.set("n", "<leader>Ss",
                  function() require('persistence').select() end)
Snacks.keymap.set("n", "<leader>S.",
                  function() require('persistence').load() end)
Snacks.keymap.set("n", "<leader>Sl",
                  function() require('persistence').load({last = true}) end)
