local opts = { noremap = true, silent = true }
-- this is some basic setting
vim.api.nvim_set_hl(0, 'Normal', { fg = '#4E94CE' }) -- , bg = ''
vim.api.nvim_set_hl(0, 'Cursor', { fg = '#F97E72' }) -- #F97E72(RGB: 249 126 114)

require("core.settings")
require("core.keymaps")

-- colorscheme
-- require("configs.theme.kanagawa")

-- plugins and config
require("core.lazy")
require("scrollbar").setup()

--按键映射
    --nnoremap <silent> gb :BufferLinePick<CR>
    vim.api.nvim_set_keymap("n", "gb", "<Cmd>BufferLinePick<CR>", { noremap = true, silent = true })

    vim.api.nvim_set_keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", { noremap = true, silent = true })
    vim.opt.termguicolors = true

    vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", opts)

-- edgy.nvim
    -- views can only be fully collapsed with the global statusline
    vim.opt.laststatus = 3
    -- Default splitting will cause your main splits to jump when opening an edgebar.
    -- To prevent this, set `splitkeep` to either `screen` or `topline`.
    vim.opt.splitkeep = "screen"

vim.api.nvim_set_keymap("n", "<leader>one", "<cmd>NoiceEnable<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>ond", "<cmd>NoiceDisable<cr>", opts)

local function toggle_map_and_aerial()
    require('mini.map').toggle()
    require('aerial').toggle()
end
_G.toggle_info = toggle_map_and_aerial
vim.api.nvim_set_keymap('n', '<leader>b', ':lua toggle_info()<CR>', opts)
