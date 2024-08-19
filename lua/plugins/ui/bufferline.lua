return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons"},
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup{
            options = {
                mode = 'buffers',
                number = "ordinal",
                --number_style = "superscript" | "subscript" | "" | { "none", "subscript" }, -- buffer_id at index 1, ordinal at index 2
                --number_style =  "subscript",
                modified_icon = "●", -- ●✥
                buffer_close_icon = "", -- anthor ''
                left_trunc_marker = "",
                right_trunc_marker = "",
                max_name_length = 14,
                max_prefix_length = 13,
                tab_size = 20,
                show_buffer_close_icons = true,
                show_buffer_icons = true,
                show_tab_indicators = true,
                --diagnostics = "coc",
                diagnostics = "nvim_lsp",
                always_show_bufferline = true,
                separator_style = "slant", -- thin
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        padding = 1,
                    },
                },
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                }
           },
        }
    end
}
