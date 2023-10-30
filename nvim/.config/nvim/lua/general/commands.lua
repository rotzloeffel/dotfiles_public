local api = vim.api
local aucmd = vim.api.nvim_create_autocmd
local augrp = vim.api.nvim_create_augroup
local function augroup(name, fnc)
  fnc(vim.api.nvim_create_augroup(name, { clear = true }))
end

augroup('General', function(g)
  aucmd('BufWritePost', {
    group = g,
    pattern = {
      '*.{,z}sh',
      '*.pl',
      '*.py'
    },
    desc = 'Make files executable',
    callback = function()
      vim.fn.system({ 'chmod', '+x', vim.fn.expand('%') })
    end
  })
  aucmd('BufWritePost', {
    group = g,
    pattern = 'X{resources,defaults}',
    desc = 'Reload X settings',
    callback = function()
      vim.fn.system({ 'xrdb', vim.fn.expand('%') })
    end
  })
  aucmd({ 'BufNewFile', 'BufRead' }, {
    group = g,
    pattern = {
      '*.m3u*',
      '*cddb*'
    },
    desc = 'Format playlist & cddb files',
    callback = function()
      vim.opt_local.encoding = 'utf-8'
      vim.opt_local.fileencoding = 'utf-8'
      vim.opt_local.fileformat = 'unix'
    end
  })
  aucmd('FileType', {
    group = g,
    pattern = {
      'txt',
      'markdown',
      'asciidoc*',
      'rst',
      'gitcommit'
    },
    desc = 'Enable spelling',
    callback = function()
      if not vim.bo.filetype ~= ({ 'man', 'help' }) then
        vim.opt_local.spell = true
      end
    end
  })
  aucmd('FileType', {
    group = g,
    pattern = '*',
    desc = 'Enable colorcolumn',
    callback = function()
      if not (
        vim.bo.filetype == 'man'
        or vim.bo.filetype == 'help'
        or vim.bo.filetype == 'lazy'
        or vim.bo.filetype == 'qf'
        or vim.bo.filetype == 'whichkey'
      ) then
        vim.opt_local.colorcolumn = limited
      end
    end
  })
  aucmd('FileType', {
    group = g,
    pattern = 'checkhealth',
    desc = 'Format checkhealth output',
    callback = function()
      vim.opt_local.list = false
      vim.opt_local.number = false
      vim.opt_local.relativenumber = false
      vim.opt_local.colorcolumn = ''
    end
  })
  aucmd('BufReadPost', {
    group = g,
    desc = 'Jump back to previous cursor position',
    callback = function()
      local mark = vim.api.nvim_buf_get_mark(0, '"')
      local lcount = vim.api.nvim_buf_line_count(0)
      if mark[1] > 0
        and mark[1] <= lcount
        and vim.bo.filetype ~= 'commit'
        or vim.bo.filetype ~= 'rebase'
      then
        pcall(vim.api.nvim_win_set_cursor, 0, mark)
      end
    end,
  })
  aucmd('BufWinEnter', {
    group = g,
    desc = 'Disable folding in preview window',
    callback = function()
      if vim.wo.previewwindow then
        vim.opt_local.foldenable = false
      end
    end
  })
end)

augroup('Commentstrings', function(g)
  aucmd('FileType', {
    group = g,
    pattern = {
      'pfmain',
      'toml'
    },
    desc = 'commentstring for pfmain & toml',
    callback = function()
      vim.opt_local.commentstring = '#%s'
    end
  })
  aucmd('FileType', {
    group = g,
    pattern = 'vifm',
    desc = 'commentstring for vifm',
    callback = function()
      vim.opt_local.commentstring = '"%s'
    end
  })
  aucmd('FileType', {
    group = g,
    pattern = 'xdefaults',
    desc = 'commentstring for xdefaults',
    callback = function()
      vim.opt_local.commentstring = '!%s'
    end
  })
end)

augroup('Help', function(g)
  local function open_vert()
    local cfg = vim.api.nvim_win_get_config(0)
    if cfg and (cfg.external or cfg.relative and #cfg.relative > 0)
        or vim.api.nvim_win_get_height(0) == 1 then
      return
    end
    local width = math.floor(vim.o.columns * 0.44)
    vim.cmd('wincmd L')
    vim.cmd('vertical resize ' .. width)
  end

  local function simple_quit()
    vim.keymap.set('n', 'q', '<Cmd>q<CR>', { buffer = true })
  end

  aucmd('FileType', {
    group = g,
    pattern = {
      'help',
      'man'
    },
    callback = open_vert,
  })
  aucmd('FileType', {
    group = g,
    pattern = {
      'help',
      'man',
      'startuptime',
      'qf',
      'checkhealth'
    },
    callback = simple_quit,
  })
  aucmd('BufEnter', {
    group = g,
    pattern = '*.txt',
    callback = function()
      if vim.bo.buftype == 'help' then
        open_vert()
      end
    end
  })
  aucmd('BufHidden', {
    group = g,
    pattern = 'man://*',
    callback = function()
      if vim.bo.filetype == 'man' then
        local bufnr = vim.api.nvim_get_current_buf()
        vim.defer_fn(function()
          if vim.api.nvim_buf_is_valid(bufnr) then
            vim.api.nvim_buf_delete(bufnr, { force = true })
          end
        end, 0)
      end
    end
  })
end)

--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- wrap words "softly" (no carriage return) in mail buffer
api.nvim_create_autocmd("Filetype", {
  pattern = "mail",
  callback = function()
    vim.opt.textwidth = 0
    vim.opt.wrapmargin = 0
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.columns = 80
    vim.opt.colorcolumn = "80"
  end,
})

-- turn off relative numbering when leaving the buffer
api.nvim_create_augroup('NumberToggle', {})
api.nvim_create_autocmd({ 'WinEnter', 'InsertLeave' }, {
  pattern = '*',
  desc = 'Enable `relativenumber` when focusing a buffer',
  group = 'NumberToggle',
  callback = function()
    vim.opt.cursorline = true
    if vim.wo.number == true then
      vim.wo.relativenumber = true
    end
  end,
})
api.nvim_create_autocmd({ 'WinLeave', 'InsertEnter' }, {
  pattern = '*',
  desc = 'Disable `relativenumber` when unfocusing a buffer',
  group = 'NumberToggle',
  callback = function()
    vim.opt.cursorline = false
    if vim.wo.number == true then
      vim.wo.relativenumber = false
    end
  end,
})

-- windows to close with "q"
api.nvim_create_autocmd("FileType", {
  pattern = { "help", "startuptime", "qf", "lir", "fugitive", "null-ls-info", "dap-float", "Markdown",
  "spectre_panel", "Alpha", "tsplayground", "AlphaReady", "DressingSelect", "lspinfo", "Telescope", "TelescopePrompt"},
  command = [[
    nnoremap <buffer><silent> q :close<CR>
    nnoremap <buffer><silent> <esc> :close<CR>
    set nocursorline
    set nobuflisted
    ]],
})
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- disable list option in certain filetypes
api.nvim_create_autocmd("FileType", { pattern = { "NeoGitStatus" }, command = [[setlocal list!]] })

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  {
    pattern = { "*.txt", "*.md", "*.tex" },
    callback = function()
      vim.opt.spell = true
      vim.opt.spelllang = "en,de"
    end,
  }
)

-- Reload nvim config on change
api.nvim_create_autocmd(
  'BufWritePost', {
    pattern  = vim.env.MYVIMRC,
    command  = 'silent source %'
})

api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[ set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3 ]]
    vim.cmd [[ set nocursorline | autocmd BufUnload <buffer> set cursorline ]]
    end,
})

api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "" },
  callback = function()
    local buf_ft = vim.bo.filetype
    if buf_ft == "" or buf_ft == nil then
      vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      nnoremap <silent> <buffer> <c-j> j<CR>
      nnoremap <silent> <buffer> <c-k> k<CR>
      set nobuflisted
    ]]
    end
  end,
})

api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "term://*" },
  callback = function()
    vim.cmd "startinsert!"
    vim.cmd "set cmdheight=1"
  end,
})

api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

--api.nvim_create_autocmd("InsertLeave", {
--  pattern = '*',
--  command = "set nopaste"
--})
--
--vim.cmd([[silent! autocmd BufWritePre /tmp/* setlocal noundofile]])
--vim.cmd([[silent! autocmd BufWritePre COMMIT_EDITMSG setlocal noundofile]])
--vim.cmd([[silent! autocmd BufEnter * silent! lcd %:p:h]])
--vim.cmd([[silent! autocmd BufWritePost *sxhkdrc  silent! !pkill -USR1 -x sxhkd]])
--vim.cmd([[silent! autocmd BufWritePost *bspwmrc  silent! !bspc wm -r]])
--vim.cmd([[silent! autocmd BufWritePost */mako/config  silent! !makoctl reload]])
--vim.cmd([[silent! autocmd BufWritePost *.sh silent! !chmod +x %]])
--vim.cmd([[silent! autocmd BufWritePost ~/.Xresources !xrdb -merge ~/.Xresources]])
--vim.cmd([[silent! autocmd BufWritePost ~/.Xdefaults  !xrdb -merge ~/.Xdefaults]])
--vim.cmd([[silent! autocmd BufWritePost ~/.config/shell/aliases source %]])
--vim.cmd([[silent! autocmd FileType     make setlocal noexpandtab]])
--vim.cmd [[silent! autocmd BufReadPre *.nfo set fileencodings=cp437,utf-8]]
--vim.cmd [[silent! autocmd BufNewFile,BufReadPre *aliases set filetype=conf]]
--vim.cmd [[silent! autocmd BufNewFile,BufReadPre *functions set filetype=conf]]
--vim.cmd [[silent! autocmd BufNewFile,BufReadPre config set filetype=conf]]


local cmd_timer = nil
augrp('clear_cmdline', {})
aucmd('CmdlineLeave', {
  group = 'clear_cmdline',
  pattern = '*',
  callback = function()
    cmd_timer = vim.defer_fn(function()
      vim.api.nvim_command('echo ""')
      cmd_timer = nil
    end, 3000)
  end,
})

aucmd('CmdlineEnter', {
  group = 'clear_cmdline',
  pattern = '*',
  callback = function()
    if cmd_timer ~= nil then
      cmd_timer:stop()
    end
  end,
})

-- Check if any file has changed when Neovim is focused
vim.api.nvim_create_autocmd('FocusGained', {
  command = 'checktime',
})

-- Start git commits at start of line, and insert mode if message is empty
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'gitcommit',
  callback = function()
    wo.spell = true
    if fn.getline(1) == '' then
      vim.cmd('startinsert!')
    end
  end,
})

-- Disable numbers & signcolumn in git commit
aucmd('FileType', {
  pattern = { 'gitcommit', 'fugitive' },
  command = [[
    setlocal nonumber signcolumn=no
  ]]
})

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300,
    })
  end,
})

-- For Alacritty terminal
vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
        autocmd VimLeave * set guicursor=a:hor1
        "autocmd VimLeave * set guicursor=a:ver
    augroup END
]])
