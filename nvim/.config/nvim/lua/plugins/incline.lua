    require('incline').setup(({
      hide = {
        focused_win = true,
        only_win = true,
      },
       ignore = {
       buftypes = "special",
       filetypes = {},
       floating_wins = true,
       unlisted_buffers = true,
       wintypes = "special"
      },
      window = {
        zindex = 1,
        winhighlight = {
          Normal = {
          },
        },
        margin = { vertical = 0 },
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
        local icon, color = require('nvim-web-devicons').get_icon_color(filename)
        return {
          { icon, guifg = color },
          { ' ' },
          { filename, gui = 'italic' },
        }
      end
    }))
