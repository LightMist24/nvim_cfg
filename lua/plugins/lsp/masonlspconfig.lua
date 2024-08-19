return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            -- migrate tool installation task to mason-tool-installer
            ensure_installed = { "lua_ls", "clangd" },
            automatic_installation = true,
        })
    end,
}
