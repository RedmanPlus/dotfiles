-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function ()
            vim.cmd("colorscheme catppuccin-mocha")
        end
    }
    -- for code
    use(
    'nvim-treesitter/nvim-treesitter',
    {run = ':TSUpdate'}
    )
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
    use {
        "jay-babu/mason-nvim-dap.nvim",
    }
    use('mfussenegger/nvim-dap')
    use({
        'mfussenegger/nvim-dap-python',
        ft = {'python'},
        requires = {
            'mfussenegger/nvim-dap',
            "rcarriga/nvim-dap-ui",
        },
       config = function ()
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
        end
    })
    use({
        "julianolf/nvim-dap-lldb",
        requires = { "mfussenegger/nvim-dap" },
    })
    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }
    use {'theHamsta/nvim-dap-virtual-text'}
    use('christoomey/vim-tmux-navigator')
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
    use('pocco81/auto-save.nvim')
    use('folke/neodev.nvim')
    use('elkowar/yuck.vim')
    use('mattn/emmet-vim')
    use {
        "lukas-reineke/headlines.nvim",
        after = "nvim-treesitter",
        config = function()
            require("headlines").setup()
        end,
    }
    use {
        'boganworld/crackboard.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crackboard').setup({
                session_key = 'f94a90215197e330bdba54c0afb1d7b49495df7da91fd5e52d937c064089de9d',
            })
        end,
    }
end
)
