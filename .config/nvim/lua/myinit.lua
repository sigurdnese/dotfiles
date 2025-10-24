-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.g.python3_host_prog = "~/.config/nvim/.venv/bin/python"
-- vim.g.python3_host_prog = "/home/sigurd/alice/sw/ubuntu2404_x86-64/Python-modules/1.0-24/bin/python"
-- vim.cmd "runtime! plugin/rplugin.vim"
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
-- lua format snippets --
vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/lua_snippets"
vim.api.nvim_create_autocmd("FileType", {
  pattern = "fortran",
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
  end,
})
