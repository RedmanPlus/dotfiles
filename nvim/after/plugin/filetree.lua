vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults

local tree = require("nvim-tree")

tree.setup()
vim.keymap.set("n", "<leader>ftt", function ()
    vim.cmd("NvimTreeToggle")
end)
