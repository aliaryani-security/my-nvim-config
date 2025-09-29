local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true}

-- open file list
map ('n', '<F2>', ":NvimTreeToggle<CR>", opts)
