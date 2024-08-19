return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended setting from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    --change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      --change folder arrow icons
      renderer = {
        group_empty = true,
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "→", -- arrow when folder is closed
              arrow_open = "↓", -- arrow when folder is open
              --🡣 ⮶ -- find more just search 'unicode' in your chrome
            },
          },
        },
      },
      filters = {
          dotfiles = true,
      },
      update_focused_file = {
          enable = true,
          update_cwd = true,
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Stroe" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>") -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindToggle<CR>") -- toggle file find explorer
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>") -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>") -- refresh file explorer
  end
}
