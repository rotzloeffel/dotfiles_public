--  local mocha = require("catppuccin.palettes").get_palette "mocha"
  require('bufferline').setup {
        options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            numbers = "none",
            close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
            right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
            left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
            middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'icon',
            },

            custom_filter = function(buf_number, buf_numbers)
                -- filter out filetypes you don't want to see
                if vim.bo[buf_number].filetype ~= "vimwiki" then
                    return true
                end
            end,
            buffer_close_icon = '',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            name_formatter = function(buf)  -- buf contains:
            end,
            max_name_length = 25,
            max_prefix_length = 25, -- prefix used when a buffer is de-duplicated
            truncate_names = true, -- whether or not tab names should be truncated
            tab_size = 18,
            diagnostics = "nvim_lsp",
            diagnostics_update_in_insert = false,
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                return "("..count..")"
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "center",
                    separator = true,
                    highlight = "Directory",
                }
            },
            color_icons = true, -- whether or not to add the filetype icon highlights
            show_buffer_icons = true, -- disable filetype icons for buffers
            show_buffer_close_icons = false,
            -- show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
            show_close_icon = false,
            show_tab_indicators = true,
            show_duplicate_prefix =  false, -- whether to show duplicate buffer prefix
            persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
            separator_style = "thin",
            enforce_regular_tabs = true,
            always_show_bufferline = false,
            hover = {
                enabled = true,
                delay = 200,
                reveal = {'close'}
            },
            sort_by = 'insert_after_current',
        },
    }


--   local colors = require("catppuccin.palettes").get_palette()
--   require("catppuccin.lib.highlighter").syntax({
--   BufferLineErrorSelected = { fg = colors.text },
--   BufferLineWarningSelected = { fg = colors.text },
--   BufferLineInfoSelected = { fg = colors.text },
--   BufferLineHintSelected = { fg = colors.text },
--
--   BufferLineIndicatorSelected = { fg = colors.blue }
-- })
