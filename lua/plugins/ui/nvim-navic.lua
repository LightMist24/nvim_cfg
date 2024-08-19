return {
    "SmiteshP/nvim-navic",
    lazy = true,
    event = "User FileOpened",
    dependencies = {
        "neovim/nvim-lspconfig",
    },
    config = function()
        require('nvim-navic').setup {
            highlight = true,
            separator = ' > ',
            depth_limit = 0
        }
        require("lspconfig").clangd.setup {
            on_attach = function(client, bufnr)
                require("nvim-navic").attach(client, bufnr)
            end
        }
    end
}
