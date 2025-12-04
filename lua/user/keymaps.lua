local kind = require('user.kind')

lvim.leader = "space"

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
vim.keymap.set('n', 'gn', ":tabe %<CR>")

lvim.builtin.which_key.mappings["p"] = {
  "<cmd>Telescope projects<cr>",
  "Projects"
}
lvim.builtin.which_key.mappings["P"] = {
  "<cmd>Telescope plugins<cr>",
  "Plugins",
}

lvim.builtin.which_key.mappings["t"] = {
  "<cmd>ToggleTerm direction=horizontal size=15<cr>",
  "Terminal"
}

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.keymap.set(
      "t",
      "<Esc>",
      [[<C-\><C-n>]],
      { buffer = true, silent = true }
    )
  end,
})

lvim.lsp.buffer_mappings.normal_mode["gr"] = {
  ":lua require'telescope.builtin'.lsp_references()<cr>",
  kind.cmp_kind.Reference .. " Find references"
}

lvim.lsp.buffer_mappings.normal_mode["gd"] = {
  ":lua vim.lsp.buf.definition()<cr>",
  -- ":lua require'telescope.builtin'.lsp_definitions()<cr>",
  kind.cmp_kind.Reference .. " Definitions"
}

lvim.lsp.buffer_mappings.normal_mode["gD"] = {
  ":lua vim.lsp.buf.type_definition()<cr>",
  kind.cmp_kind.Reference .. " Type Definition"
}

lvim.lsp.buffer_mappings.normal_mode["gf"] = {
  ":Telescope frecency<cr>",
  kind.cmp_kind.Reference .. " Telescope Frecency"
}
-- Normal mode resizing with Alt (Option) + Arrow
lvim.keys.normal_mode["<A-Up>"]            = ":resize +3<CR>"
lvim.keys.normal_mode["<A-Down>"]          = ":resize -3<CR>"
lvim.keys.normal_mode["<A-Left>"]          = ":vertical resize -5<CR>"
lvim.keys.normal_mode["<A-Right>"]         = ":vertical resize +5<CR>"

-- Terminal mode resizing with Alt (Option) + Arrow
lvim.keys.term_mode["<A-Up>"]              = "<C-\\><C-n>:resize +3<CR>i"
lvim.keys.term_mode["<A-Down>"]            = "<C-\\><C-n>:resize -3<CR>i"
lvim.keys.term_mode["<A-Left>"]            = "<C-\\><C-n>:vertical resize -5<CR>i"
lvim.keys.term_mode["<A-Right>"]           = "<C-\\><C-n>:vertical resize +5<CR>i"

-- override <leader>q to close buffer instead of quitting LVim
lvim.keys.normal_mode["<A-q>"]             = ":bp | bd #<CR>"
