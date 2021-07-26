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
    ---- nim
    use 'zah/nim.vim'
    ---- psql
    use 'lifepillar/pgsql.vim'
    ---- proto
    use 'uarun/vim-protobuf'
    ---- Pug
    use 'digitaltoad/vim-pug'
    ---- purescript
    use 'purescript-contrib/purescript-vim'
    ---- reason
    use 'reasonml-editor/vim-reason-plus'
    ---- sbt
    use 'derekwyatt/vim-sbt'
    ---- xml
    use 'amadeus/vim-xml'

    -- # general
    -- * for visual selections
    use 'nelstrom/vim-visual-star-search'
    -- run tests
    use 'janko/vim-test'
    -- shell commands
    use 'tpope/vim-eunuch'

    -- OTHER

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
      end
    }

    -- line 'em up
    use 'godlygeek/tabular'

    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
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
      config = function()
        require('plugins.lspconfig')
      end
    }
    --use {
    --  'glepnir/lspsaga.nvim',
    --  config = function()
    --    require('plugins.lspsaga')
    --  end
    --}
    use {
      'hrsh7th/nvim-compe',
      config = function()
        require("plugins.compe")
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

    -- display function signatures while typing
    use 'ray-x/lsp_signature.nvim'

    -- show pictograms on completion dropdown
--    use {
--      'onsails/lspkind-nvim',
--      config = function()
--        require 'lspkind'.init()
--      end
--    }
--
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
