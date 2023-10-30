require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "yaml", "vim", "terraform", "sxhkdrc", "regex", "python", "perl", "nix", "markdown", "latex", "lua", "make", "json", "http", "hcl", "gitcommit", "gitattributes", "erlang", "dockerfile", "diff", "comment", "bash" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "" },

  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
    -- disable_virtual_text = true,
    disable = { "html" }, -- optional, list of language that will be disabled
    -- include_match_words = false,
  },

  autopairs = { enable  = true, },
  indent   = { enable = true, },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',

    -- termcolors = {} -- table of colour name strings
  },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    use_languagetree = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
vim.cmd([[ autocmd FileType * highlight TSRainbowYellow  guifg=#ebcb8b ctermfg=yellow  ]])
vim.cmd([[ autocmd FileType * highlight TSRainbowRed     guifg=#bf616a ctermfg=red     ]])
vim.cmd([[ autocmd FileType * highlight TSRainbowBlue    guifg=#5e81ac ctermfg=blue    ]])
vim.cmd([[ autocmd FileType * highlight TSRainbowGreen   guifg=#a3be8c ctermfg=green   ]])
