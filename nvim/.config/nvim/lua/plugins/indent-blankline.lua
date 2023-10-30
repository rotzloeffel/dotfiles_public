vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile", "telescope", "help", "fzf" }
vim.g.indent_blankline_filetype_exclude = {
  "help",
  "markdown",
  "mason",
  "toggleterm",
  "startify",
  "alpha",
  "dashboard",
  "packer",
  "lspinfo",
  "TelescopePrompt",
  "TelescopeResult",
  "",
  "neogitstatus",
  "sagahover",
  "NvimTree",
  "Trouble",
  "text"
}
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "▏"
vim.g.indent_blankline_char_list = { "|", "¦", "┆", "┊" }
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_space_char_blankline = " "
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_use_treesitter_scope = 1
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_current_context_start = true
vim.g.indent_blankline_context_patterns = {
"class",
"return",
"function",
"method",
"^if",
"^while",
"jsx_element",
"^for",
"^object",
"^table",
"block",
"arguments",
"if_statement",
"else_clause",
"jsx_element",
"jsx_self_closing_element",
"try_statement",
"catch_clause",
"import_statement",
"operation_type",
}
-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

require("indent_blankline").setup { }

-- local colors = require("catppuccin.palettes").get_palette()
-- require("catppuccin.lib.highlighter").syntax({
--   -- NvimTreeWinSeparator = { fg = colors.mantle, bg = colors.mantle },
--   IndentBlanklineContextChar = { fg = colors.surface2 },
-- })
