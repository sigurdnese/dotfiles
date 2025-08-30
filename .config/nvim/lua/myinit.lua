-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

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
