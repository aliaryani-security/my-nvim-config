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
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'},
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
    {
       'Djancyp/better-comments.nvim',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require('better-comment').Setup({
                tags = {
                        {
                            name = "TODO",
                            fg = "white",
                            bg = "#0a7aca",
                            bold = true,
                            virtual_text = "",
                        },
                        {
                            name = "FIX",
                            fg = "white",
                            bg = "#f44747",
                            bold = true,
                            --virtual_text = "This is virtual Text from FIX",
                        },
                        {
                            name = "WARNING",
                            fg = "#FFA500",
                            bg = "",
                            bold = false,
                            --virtual_text = "This is virtual Text from WARNING",
                        },
                        {
                            name = "!",
                            fg = "#f44747",
                            bg = "",
                            bold = true,
                            --virtual_text = "",
                        }

                    }
                })
            end
    },
    {
      'mrcjkb/rustaceanvim',
       version = '^6', -- Recommended
       lazy = false, -- This plugin is already lazy
    }

})
