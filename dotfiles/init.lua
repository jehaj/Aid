-- This script was created with the help of Mistral Large 4,
-- which is currently in a preview phase. It will probably
-- need revising and correcting, so take care when using.

-- ============================================
-- BASIC SETTINGS
-- ============================================

-- Line numbers
vim.opt.number = true           -- Absolute line numbers
vim.opt.relativenumber = true   -- Relative line numbers (great for movement)

-- Indentation (adjust to your language)
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.tabstop = 4             -- Number of spaces per tab
vim.opt.shiftwidth = 4          -- Number of spaces for auto-indent
vim.opt.softtabstop = 4         -- Number of spaces for tab key
vim.opt.smartindent = true      -- Smart auto-indenting
vim.opt.autoindent = true       -- Copy indent from current line

-- Search
vim.opt.ignorecase = true       -- Case-insensitive search
vim.opt.smartcase = true        -- Case-sensitive if uppercase used
vim.opt.hlsearch = true         -- Highlight search results
vim.opt.incsearch = true        -- Incremental search (shows matches as you type)

-- Appearance
vim.opt.cursorline = true       -- Highlight current line
vim.opt.termguicolors = true    -- True color support
vim.opt.signcolumn = "yes"      -- Always show sign column (for LSP, git, etc.)
vim.opt.showmode = false        -- Don't show mode (statusline plugins handle this)
vim.opt.wrap = false            -- Don't wrap long lines
vim.opt.scrolloff = 8           -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8       -- Keep 8 columns left/right of cursor

-- Behavior
vim.opt.mouse = "a"             -- Enable mouse in all modes
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard by default
vim.opt.splitright = true       -- Vertical splits open to the right
vim.opt.splitbelow = true       -- Horizontal splits open below
vim.opt.undofile = true         -- Persistent undo
vim.opt.swapfile = false        -- Disable swap files (optional)
vim.opt.backup = false          -- Disable backup files
vim.opt.updatetime = 300        -- Faster completion (default 4000ms)
vim.opt.timeoutlen = 500        -- Faster key sequence timeout

-- File handling
vim.opt.fileencoding = "utf-8"  -- Default file encoding
vim.opt.autoread = true         -- Auto-reload files changed outside
-- ============================================
-- BASIC SETTINGS
-- ============================================

-- Line numbers
vim.opt.number = true           -- Absolute line numbers
vim.opt.relativenumber = true   -- Relative line numbers (great for movement)

-- Indentation (adjust to your language)
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.tabstop = 4             -- Number of spaces per tab
vim.opt.shiftwidth = 4          -- Number of spaces for auto-indent
vim.opt.softtabstop = 4         -- Number of spaces for tab key
vim.opt.smartindent = true      -- Smart auto-indenting
vim.opt.autoindent = true       -- Copy indent from current line

-- Search
vim.opt.ignorecase = true       -- Case-insensitive search
vim.opt.smartcase = true        -- Case-sensitive if uppercase used
vim.opt.hlsearch = true         -- Highlight search results
vim.opt.incsearch = true        -- Incremental search (shows matches as you type)

-- Appearance
vim.opt.cursorline = true       -- Highlight current line
vim.opt.termguicolors = true    -- True color support
vim.opt.signcolumn = "yes"      -- Always show sign column (for LSP, git, etc.)
vim.opt.showmode = false        -- Don't show mode (statusline plugins handle this)
vim.opt.wrap = false            -- Don't wrap long lines
vim.opt.scrolloff = 8           -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8       -- Keep 8 columns left/right of cursor

-- Behavior
vim.opt.mouse = "a"             -- Enable mouse in all modes
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard by default
vim.opt.splitright = true       -- Vertical splits open to the right
vim.opt.splitbelow = true       -- Horizontal splits open below
vim.opt.undofile = true         -- Persistent undo
vim.opt.swapfile = false        -- Disable swap files (optional)
vim.opt.backup = false          -- Disable backup files
vim.opt.updatetime = 300        -- Faster completion (default 4000ms)
vim.opt.timeoutlen = 500        -- Faster key sequence timeout

-- File handling
vim.opt.fileencoding = "utf-8"  -- Default file encoding
vim.opt.autoread = true         -- Auto-reload files changed outside

-- ============================================
--
-- ============================================
--
