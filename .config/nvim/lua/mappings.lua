require "nvchad.mappings"
---@type MappingsTable

local map = vim.keymap.set

map({"n", "v", "i", "x", "s", "c", "o"}, "ø", "<Esc>", { desc = "escape" })
map({"n", "v"}, "æ", ";", { desc = "repeat T, t, F, f" })
map({"n", "v", "i", "o"}, "å", "$", { desc = "end of line" })
map({"n", "v"}, "<C-d>", "<C-d>zz", { desc = "move down and center view" })
map({"n", "v"}, "<C-u>", "<C-u>zz", { desc = "move up and center view" })
map("n", "*", "*N", { desc = "highlight occurences" })
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "telescope live grep args" })
map("v", ">", ">gv", { desc = "indent" })
map("v", "y", "ygv<Esc>", { desc = "yank and move to end of yanked selection" })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "code action", noremap = true, silent = true })

return map
