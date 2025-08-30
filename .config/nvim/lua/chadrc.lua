---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.base46 = {
  theme = "flexoki",
  theme_toggle = { "flexoki", "one_light" },
}

M.ui = {
  statusline = {
    theme = "minimal",
    order = nil,
    modules = nil,
  },
  telescope = { style = "bordered" }, -- borderless / bordered
}

-- M.plugins = "plugins"

-- check core.mappings for table structure
-- M.mappings = require "mappings"

return M
