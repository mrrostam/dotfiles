-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

local fn = vim.fn

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = 'a'                       -- Enable mouse support
opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile = false                  -- Don't use swapfile
-- opt.completeopt = 'menuone,noselect'  -- Autocomplete options

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true
opt.relativenumber = true
opt.showmatch = true                  -- Highlight matching parenthesis
-- opt.foldmethod = 'marker'             -- Enable folding (default 'foldmarker')
-- opt.colorcolumn = '80'                -- Line lenght marker at 80 columns
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
-- opt.linebreak = true                  -- Wrap on word boundary
opt.termguicolors = true              -- Enable 24-bit RGB colors
opt.cursorline = true
opt.showcmd = true


-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true
opt.history = 100
opt.lazyredraw = true
-- opt.synmaxcol = 240                   -- Max column for syntax highlight
-- opt.updatetime = 400                  -- ms to wait for trigger 'document_highlight'

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------

-- Disable nvim intro
-- opt.shortmess:append "sI"

-- Disable builtins plugins
-- local disabled_built_ins = {
--   "netrw",
--   "netrwPlugin",
--   "netrwSettings",
--   "netrwFileHandlers",
--   "gzip",
--   "zip",
--   "zipPlugin",
--   "tar",
--   "tarPlugin",
--   "getscript",
--   "getscriptPlugin",
--   "vimball",
--   "vimballPlugin",
--   "2html_plugin",
--   "logipat",
--   "rrhelper",
--   "spellfile_plugin",
--   "matchit"
-- }

-- for _, plugin in pairs(disabled_built_ins) do
--   g["loaded_" .. plugin] = 1
-- end

-----------------------------------------------------------
-- Autocommands
-----------------------------------------------------------

-- Highlight on yank
--- exec([[
---   augroup YankHighlight
---     autocmd!
---     autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=800}
---   augroup end
--- ]], false)
--- 
--- -- Remove whitespace on save
--- cmd [[autocmd BufWritePre * :%s/\s\+$//e]]
--- 
--- -- Don't auto commenting new lines
--- cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]
--- 
--- -- Remove line lenght marker for selected filetypes
--- cmd [[
---   autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0
--- ]]
--- 
--- -- 2 spaces for selected filetypes
--- cmd [[
---   autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
--- ]]

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------

-- Open a terminal pane on the right using :Term
-- cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks:
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
-- cmd [[
--   autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
--   autocmd TermOpen * startinsert
--   autocmd BufLeave term://* stopinsert
-- ]]

