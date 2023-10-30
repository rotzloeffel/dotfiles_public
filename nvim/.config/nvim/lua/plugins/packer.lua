local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer
  use { 'wbthomason/packer.nvim' }

  -- Speed up loading Lua modules in Neovim to improve startup time.
  use { 'lewis6991/impatient.nvim', config = function() require('impatient') end, }

  -- Colorschemes
  -- use { 'shaunsingh/nord.nvim' }
  -- use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'sainnhe/gruvbox-material'}
  -- use { 'folke/tokyonight.nvim' }
  -- use { 'EdenEast/nightfox.nvim' }
  -- use { 'ellisonleao/gruvbox.nvim' }
  -- use { 'olimorris/onedarkpro.nvim' }

  -- Useful functions and ui improvements
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'stevearc/dressing.nvim' }
  use { 'beauwilliams/focus.nvim' }
  use { 'VonHeikemen/searchbox.nvim', requires = 'MunifTanjim/nui.nvim' }
  use { 'petertriho/nvim-scrollbar' }

  -- LSP & Completion
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {'jose-elias-alvarez/null-ls.nvim'},
      {'jay-babu/mason-null-ls.nvim'},
      {'onsails/lspkind.nvim'},
      {'arkav/lualine-lsp-progress'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer', after = "nvim-cmp"},
      {'hrsh7th/cmp-path', after = "nvim-cmp"},
      {'saadparwaiz1/cmp_luasnip', after = "nvim-cmp"},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua', after = "nvim-cmp"},
      {'folke/neodev.nvim'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets', after = "nvim-cmp"},
    }
  }

  -- Which-key
  use { 'folke/which-key.nvim' }

  -- Neovim Icons for nerdfont
  use { 'nvim-tree/nvim-web-devicons' }

  -- Fancy statusline
  use { 'nvim-lualine/lualine.nvim', wants = 'nvim-web-devicons' }

  -- Numb - peeks lines of the buffer in non-obtrusive way.
  use { 'nacro90/numb.nvim' }

  -- Adds highlights for text filetypes, like markdown, orgmode, and neorg
  use { 'lukas-reineke/headlines.nvim' }

  -- Treesitter Syntax highlighting and modules
  use { 'nvim-treesitter/nvim-treesitter', run = function() local ts_update = require('nvim-treesitter.install').update({ with_sync = true }) ts_update() end, }
  use { 'JoosepAlviste/nvim-ts-context-commentstring', requires = {'nvim-treesitter/nvim-treesitter'} }
  use { 'HiPhish/nvim-ts-rainbow2', requires = {'nvim-treesitter/nvim-treesitter'},  after = "nvim-treesitter" }

  -- Bufferline
  use { 'akinsho/bufferline.nvim' }
  use { 'ojroques/nvim-bufdel' } -- A small Neovim plugin to improve the deletion of buffers.

  -- Alpha greeter
  use { 'goolord/alpha-nvim', wants = { 'nvim-tree/nvim-web-devicons' } }

  -- Clipboard
  use { 'gbprod/yanky.nvim' }

  -- Telescope fuzzy finder
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
  use { 'jvgrootveld/telescope-zoxide', requires = {'nvim-telescope/telescope.nvim' } }
  use { 'debugloop/telescope-undo.nvim', requires = {'nvim-telescope/telescope.nvim' } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- Icon picker with telescope
  use { 'ziontee113/icon-picker.nvim', config = function() require('icon-picker').setup({ disable_legacy_commands = true }) end, }

  -- Session management
  use { 'olimorris/persisted.nvim' }

  -- Comments
  use { 'numToStr/Comment.nvim', requires = {'nvim-ts-context-commentstring'} }
  use { 'folke/todo-comments.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- Terminal
  use { 'akinsho/toggleterm.nvim', tag = '*' }

  -- Colorizer
  use { 'NvChad/nvim-colorizer.lua' }

  -- Git integration
  use { 'lewis6991/gitsigns.nvim', tag = 'release' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- File browser
  use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }, tag = 'nightly' }
  use { 'lmburns/lf.nvim', requires = { 'plenary.nvim', 'toggleterm.nvim' } }
  use { 's1n7ax/nvim-window-picker' }

  -- Indentation
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- Tmux integration
  use { 'aserowy/tmux.nvim', config = function() require('tmux').setup() end }

  -- Lightweight floating statuslines
  use { 'b0o/incline.nvim' }

  -- Alignment
  use { 'echasnovski/mini.align', config = function() require('mini.align').setup() end }

  -- Movement
  use { 'ggandor/leap.nvim', config = function() require('leap').add_default_mappings() end, }
  use { 'ggandor/flit.nvim', requires = {'ggandor/leap.nvim'}, config = function() require('flit').setup() end, }

  -- Projects / Notes / Tasks
  use { 'ahmedkhalf/project.nvim' }
  use { 'powerman/vim-plugin-AnsiEsc' }

  -- Preview markdown via glow
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end}

  -- Autopairs
  use { 'windwp/nvim-autopairs' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
