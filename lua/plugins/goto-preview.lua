return {
    "rmagatti/goto-preview",
    lazy = true,
    event = "BufEnter",
    config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88",
    config = function()
        require("goto-preview").setup ({
            width = 120,
            height = 25,
            default_mappings = true,
            debug = false,
            opacity = nil,
            post_open_hook = nil,
        })
        -- you can use "default_mappings = true" setup option
        vim.keymap.set("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>")
        vim.keymap.set("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>")
        vim.keymap.set("n", "gpc", "<cmd>lua require('goto-preview').close_all_win()<cr>")
    end
}
