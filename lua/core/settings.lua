-- basics
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")
vim.cmd("nohlsearch")
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftround = true
vim.opt.updatetime = 100
vim.opt.cursorline = true
vim.opt.termguicolors = true
--if vim.fn.has("termguicolors") == 1 then
--vim.opt.termguicolors = true
--end

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- tabs
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.cindent = true
vim.opt.smartindent = true

vim.opt.list = true
vim.opt.listchars = {
	tab = "▸ ",
	trail = "▫",
}

vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
--vim.opt.guifont = "Cascadia_Code_PL:h12"
-- vim.opt.guifont = 'DejaVu_Sans_Mono_Font'
-- vim.opt.guifont = 'Fira_Code_Font'
vim.opt.autowrite = true
vim.opt.formatoptions = ""
vim.opt.scrolloff = 10
vim.opt.tw = 0
vim.opt.backspace = "indent,eol,start"
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.laststatus = 2
vim.opt.autochdir = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.lazyredraw = false
vim.opt.compatible = false
vim.opt.shell = "/bin/bash"
vim.opt.signcolumn = "yes"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.shortmess:append({ c = true })
vim.opt.whichwrap:append({ ["<"] = true, [">"] = true, [","] = true, h = true, l = true })
vim.cmd([[set iskeyword+=-]])

-- presistent undo
vim.bo.undofile = true
-- vim.opt.undodir = vim.fn.expand("~/.config/nvim/.tmp/undo")
vim.opt.undodir = vim.fn.expand("~/AppData/Local/nvim_undo")

vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- Disables automatic commenting on newline
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "*" },
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

-- Highlight yanked text
local au = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup
---Highlight the texts when you yanked
local function s_tmp_hl()
    vim.cmd("highlight tmpYankHl guibg='#A3E482'")
    vim.highlight.on_yank({ higroup = "tmpYankHl", timeout = 300 })
    vim.defer_fn(function()
        vim.cmd("highlight clear tmpYankHl")
    end, 300)
end
au("TextYankPost", {
	group = ag("yank_highlight", {}),
	pattern = "*",
	-- callback = function()
		-- vim.highlight.on_yank({ higroup = "IncSearch", timeout = 300 })
	-- end,
    callback = s_tmp_hl,
})

-- Automatically deletes all trailing whitespace and newlines at end of file on save
-- vim.api.nvim_create_autocmd(
--   { "BufWritePre" },
--   {
--     pattern = { "*" },
--     command = "%s/\s\+$//e"
--   }
-- )
-- vim.api.nvim_create_autocmd(
--   { "BufWritePre" },
--   {
--     pattern = { "*" },
--     command = "%s/\n\+\%$//e"
--   }
-- )
-- vim.api.nvim_create_autocmd(
--   { "BufWritePre" },
--   {
--     pattern = { "*.[ch]" },
--     command = "%s/\%$/\r/e"
--   }
-- )
