local lsp = require('lsp-zero')
local lspkind = require('lspkind')

lsp.preset('lsp-compe')

-- See :help lsp-zero-preferences
lsp.set_preferences({
  set_lsp_keymaps = true, -- set to false if you want to configure your own keybindings
  manage_nvim_cmp = true, -- set to false if you want to configure nvim-cmp on your own
})

-- don't initialize this language server
-- we will use rust-tools to setup rust_analyzer
-- lsp.skip_server_setup({'sumneko_lua'})

lsp.setup()

local cmp = require('cmp')
local cmp_config = lsp.defaults.cmp_config({
 formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = " " .. (strings[1] or "") .. " "
        kind.menu = "    (" .. (strings[2] or "") .. ")"
      return kind
    end,
  },
     sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  },
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect',
    keyword_length = 1
  },
  confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
      source_names = {
        nvim_lsp = "(LSP)",
        emoji = "(Emoji)",
        path = "(Path)",
        calc = "(Calc)",
        vsnip = "(Snippet)",
        luasnip = "(Snippet)",
        buffer = "(Buffer)",
        tmux = "(TMUX)",
        copilot = "(Copilot)",
        treesitter = "(TreeSitter)",
      },
  mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }, { "i" }),
      ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }, { "i" }),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<M-Space>"] = cmp.mapping.complete(),
      ["<C-x>"] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true}),
    },
window = {
      completion = {
        border = { '', '', '', '', '', '', '', '' },
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
        scrolloff = 0,
        col_offset = -3,
        side_padding = 0,
        scrollbar = true,
      },
      documentation = {
        border = { '', '', '', ' ', '', '', '', ' ' },
        winhighlight = 'FloatBorder:NormalFloat',
      },
     cmdline = {
      enable = true,
      options = {
        {
          type = ":",
          sources = {
            { name = "path" },
            { name = "cmdline" },
          },
        },
        {
          type = { "/", "?" },
          sources = {
            { name = "buffer" },
          },
    },
  },
    },
  },
})

cmp.setup(cmp_config)

vim.diagnostic.config({
  virtual_text = true,
})

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
  end,
  sources = {
    -- You can add tools not supported by mason.nvim
  }
})

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = true, -- You can still set this to `true`
  automatic_setup = true,
})

-- Required when `automatic_setup` is true
-- require('mason-null-ls').setup_handlers()  !! This line is deprecated -> https://github.com/jay-babu/mason-null-ls.nvim/releases/tag/v2.0.0
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
