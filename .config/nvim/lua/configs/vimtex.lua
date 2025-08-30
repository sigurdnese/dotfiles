vim.g["vimtex_view_method"] = "zathura"
vim.g["vimtex_intent_enabled"] = 1
vim.g.vimtex_compiler_latexmk = {
  options = {
    "-pdflatex",
    "-verbose",
    "-file-line-error",
    "-synctex=1",
    "-interaction=nonstopmode",
    "-shell-escape",
  },
}
-- vim.g.maplocalleader = "<Space>"
