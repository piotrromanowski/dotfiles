local present, _ = pcall(require, "packerInit")
local packer

if present then
  packer = require("packer")
else
  return false
end

local use = packer.use

return packer.startup(
  function()
    -- manage packer
    use {
      'wbthomason/packer.nvim',
      event = "VimEnter"
    }

    use { "junegunn/fzf", run = "./install --all" }
    use { "junegunn/fzf.vim" }

    -- deps
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- LANGUAGES
    -- cs
    use 'kchmck/vim-coffee-script'
    use 'mtscout6/vim-cjsx'
    ---- csv
    use 'chrisbra/csv.vim'
    ---- git
    use 'tpope/vim-git'
    ---- gleam
    use 'gleam-lang/gleam.vim'
    ---- jsonnet
    use 'google/vim-jsonnet'
    ---- nginx
    use 'chr4/nginx.vim'
    ---- psql
    use 'lifepillar/pgsql.vim'
    ---- proto
    use 'uarun/vim-protobuf'
    ---- Pug
    use 'digitaltoad/vim-pug'
    ---- sbt
    use 'derekwyatt/vim-sbt'
    ---- xml
    use 'amadeus/vim-xml'

    -- OTHER

    use "McAuleyPenney/tidy.nvim"

    use 'tpope/vim-surround'

    -- displays symbols on site for add/delete/change
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require("plugins.gitsigns")
      end
    }

    -- modified status bar
    use {
      'hoob3rt/lualine.nvim',
      config = function()
        require("plugins.lualine")
      end,
      requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- line 'em up
    --use 'godlygeek/tabular'

    use {'nvim-telescope/telescope-fzy-native.nvim'}
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzy-native.nvim'}
      },
      config = function()
        require("plugins.telescope")
      end
    }
    ------ highlights trailing whitespace
    use 'ntpeters/vim-better-whitespace'
    -- git good
    use 'tpope/vim-fugitive'
    -- (--'happy times'--)
    use {
      'blackCauldron7/surround.nvim',
      config = function()
        require("plugins.surround")
      end
    }
    -- adjust color scheme
    use 'zefei/vim-colortuner'

    -- some `lsp` configs
    use {
      'neovim/nvim-lspconfig',
      requires = {'williamboman/nvim-lsp-installer'},
      config = function()
        require('plugins.lspconfig')
      end
    }

    use 'williamboman/nvim-lsp-installer'

    --use {
    --  'glepnir/lspsaga.nvim',
    --  config = function()
    --    require('plugins.lspsaga')
    --  end
    --}

    --use {
    --  'hrsh7th/nvim-compe',
    --  config = function()
    --    require("plugins.compe")
    --  end
    --}

    --use 'L3MON4D3/LuaSnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'saadparwaiz1/cmp_luasnip'
    use {
      'hrsh7th/nvim-cmp',
      config = function()
        require("plugins.cmp")
      end
    }

    use 'RishabhRD/popfix'

    --use 'RishabhRD/nvim-lsputils'
--      'folke/trouble.nvim',
--      config = function()
--        require 'trouble'.setup()
--      end
--    }
--
    -- file type icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    use {
       "folke/trouble.nvim",
       requires = "kyazdani42/nvim-web-devicons",
       config = function()
         require("trouble").setup {
           -- your configuration comes here
           -- or leave it empty to use the default settings
           -- refer to the configuration section below
         }
       end
     }

    -- file tree
    --use 'kyazdani42/nvim-tree.lua'
    use 'preservim/nerdtree'

    -- run things asynchronously
    use 'skywind3000/asyncrun.vim'

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require("plugins.treesitter")
      end
    }
    use 'nvim-treesitter/playground'

    -- autocompletes html tags
    use {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup()
      end
    }

    use 'voldikss/vim-floaterm'

    -- display function signatures while typing
    use 'ray-x/lsp_signature.nvim'

    -- COLORSCHEMES
    use {
      'folke/tokyonight.nvim',
      config = function()
        require "theme"
      end
    }

    use 'tjdevries/colorbuddy.vim'
    use 'tjdevries/gruvbuddy.nvim'
    use 'norcalli/nvim-colorizer.lua'
  end
)
