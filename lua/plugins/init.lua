return {
    "scrooloose/nerdcommenter",
    { "christoomey/vim-tmux-navigator" },
    {
        "petertriho/nvim-scrollbar",
        event = { "BufReadPre", "BufNewFile" },
    },
       -- smarter auto change directory
    { "airblade/vim-rooter" },
    {
        "lewis6991/impatient.nvim",
        config = function()
            require('impatient')
        end
    },
    {
        "eandrju/cellular-automaton.nvim",
        lazy = true,
        event = { "BufReadPost", "BufNewFile", "User FileOpened" },
        config = function()
            vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
        end
    }
}
