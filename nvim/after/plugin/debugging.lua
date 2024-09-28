local dap = require("dap")
local ui = require("dap.ui.widgets")

dap.configurations.zig = {
    {
        type = "zig";
        request = "launch";
        name = "launch file";
        program = "${file}";
    },
}

require("mason").setup()
require("mason-nvim-dap").setup()

vim.keymap.set('n', '<leader>db', function() dap.continue() end)
vim.keymap.set('n', '<C-Left>', function() dap.step_over() end)
vim.keymap.set('n', '<C-Enter>', function() dap.step_into() end)
vim.keymap.set('n', '<C-Exc>', function() dap.step_out() end)
vim.keymap.set('n', '<leader>b', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<leader>B', function() dap.set_breakpoint() end)
vim.keymap.set('n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<leader>dr', function() dap.repl.open() end)
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end)
vim.keymap.set({'n', 'v'}, '<leader>dh', function()
    ui.hover()
end)
vim.keymap.set({'n', 'v'}, '<leader>dp', function()
    ui.preview()
end)
vim.keymap.set('n', '<leader>df', function()
    local widgets = ui
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<leader>ds', function()
    local widgets = ui
    widgets.centered_float(widgets.scopes)
end)

require("nvim-dap-virtual-text").setup()
