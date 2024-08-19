return {
    { "nvimdev/dashboard-nvim", enabled = false },
    { "echasnovski/mini.starter", enabled = false },
    -- Dashboard. This runs when neovim starts, and is what displays
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        enabled = true,
        init = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require("alpha.themes.dashboard")
        end
    }
}
