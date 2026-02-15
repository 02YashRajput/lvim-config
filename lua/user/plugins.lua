lvim.plugins = {
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "VeryLazy",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false }, -- cmp handles suggestions
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local copilot = require("copilot")
      local chat = require("CopilotChat")

      chat.setup({
        debug = false,
        window = {
          layout = 'float',
          width = 0.8,
          height = 0.8,
        },
      })
    end,
    event = "VeryLazy", -- Load after copilot.lua is initialized
  },
}
-- Configure Spectre settings
local status_ok, spectre = pcall(require, "spectre")
if status_ok then
  spectre.setup({
    default = {
      find = {
        cmd = "rg",
        options = {}
      },
      replace = {
        cmd = "sed"
      }
    },
    find_engine = {
      ['rg'] = {
        cmd = "rg",
        args = {
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
        },
        options = {
          ['ignore-case'] = {
            value = "--ignore-case",
            icon = "[I]",
            desc = "ignore case"
          },
        }
      },
    },
  })
end
