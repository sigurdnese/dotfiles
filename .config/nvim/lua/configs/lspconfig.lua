local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "ts_ls", "clangd", "pyre", "fortls", "jedi_language_server"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.clangd.setup {
  cmd = { "clangd", "--malloc-trim", "-j=2"},
  on_attach = on_attach,
  capabilities = capabilities,
}

-- 
-- lspconfig.pyright.setup { blabla}
