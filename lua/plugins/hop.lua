return {
    "hadronized/hop.nvim",
    config = function()
        local hop = require('hop')
        hop.setup { keys = 'etovxqpdygfblzhckisuran' }

        local directions = require('hop.hint').HintDirection
        vim.keymap.set('', 'ss', function()
            hop.hint_char1({ direction = directions.AFTER_CURSOR })
        end, {remap = true})

        vim.keymap.set('', 'SS', function()
            hop.hint_char1({ direction = directions.BEFORE_CURSOR })
        end, {remap=true})
    end
}
