--local lspconfig = nvim.lsp.config

-- C++
vim.lsp.enable('clangd')

-- Python
vim.lsp.enable('pylsp')

vim.lsp.enable('nasm')

-- Auto completion
local cmp = require'cmp'
cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
	end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
	})
})
