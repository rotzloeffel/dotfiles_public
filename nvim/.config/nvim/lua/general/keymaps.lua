--   Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   e = "t",
--   command_mode = "c",

 M = {}

-- Shorten function names
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
local expr_options = { expr = true, silent = true }

-- Remap space as leader key
keymap("", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- Tabs
keymap("n" , "<m-t>"   , ":tabnew %<cr>" , opts)
keymap("n" , "<m-y>"   , ":tabclose<cr>" , opts)
keymap("n" , "<m-\\>"  , ":tabonly<cr>"  , opts)
keymap("n" , "<m-tab>" , "<c-6>"         , opts)

-- Bufferline
-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprev<CR>", opts)

-- Re-order to previous/next
keymap('n', '<Leader>.', ':BufferLineMoveNext<CR>', opts)
keymap('n', '<Leader>,', ':BufferLineMovePrev<CR>', opts)

-- Go to buffer number
keymap('n', '<Leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
keymap('n', '<Leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
keymap('n', '<Leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
keymap('n', '<Leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
keymap('n', '<Leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
keymap('n', '<Leader>6', ':BufferLineGoToBuffer 6<CR>', opts)
keymap('n', '<Leader>7', ':BufferLineGoToBuffer 7<CR>', opts)
keymap('n', '<Leader>8', ':BufferLineGoToBuffer 8<CR>', opts)
keymap('n', '<Leader>9', ':BufferLineGoToBuffer 9<CR>', opts)

-- Splitting
keymap('n', '<leader>h', ':FocusSplitLeft<CR>',  opts)
keymap('n', '<leader>j', ':FocusSplitDown<CR>',  opts)
keymap('n', '<leader>k', ':FocusSplitUp<CR>',    opts)
keymap('n', '<leader>l', ':FocusSplitRight<CR>', opts)

-- Yank
keymap("n", "Y"        , "y$"    , opts)

-- Cancel search highlighting with ESC
keymap("n", "<esc>", ":nohlsearch<Bar>:echo<CR>", opts)

-- Resize with arrows
keymap("n" , "<C-Up>"    , ":resize -2<CR>"          , opts)
keymap("n" , "<C-Down>"  , ":resize +2<CR>"          , opts)
keymap("n" , "<C-Left>"  , ":vertical resize -2<CR>" , opts)
keymap("n" , "<C-Right>" , ":vertical resize +2<CR>" , opts)

-- Movement
-- Automatically save movements larger than 5 lines to the jumplist
-- Use Ctrl-o/Ctrl-i to navigate backwards and forwards through the jumplist
keymap("n", "j",
       "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'j' : 'gj'",
      { noremap = true, expr = true })
keymap("n", "k",
      "v:count ? (v:count > 5 ? \"m'\" . v:count : '') . 'k' : 'gk'",
      { noremap = true, expr = true })

-- Stop accidental recording
keymap("n", "<C-q", "q", opts)
keymap("n", "q", "<Nop>", opts)

-- Beginning and end of line
keymap("n", "B", "^", opts)
keymap("n", "E", "$", opts)

-- Insert blank line without entering insert mode
keymap("n", "<CR>", "o<Esc>", opts)

-- Show search results in the middle of the screen
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==", opts)

-- Insert lines above/below without leaving normal mode
keymap("n", "oo", "o<Esc>k", opts)
keymap("n", "OO", "O<Esc>j", opts)

-- Paste from system clipboard
keymap("n", "\\p", '<ESC>"+p', opts)
keymap("n", "\\P", '<ESC>"*p', opts)

-- Search and Replace
keymap("n", "c.", ":%s//g<Left><Left>", opts)
keymap("n", "\\c.", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", opts)

-- Custom
keymap("n" , "Q"        , "q!<CR>"                          , opts)
keymap('n' , 'x'        , '"_x'                             , opts)
keymap('n' , 'J'        , "mzJ`z"                           , opts)
keymap("n" , "U"        , "<C-r>"                           , opts)

-- Insert --
-- Better Navigation in insert mode
keymap("i" , "<C-h>" , "<Left>"  , opts)
keymap("i" , "<C-l>" , "<Right>" , opts)
keymap("i" , "<C-j>" , "<Down>"  , opts)
keymap("i" , "<C-k>" , "<Up>"    , opts)

-- Ctrl-c to esc
keymap("i", "<C-c>", "<esc>", opts)

-- Autocorrect spelling from previous error
keymap("i", "<c-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)

-- <C-U> can delete text which undo can't recover. These mappings prevent that.
keymap("i", "<C-U", "<C-G>u<C-U>", opts)
keymap("i", "<C-W", "<C-G>u<C-W>", opts)

-- Visual --
-- Search for visually selected text
keymap("v", "//", 'y/<C-R>"<cr>', opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Make the dot command work as expected in visual mode
keymap("v", ".", ":norm .<cr>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Use tab for indenting in visual mode
keymap("x", "<Tab>"  , ">gv|", opts)
keymap("x", "<S-Tab>", "<gv" , opts)

-- Copy to system clipboard
keymap("x", "\\y", '"+y', opts)
keymap("x", "\\Y", '"*y', opts)

-- Cut to system clipboard
keymap("x", "\\d", '"+d', opts)
keymap("x", "\\D", '"*d', opts)

-- Getting rid of bad habbits
keymap("n" , "<Up>"    , "<Nop>" , opts)
keymap("i" , "<Up>"    , "<Nop>" , opts)
keymap("x" , "<Up>"    , "<Nop>" , opts)
keymap("v" , "<Up>"    , "<Nop>" , opts)
keymap("n" , "<Down>"  , "<Nop>" , opts)
keymap("i" , "<Down>"  , "<Nop>" , opts)
keymap("x" , "<Down>"  , "<Nop>" , opts)
keymap("v" , "<Down>"  , "<Nop>" , opts)
keymap("n" , "<Left>"  , "<Nop>" , opts)
keymap("i" , "<Left>"  , "<Nop>" , opts)
keymap("x" , "<Left>"  , "<Nop>" , opts)
keymap("v" , "<Left>"  , "<Nop>" , opts)
keymap("n" , "<Right>" , "<Nop>" , opts)
keymap("i" , "<Right>" , "<Nop>" , opts)
keymap("x" , "<Right>" , "<Nop>" , opts)
keymap("v" , "<Right>" , "<Nop>" , opts)

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end

return M
