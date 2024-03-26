vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = false -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0 -- always show tabs
vim.opt.cursorline = true -- highlight cursor line
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 50 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 2 spaces for a tab
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append("c")
--vim.opt.whichwrap:append("<,>,[,],h,l")
--vim.opt.iskeyword:append("-")
vim.wo.colorcolumn = "120"

vim.cmd([[
  augroup file_type_tab_config
    autocmd FileType make setlocal noexpandtab
    autocmd FileType go setlocal shiftwidth=4 softtabstop=4 noexpandtab colorcolumn=120
    autocmd FileType php setlocal shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType lua setlocal shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType terraform setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType hcl setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
    autocmd FileType vue setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab
    autocmd FileType json setlocal shiftwidth=2 softtabstop=2 expandtab
  augroup end
]])
