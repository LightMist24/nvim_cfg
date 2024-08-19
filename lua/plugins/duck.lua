return {
    'tamton-aquib/duck.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
        vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
        vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})

        -- You can also specify how fast a duck moves (measured in steps per second):
        -- vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 10) end, {}) -- A pretty fast duck
        -- vim.keymap.set('n', '<leader>dc', function() require("duck").hatch("🐈", 0.75) end, {}) -- Quite a mellow cat

        --vim.keymap.set('n', '<leader>d1', ':lua require("duck").hatch("🦆") <CR>')
        --vim.keymap.set('n', '<leader>d2', ':lua require("duck").hatch("ඞ") <CR>')
        --vim.keymap.set('n', '<leader>d3', ':lua require("duck").hatch("🦀") <CR>')
        --vim.keymap.set('n', '<leader>d4', ':lua require("duck").hatch("🐈") <CR>')
        --vim.keymap.set('n', '<leader>d5', ':lua require("duck").hatch("🐎") <CR>')
        --vim.keymap.set('n', '<leader>d6', ':lua require("duck").hatch("🦖") <CR>')
        --vim.keymap.set('n', '<leader>d7', ':lua require("duck").hatch("🐤") <CR>')

        vim.keymap.set('n', '<leader>df', ':lua require("duck").hatch("🐸") <CR>' )
        -- vim.keymap.set('n', '<leader>dpr', ':lua require("duck").hatch("") <CR>' )
    end
}
