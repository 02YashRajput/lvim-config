vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only open if no file is passed
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.open()
    end
  end
})

-- Optional: NvimTree settings
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.view.width = 30
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.spectre.active = true
