lvim.plugins = {
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
