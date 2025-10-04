return require('lazy').setup({
	-- LSP Config
	{'neovim/nvim-lspconfig'},
	-- auto compeletion
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-buffer'},
	{'hrsh7th/cmp-path'},
	{'saadparwaiz1/cmp_luasnip'},
	-- snippets
	{'L3MON4D3/LuaSnip'},
	-- Telescope (fuzzy finder)
	{'nvim-telescope/telescope.nvim'},
	requires = {'nvim-lua/plenary.nvim'},
	-- Treesitter (syntax highlighting)
	{'nvim-treesitter/nvim-treesitter', branch = 'master', lazy = 'false', build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup({
              ensure_installed = { "asm", "bash", "c", 'cmake', 'comment', 'cpp', 'desktop', 'diff', 'fish', 'gitignore', 'go', 'html', 'javascript', 'json', 'lua', 'markdown', 'markdown_inline', 'php', 'powershell', 'printf', 'python', 'regex', 'ruby', 'rust', "toml"},         -- نصب تمام زبان‌ها
              highlight = {
                enable = true,                  -- فعال‌سازی هایلایت کردن
                additional_vim_regex_highlighting = true,
              },
              indent = {
                enable = true,
              },
              -- اضافه کردن پیکربندی برای رنگی کردن کامنت‌ها
              textobjects = {
                select = {
                  enable = true,
                  lookahead = true,
                  keymaps = {
                    ['aa'] = '@comment.outer',   -- انتخاب کامنت‌ها
                    ['ia'] = '@comment.inner',   -- انتخاب متن داخل کامنت
                  },
                },
              },
            })
end
    },
    {'nvim-treesitter/nvim-treesitter-textobjects'},
	-- Debug adapter protocol
	{'mfussenegger/nvim-dap'},
    -- tree view on side
    -- {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'},
    {
      'nvim-tree/nvim-tree.lua',
  requires = {
        'nvim-tree/nvim-web-devicons', -- برای آیکون‌ها
      },
      config = function()
        require('nvim-tree').setup({
      disable_netrw       = true,
          hijack_netrw        = true,
          open_on_tab         = false,
      hijack_cursor       = true,
          update_cwd          = true,
          view = {
            width = 30,
            side = 'left',
            -- auto_resize = true,
          },
          renderer = {
            icons = {
              show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
              },
                },
          },
        })
      end
    },
    {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup{
      size = 20,
      open_mapping = [[<F6>]],
      direction = "horizontal", -- یا "vertical" / "float"
      close_on_exit = true,
      auto_scroll = true,
    }
  end
},
    {'numToStr/Comment.nvim'
        , config = function()
            require('Comment').setup({
          ignore = nil,                -- کامنت‌های خاص که نمی‌خواهید تغییر کنند
          mappings = {
            basic = true,              -- کلیدهای پیش‌فرض برای کامنت‌گذاری
            extra = true,              -- اضافه کردن کلیدهای اضافی مثل Visual mode
          },
          pre_hook = function(ctx)
            -- اینجا می‌تونی یک hook اضافه کنی تا مثلا رنگ خاصی برای کامنت‌ها داشته باشی
            local U = require('Comment.utils')
            if ctx.ctype == U.ctype.line then
              return '-- '  -- برای کامنت‌های خطی
            elseif ctx.ctype == U.ctype.block then
              return '/* '  -- برای کامنت‌های بلوک
            end
          end,
          post_hook = function(ctx)
            -- اینجا هم می‌تونی hook اضافه کنی
          end,
        })
end
    },
    
    {
      'mrcjkb/rustaceanvim',
       version = '^6', -- Recommended
       lazy = false, -- This plugin is already lazy
    }

})
