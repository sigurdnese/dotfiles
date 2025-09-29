local overrides = require("configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "nvimtools/none-ls.nvim",
        dependencies = {
          "nvimtools/none-ls-extras.nvim"
        },
        config = function()
          require "configs.null-ls"
        end,
      },
    },
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },

  -- Install a plugin

  -- fugitive for Git
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },

  -- diffview
  {
    "sindrets/diffview.nvim",
    cmd = {"DiffviewOpen"},
    config = function()
      require("diffview").setup()
    end,
  },

  --trouble
  {
    "folke/trouble.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {},
  },

  --vimbegood
  {
    "ThePrimeagen/vim-be-good",
  },

  --cmp-vimtex, makes cmp work with vimtex
  {
    "micangl/cmp-vimtex",
    -- lazy = false,
  },

  --vimtex
  {
    "lervag/vimtex",
    dependencies = {"micangl/cmp-vimtex"},
    config = function()
      require "configs.vimtex"
    end,
    ft = {
      "tex",
      "bib",
    },
  },

  --nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },

  --telescope with live-grap-args
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0"
    },
    config = function()
      local telescope = require("telescope")

      -- first setup telescope
      telescope.setup({
        -- your config
      })

      -- then load the extension
      telescope.load_extension("live_grep_args")
    end
  },

  --leap
  {
    "ggandor/leap.nvim",
    keys = {"s","S"},
    dependencies = {
      "tpope/vim-repeat"
    },
    config = function()
      -- require("leap").create_default_mappings()
      vim.keymap.set('n',        's', '<Plug>(leap)')
      vim.keymap.set('n',        'S', '<Plug>(leap-from-window)')
      vim.keymap.set({'x', 'o'}, 's', '<Plug>(leap-forward)')
      vim.keymap.set({'x', 'o'}, 'S', '<Plug>(leap-backward)')
    end
  },

  --magma-nvim
  {
    "dccsillag/magma-nvim",
    build = ':UpdateRemotePlugins',
    lazy = false,
    config = function()
      require "configs.magma-nvim"
    end
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
