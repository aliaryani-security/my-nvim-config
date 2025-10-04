vim.opt.rtp:prepend("/home/aliaryani-security/.config/nvim/lazy/lazy.nvim")

require('settings')

require('plugins')

require('lsp')

require('keymap')

local cmp = require'cmp'
local luasnip = require'luasnip'

-- تنظیمات nvim-cmp
cmp.setup({
  mapping = {
    ['<Tab>'] = cmp.mapping(function(fallback)
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()  -- اگر هیچ کدوم از این‌ها فعال نیستند، رفتن به خط بعدی
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      elseif cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'luasnip' },  -- اضافه کردن LuaSnip به منابع
  },
})

-- تنظیمات LuaSnip برای اسنیپت‌ها
require'luasnip.loaders.from_vscode'.lazy_load()  -- بارگذاری اسنیپت‌ها از VSCode (اگر داری)
-- تعریف رنگ‌های کامنت‌ها
vim.api.nvim_set_hl(0, 'Comment', { fg = '#8A8F99', italic = true })  -- کامنت‌های معمولی
vim.api.nvim_set_hl(0, 'CommentError', { fg = '#FF5555', bold = true })  -- کامنت‌های ارور
vim.api.nvim_set_hl(0, 'CommentTodo', { fg = '#FFCB6B', bold = true })    -- کامنت‌های TODO
vim.api.nvim_set_hl(0, 'CommentNote', { fg = '#A6E22E', italic = true })   -- کامنت‌های Note
vim.api.nvim_set_hl(0, 'CommentFixme', { fg = '#F92672', bold = true })    -- کامنت‌های Fixme

