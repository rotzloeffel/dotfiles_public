local  status_ok, which_key = pcall(require, "which-key")
if not status_ok  then
  return
end

local setup = {
  plugins = {
    marks         	  = true,   -- shows a list of your marks on ' and `
    registers     	  = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling      	  = {
      enabled     	  = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions 	  = 20,     -- how many suggestions should be shown in the list?
    },
    presets = {
      operators     	= false,  -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions       	= false,  -- adds help for motions
      text_objects  	= false,  -- help for text objects triggered after entering an operator
      windows       	= false,  -- default bindings on <c-w>
      nav           	= false,  -- misc bindings to work with windows
      z             	= false,  -- Bindings for folds, spelling and others prefixed with z
      g             	= false,  -- bindings for prefixed with g
    },
  },

  key_labels = {
    ["<leader>"]      = "SPC",
    ["<tab>"]         = "TAB",
  },
  icons = {
    breadcrumb        = "»",     -- symbol used in the command line area that shows your active key combo
    separator         = "",     -- symbol used between a key and it's label
    group             = " ",    -- symbol prepended to a group
  },
  popup_mappings      = {
    scroll_down       = "<c-d>", -- binding to scroll down inside the popup
    scroll_up         = "<c-u>", -- binding to scroll up inside the popup
  },
  window              = {
    border            = "rounded", -- none, single, double, shadow
    position          = "bottom",  -- bottom, top
    margin            = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding           = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend          = 5,
  },
  layout              = {
    height            = { min = 5, max = 25 },  -- min and max height of the columns
    width             = { min = 20, max = 50 }, -- min and max width of the columns
    spacing           = 8,                      -- spacing between columns
    align             = "center",               -- align columns left, center or right
  },
  ignore_missing      = true,                   -- enable this to hide mappings for which you didn't specify a label
  hidden              = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help           = false,                  -- show help message on the command line when the popup is visible
  triggers_blacklist  = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts            = {
  mode                = "n",  -- NORMAL mode
  prefix              = "<leader>",
  buffer              = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
  silent              = true, -- use `silent`  when creating keymaps
  noremap             = true, -- use `noremap` when creating keymaps
  nowait              = true, -- use `nowait`  when creating keymaps
}

local vopts           = {
  mode                = "v",  -- VISUAL mode
  prefix              = "<leader>",
  buffer              = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
  silent              = true, -- use `silent`  when creating keymaps
  noremap             = true, -- use `noremap` when creating keymaps
  nowait              = true, -- use `nowait`  when creating keymaps
}

local m_opts          = {
  mode                = "n",  -- NORMAL mode
  prefix              = "m",
  buffer              = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
  silent              = true, -- use `silent`  when creating keymaps
  noremap             = true, -- use `noremap` when creating keymaps
  nowait              = true, -- use `nowait`  when creating keymaps
}

local mappings = {
  y = { "<cmd>YankyRingHistory<cr>",                                                "Yank history" },
  A = { "<cmd>Alpha<cr>",                                                      	    "Startscreen" },
  n = { "<cmd>NvimTreeToggle<cr>",                                                  "File explorer" },
  e = { "<cmd>lua require('lf').start()<CR>",                                       "LF file explorer" },
  v = { "<cmd>vsplit<cr>",                                                          "Split vertical" },
  d = { '<cmd>silent lua require("telescope").extensions.zoxide.list()<CR>',        "Zoxide" },
  h = { "<cmd>split<cr>",                                                           "Split horizontal" },
  q = { '<cmd>:q<CR>',                                                              "Quit" },
  w = { '<cmd>:w<CR>',                                                              "Save" },
  s = { "<cmd>:SearchBoxMatchAll<CR>",                                              "Search" },
  r = { "<cmd>:SearchBoxReplace<CR>",                                               "Replace" },
  c = { "<cmd>BufDel<CR>",                                                          "Close buffer" },
  u = { "<cmd>Telescope undo<CR>",                                                  "Undo history" },

  a = {
    name = "Ascii art",
    b = { '<cmd>.!toilet -w 200 -f term -F border<Cr>', "Draw border' '" } ,
    m = { '<cmd>.!figlet -f mono9 | boxes -d parchment<Cr>', "Type mono9 with border" } ,
  },

  b = {
    name = "Buffer",
    c = { "<cmd>BufDel<cr>" ,                                                            "Close buffer" },
    h = { "<cmd>BufferLineMovePrev<cr>" ,                                                "Move buffer left" },
    j = { "<cmd>BufferLineCyclePrev<cr>" ,                                               "Previous buffer" },
    k = { "<cmd>BufferLineCycleNext<cr>" ,                                               "Next buffer" },
    l = { "<cmd>BufferLineMoveNext<cr>" ,                                                "Move buffer right" },
    p = { "<cmd>BufferLinePick<cr>" ,                                                    "Pick buffer" },
  },

  p = {
    name = "Packer",
    c = {  " <cmd>PackerCompile<cr> " , " Compile " },
    i = {  " <cmd>PackerInstall<cr> " , " Install " },
    s = {  " <cmd>PackerSync<cr>    " , " Sync    " },
    S = {  " <cmd>PackerStatus<cr>  " , " Status  " },
    u = {  " <cmd>PackerUpdate<cr>  " , " Update  " },
  },

  o = {
    name = "Options",
    c = { '<cmd>lua vim.g.cmp_active=false<cr>',                                    "Completion off" },
    C = { '<cmd>lua vim.g.cmp_active=true<cr>',                                     "Completion on" },
    w = { '<cmd>set wrap!<cr>',                                                     "Wrap" },
    r = { '<cmd>set relativenumber!<cr>',                                           "Relative numbers" },
    n = { '<cmd>set number!<cr>',                                                   "Line numbers" },
    l = { '<cmd>set cursorline<cr>',                                                "Cursorline" },
    S = { '<cmd>set spell!<cr>',                                                    "Spell" },
    s = { '<cmd>set list!<cr>',                                                     "List special characters" },
    o = { '<cmd>only<cr>',                                                          "Close all other splits" },
  },

  f = {
    name = "Find",
    B = { "<cmd>Telescope git_branches<cr>",                                        "Checkout branch" },
    C = { "<cmd>Telescope commands<cr>",                                            "Commands" },
    H = { "<cmd>Telescope highlights<cr>",                                          "Highlights" },
    R = { "<cmd>Telescope registers<cr>",                                           "Registers" },
    b = { "<cmd>Telescope buffers<cr>",                                             "Buffers" },
    c = { "<cmd>Telescope colorscheme<cr>",                                         "Colorscheme" },
    e = { "<cmd>IconPickerInsert<cr>",                                              "Emoji" },
    f = { "<cmd>Telescope find_files<cr>",                                          "Files" },
    h = { "<cmd>Telescope help_tags<cr>",                                           "Help" },
    k = { "<cmd>Telescope keymaps<cr>",                                             "Keymaps" },
    l = { "<cmd>Telescope resume<cr>",                                              "Last Search" },
    m = { "<cmd>Telescope man_pages<cr>",                                           "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>",                                            "Recent File" },
    s = { "<cmd>Telescope grep_string<cr>",                                         "String" },
    t = { "<cmd>Telescope live_grep<cr>",                                           "Text" },
    y = { "<cmd>Telescope yank_history<cr>",                                        "Yank history"},
    z = { "<cmd>lua require('telescope').extensions.zoxide.list()<cr>",             "Zoxide" },
  },

  g = {
    name = "Git",
    j = {  " <cmd>lua require 'gitsigns'.next_hunk()<cr>       " , " Next Hunk            " },
    k = {  " <cmd>lua require 'gitsigns'.prev_hunk()<cr>       " , " Prev Hunk            " },
    m = {  " <cmd>Gitsigns blame_line<cr>                      " , " Blame Line" },
    g = {  " <cmd>Neogit<cr>                                   " , " Neogit               " },
    p = {  " <cmd>lua require 'gitsigns'.preview_hunk()<cr>    " , " Preview Hunk         " },
    r = {  " <cmd>lua require 'gitsigns'.reset_hunk()<cr>      " , " Reset Hunk           " },
    R = {  " <cmd>lua require 'gitsigns'.reset_buffer()<cr>    " , " Reset Buffer         " },
    s = {  " <cmd>lua require 'gitsigns'.stage_hunk()<cr>      " , " Stage Hunk           " },
    u = {  " <cmd>lua require 'gitsigns'.undo_stage_hunk()<cr> " , " Undo Stage Hunk      " },
    o = {  " <cmd>Telescope git_status<cr>                     " , " Open changed file    " },
    b = {  " <cmd>Telescope git_branches<cr>                   " , " Checkout branch      " },
    c = {  " <cmd>Telescope git_commits<cr>                    " , " Checkout commit      " },
    d = {  " <cmd>DiffviewOpen<cr>                             " , " Diffview open        " },
    D = {  " <cmd>DiffviewClose<cr>                            " , " Diffview close       " },
    f = {  " <cmd>Gitsigns diffthis HEAD<cr>                   " , " Diff                 " },
    F = {  " <cmd>DiffviewFileHistory<cr>                      " , " Diffview FileHistory " },
  },

  t = {
    name = "Terminal",
    f = {  " <cmd>ToggleTerm direction=float<cr>" , " Float      " },
    h = {  " <cmd>ToggleTerm size=10 direction=horizontal<cr>" , " Horizontal " },
    v = {  " <cmd>ToggleTerm size=80 direction=vertical<cr>" , " Vertical   " },
  },

  T = {
    name = "Treesitter",
    h = {  " <cmd>TSToggle highlight<cr> " , " Highlight   " },
    r = {  " <cmd>TSToggle rainbow<cr>   " , " Rainbow     " },
    i = {  " <cmd>TSToggle indent<cr>    " , " Indentation " },
  },
}

which_key.setup(setup)
which_key.register(mappings,opts)
which_key.register(vmappings,vopts)
which_key.register(m_mappings,m_opts)
