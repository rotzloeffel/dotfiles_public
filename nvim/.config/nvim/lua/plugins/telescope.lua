local actions = require("telescope.actions")
local z_utils = require("telescope._extensions.zoxide.utils")

require("telescope").setup{
  extensions = {
    zoxide = {
      prompt_title = "[ Change Directory to .. ]",
    }
  },
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix       = " ",
    selection_caret     = "  ",
    entry_prefix        = "  ",
    multi_icon          = "",
    file_ignore_patterns = {
          '%.git/', 'node_modules/', '%.npm/', '__pycache__/', '%[Cc]ache/',
          '%.dropbox/', '%.dropbox_trashed/', '%.local/share/Trash/',
          '%.py[c]', '%.sw.?', '~$', '%.tags', '%.gemtags', '%.tmp',
          '%.plist$', '%.pdf$', '%.jpg$', '%.JPG$', '%.jpeg$', '%.png$',
          '%.class$', '%.pdb$', '%.dll$', "^dist/", "^build/", "^venv/",
          "^bin/", "^obj/", "^target/", "%.exe", "^__pycache__/", "^.vscode/",
          "^vendor/", "%.png", "%.jpg", "%.jpeg", "%.mp4", "%.mp3", "%-lock.json$",
    },
    initial_mode        = "insert",
    selection_strategy  = "reset",
    sorting_strategy    = "descending",
    layout_strategy     = "horizontal",
    path_display        = { "truncate" },
    winblend            = 0,
    border              = {},
    borderchars         = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons      = true,
    set_env             = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    layout_config       = {
      horizontal        = {
        prompt_position = "bottom",
        scroll_speed    = 4,
        height          = 0.9,
        width           = 0.9,
        preview_width   = 0.55,
        results_width   = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    mappings = {
      n = {
        ["<esc>"] = actions.close,
        ["<c-u>"] = function() vim.cmd ":norm! c0" end,
        ["<C-h>"] = "which_key",
        ["<c-p>"] = require('telescope.actions.layout').toggle_preview,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      i = {
        ["<esc>"] = actions.close,
        ["<c-u>"] = function() vim.cmd ":norm! c0" end,
        ["<C-h>"] = "which_key",
        ["<c-p>"] = require('telescope.actions.layout').toggle_preview,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  }

require("telescope").load_extension('zoxide')
require("telescope").load_extension('yank_history')
require("telescope").load_extension('undo')
require('telescope').load_extension('projects')
require("telescope").load_extension('persisted')
require('telescope').load_extension('fzf')

--local colors = require("catppuccin.palettes").get_palette()
--require("catppuccin.lib.highlighter").syntax({
--  TelescopePromptNormal = { bg = colors.mantle },
--  TelescopeResultsNormal = { bg = colors.mantle },
--  TelescopePreviewNormal = { bg = colors.mantle },
--})
