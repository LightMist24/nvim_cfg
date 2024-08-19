return {
    "yamatsum/nvim-cursorline",
    config = function()
        require('nvim-cursorline').setup {
            cursorlinr = {
                enable = true,
                timeout = 800,
                number = false,
            },
            cursorword = {
                enable = true,
                min_length = 3,
                h1 = { underline = true },
            }
        }
    end
}
