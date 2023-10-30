-- to see what an option is set to execute :lua = vim.o.<name>

-- aliases
local opt    = vim.opt                       -- global
local g      = vim.g                         -- global for let options
local wo     = vim.wo                        -- window local
local bo     = vim.bo                        -- buffer local
local fn     = vim.fn                        -- access vim functions
local cmd    = vim.cmd                       -- vim commands
local prefix = vim.env.XDG_CACHE_HOME        -- cache dir for undofile etc.

vim.opt.autoindent        = true                                          -- copy indent from current line when starting a new line
vim.opt.autowrite         = true                                          -- enable auto write
vim.opt.autoread          = true                                          -- automatically read changed files
vim.opt.showmode          = false                                         -- don't write out `--INSERT--`, etc.
vim.opt.background        = "dark"                                        -- set the background color
vim.opt.backup            = false                                         -- creates a backup file backupdir = {prefix .. "/nvim/backup//"}, directory to store backups
vim.opt.backupskip        = { '/tmp/*', '/private/tmp/*' }                -- list of files/directory to exclude from backup
vim.opt.breakindent       = true                                          -- Respect indent when line wrapping
vim.opt.clipboard         = "unnamedplus"                                 -- allows neovim to access the system clipboard
vim.opt.cmdheight         = 1                                             -- more space in the neovim command line for displaying messages
vim.opt.cinkeys:remove('0#')                                              -- Indent lines starting with `#`
vim.opt.cpoptions:remove('_')                                             -- Makes cw/cW include trailing whitespace
vim.opt.colorcolumn       = "80,120"                                      -- show colorcolumn at 80 and 120 characters
vim.opt.confirm           = false                                         -- confirm to save changes before exiting modified buffer
vim.opt.completeopt       = { "menu", "menuone", "noselect", "noinsert" } -- mostly just for cmp
vim.opt.conceallevel      = 0                                             -- so that `` is visible in markdown files
vim.opt.cursorline        = true                                          -- highlight the current line
vim.opt.directory         = { prefix .. "/nvim/swp//"}                    -- directory to store swap files
vim.opt.expandtab         = true                                          -- convert tabs to spaces
vim.opt.fillchars         = { eob = " " }                                 -- characters to fill the statuslines, vertical separators and special lines in the window.
vim.opt.filetype          = "on"                                          -- enable filetype detection
vim.opt.foldenable        = false                                         -- disable folding on startup
vim.opt.foldexpr          = "nvim_treesitter#foldexpr()"                  -- folding by treesitter
vim.opt.foldmethod        = "expr"                                        -- folding by expression
vim.opt.guifont           = "monospace:h17"                               -- the font used in graphical neovim applications
vim.opt.grepprg           = "rg --vimgrep --no-heading --smart-case"
vim.opt.grepformat        = "%f:%l:%c:%m,%f:%l:%m"
vim.opt.history           = 1000                                          -- set huge amount of saved history entries
vim.opt.hlsearch          = false                                         -- highlight all matches on previous search pattern
vim.opt.ignorecase        = true                                          -- ignore case in search patterns
vim.opt.inccommand        = "nosplit"                                     -- get a preview of replacements
vim.opt.infercase         = true                                          -- case of the match is adjusted depending on the typed text
vim.opt.joinspaces        = false                                         -- no double spaces with join
vim.opt.laststatus        = 3                                             -- set laststatus only if last window
vim.opt.lazyredraw        = true                                          -- dont redraw easily
vim.opt.lbr               = true                                          -- enable line break
vim.opt.list              = false                                         -- dont show specisal characters
vim.opt.listchars         = { tab = "▶ ", extends = "»", precedes = "«", nbsp = "␣", eol = "¶", trail ="•", space = "·", multispace = "·" }
vim.opt.mouse             = ""                                            -- disable mouse
vim.opt.number            = true                                          -- set numbered lines
vim.opt.numberwidth       = 2                                             -- set number column width to 2 {default 4}
vim.opt.path:append('**')                                                 -- Lets `find` search recursively into subfolders
vim.opt.pumblend          = 0                                             -- transparency of pop-up menu
vim.opt.pumheight         = 15                                            -- pop up menu height
vim.opt.relativenumber    = true                                          -- set relative numbered lines
vim.opt.ruler             = false                                         -- dont show ruler
vim.opt.scrolloff         = 3                                             -- is one of my fav
vim.opt.shiftwidth        = 2                                             -- the number of spaces inserted for each indentation
vim.opt.shiftround        = true                                          -- Round indent to multiple of shiftwdith
vim.opt.sessionoptions    = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.shortmess         = "atIFcroO"                                    -- copied default and removed `t` (long paths were being truncated) while adding `c`
vim.opt.shortmess:append('A')                                             -- ignores swapfiles when opening file
vim.opt.shortmess:append('s')                                             -- disable 'Search hit BOTTOM, continuing at TOP'
vim.opt.shortmess:append('cS')                                            -- disable "[1/5]", "Pattern not found", etc.
vim.opt.shortmess:append('FW')                                            -- disable message after editing/writing file
vim.opt.showbreak         = '↳ '                                          -- string to put at the start of lines that have been wrapped
vim.opt.showcmd           = false                                         -- dont show commands in last line
vim.opt.showmode          = false                                         -- we don't need to see things like
vim.opt.showtabline       = 0                                             -- always show tabs
vim.opt.sidescrolloff     = 6                                             -- minimal number of screen columns to keep to the left and to the right of the cursor
vim.opt.signcolumn        = "yes"                                         -- always show the sign column, otherwise it would shift the text each time
vim.opt.smartcase         = true                                          -- smart case
vim.opt.smartindent       = true                                          -- make indenting smarter again
vim.opt.spell             = false                                         -- disable spell checking
vim.opt.spelllang         = { "en_us", "de" }                             -- set spell language
vim.opt.splitbelow        = true                                          -- force all horizontal splits to go below current window
vim.opt.splitright        = true                                          -- force all vertical splits to go to the right of current window
vim.opt.swapfile          = false                                         -- create swapfile
vim.opt.tabstop           = 2                                             -- insert 2 spaces for a tab
vim.opt.termguicolors     = true                                          -- set term gui colors (most terminals support this)
vim.opt.timeoutlen        = 400                                           -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.ttimeoutlen       = 0                                             -- time in milliseconds to wait for a key code sequence to complete
vim.opt.title             = true                                          -- set title in terminals
vim.opt.undodir           = os.getenv("HOME") .. "/.cache/nvim/undodir"   -- directory to store undo files
vim.opt.undofile          = true                                          -- enable persistent undo
vim.opt.undolevels        = 1000                                          -- save a lot of undos
vim.opt.updatetime        = 250                                           -- faster completion (4000ms default)
vim.opt.wildignorecase    = true                                          -- case is ignored when completing file names and directories
vim.opt.wildoptions       = "pum"                                         -- use popup style for wildmenu
vim.opt.wrap              = false                                         -- display lines as one long line
vim.opt.writebackup       = false                                         -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.formatoptions     = {
  ["1"] = true,                                                    -- Don't break a line after a one-letter word.
  ["2"] = false,                                                   -- Use indent from 2nd line of a paragraph
  q     = true,                                                    -- continue comments with gq"
  c     = false,                                                   -- Insert current comment leader automatically
  r     = false,                                                   -- Continue comments when pressing Enter
  n     = true,                                                    -- Recognize numbered lists
  t     = false,                                                   -- autowrap lines using text width value
  j     = true,                                                    -- remove a comment leader when joining lines.
  l     = true,
}
vim.opt.wildignore = {
  "*.*~",
  "*.aux",
  "*.avi",
  "*.ai",
  "*.bmp",
  "*.class",
  "*.cbr",
  "*.cbz",
  "*.dll",
  "*.doc",
  "*.divx",
  "*.eot",
  "*.exe",
  "*.flac",
  "*.gem",
  "*.gif",
  "*.ico",
  "*.jar",
  "*.jpeg",
  "*.jpg",
  "*.kgb",
  "*.lock",
  "*.manifest",
  "*.mp4",
  "*.mov",
  "*.mpg",
  "*.mpeg",
  "*.mp3",
  "*.m2ts",
  "*.mkv",
  "*.o",
  "*.obj",
  "*.otf",
  "*.oga",
  "*.ogg",
  "*.out",
  "*.pdf",
  "*.png",
  "*.psd",
  "*.pyc",
  "*.rar",
  "*.rbc",
  "*.swp",
  "*.tar.bz2",
  "*.tar.gz",
  "*.tar.xz",
  "*.toc",
  "*.ttf",
  "*.vob",
  "*.wav",
  "*.webm",
  "*.webp",
  "*.woff",
  "*.zip",
  "*/.bundle/*",
  "*/vendor/cache/*",
  "*/vendor/gems/*",
  "*~ ",
  ".DS_Store",
  "._*",
  ".lock",
  ".sass-cache",
  "tags.lock",
  "**/target/**",
  "**.terraform/**",
}

-- Disable built-in plug-ins
local disabled_built_ins = {
  '2html_plugin',       -- disable 2html
  'getscript',          -- disable getscript
  'getscriptPlugin',    -- disable getscript
  'gzip',               -- disable gzip
  'logipat',            -- disable logipat
  'matchit',            -- disable matchit
  'netrw',              -- disable netrw
  'netrwFileHandlers',  -- disable netrw
  'netrwPlugin',        -- disable netrw
  'netrwSettngs',       -- disable netrw
  'remote_plugins',     -- disable remote plugins
  'tar',                -- disable tar
  'tarPlugin',          -- disable tar
  'zip',                -- disable zip
  'zipPlugin',          -- disable zip
  'vimball',            -- disable vimball
  'vimballPlugin',      -- disable vimball
}
for _, plugin in ipairs(disabled_built_ins) do
  vim.g['loaded_' .. plugin] = 1
end
