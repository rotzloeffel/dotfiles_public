  require('lualine').setup {
    extensions = {'neo-tree', 'toggleterm'},
    options = {
      component_separators = { left = '', right = '' },
      -- section_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard" },
      icons_enabled = true,
      theme = "gruvbox-material",
      globalstatus = true,
      always_divide_middle = true,
      },
    sections = {
      lualine_c = {
      {
        'filename',
        file_status = true,      -- Displays file status (readonly status, modified status)
        newfile_status = true,   -- Display new file status (new file means no write after created)
        path = 0,                -- 0: Just the filename
                                 -- 1: Relative path
                                 -- 2: Absolute path
                                 -- 3: Absolute path, with tilde as the home directory
        shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
        'lsp_progress',          -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = '[m]',      -- Text to show when the file is modified.
          readonly = '[r]',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[u]',       -- Text to show for unnamed buffers.
          newfile = '[n]',       -- Text to show for new created file before first writting
        },
      },
    },
   },
  }
