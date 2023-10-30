local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

local utils = require "nvim-tree.utils"

---@diagnostic disable-next-line: unused-local
local function notify_level(level)
  return function(msg)
    vim.schedule(function()
      vim.api.nvim_echo({ { msg, "WarningMsg" } }, false, {})
    end)
  end
end


nvim_tree.setup {
  actions = {
      change_dir = {
        enable = true,
        restrict_above_cwd = false,
      },
      open_file = {
        resize_window = true,
        quit_on_open = true,
        window_picker = {
          chars = "hjkl",
        },
      },
      remove_file = {
        close_window = false,
      },
  },
  live_filter = {
      prefix = "[FILTER]: ",
      always_show_folders = false,
    },
  hijack_directories = {
    enable = true,
  },
  disable_netrw = true,
  hijack_netrw = true,
    filesystem_watchers = {
    enable = true,
  },
  filters = {
    custom = { '.git' },
    exclude = { '.gitignore' },
    dotfiles = false,
  },
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = true,
    highlight_opened_files = "true",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
      },
    },
  },
},
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = { "help" },
    update_cwd = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    adaptive_size = false,
    width = 36,
    hide_root_folder = true,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = { "h", "<BS>", }, cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "s", cb = tree_cb "split" },
        { key = "u", cb = tree_cb "dir_up" },
        { key = "?", cb = tree_cb "toggle_help" },
      },
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
}

--local colors = require("catppuccin.palettes").get_palette()
--require("catppuccin.lib.highlighter").syntax({
--  -- NvimTreeWinSeparator = { fg = colors.mantle, bg = colors.mantle },
--  NvimTreeEndOfBuffer = { fg = colors.mantle, bg = colors.mantle },
--})
