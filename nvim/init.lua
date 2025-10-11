-- Numbered lines and funny colours
vim.opt.number = true
vim.opt.relativenumber = true

-- Disables mouse and arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Appearance
vim.cmd("colorscheme gruvbox")
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Clipboard
vim.opt.encoding = "UTF-8"
vim.opt.clipboard:append("unnamedplus")

-- Tab size
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Folding
vim.cmd("set foldmethod=indent")
vim.cmd("set foldlevelstart=99") -- If I have to deal with 99 levels of nesting I'll fucking kill myself

-- For deleting stuff
vim.opt.backspace = "indent,eol,start"

-- Tabs to spaces
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.equalalways = false

-- Sets cursor to always be a block
vim.opt.guicursor = ""

-- Enable wrapping
vim.opt.wrap = true

vim.g.netrw_banner = 0 -- Disable netrw banner
vim.g.netrw_liststyle = 3 -- Set netrw list style to 3
vim.g.netrw_browse_split = 4 -- Set netrw browse split to 4 (vertical split)
vim.g.netrw_altv = 2 -- Use alternate key for vertical split
vim.g.netrw_winsize = 18 -- Set netrw window size to 18
-- Autocommands for ProjectDrawer
vim.api.nvim_exec(
	[[
    augroup ProjectDrawer
        if argc() == 0
            autocmd!
            autocmd TabNew * :Vexplore!
            autocmd VimEnter * :Vexplore!
        
            wincmd l
    
            autocmd BufEnter * if (winnr('$') == 1 && bufwinnr('%') == 1 && &filetype == 'netrw') | q | endif
        endif
    augroup END
]],
	false
)
