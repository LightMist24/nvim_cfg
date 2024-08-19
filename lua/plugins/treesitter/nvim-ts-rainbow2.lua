return {
    "HiPhish/nvim-ts-rainbow2",
    -- Bracket pair rainbow colorize
    lazy = true,
    event = { "User FileOpened", "BufReadPost", "BufNewFile" },
    config = function()
        require('nvim-treesitter.configs').setup {
            rainbow = {
                enable = true,
                extened_mode = true,
                max_file_lines = nil,
                -- list of languages you want to disable the plugin for
                disable = {},
                query = 'rainbow-parens',
                -- Highlight the entire buffer all at once
                strategy = require('ts-rainbow').strategy.global,
            }
        }
    end
}
