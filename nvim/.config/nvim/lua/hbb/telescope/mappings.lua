if not pcall(require, 'telescope') then
  return
end

local map = require('hbb.keymap').map

-- Files
map('n', '<leader><leader>', ':Telescope find_files<cr>')
map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fb', ':Telescope current_buffer_fuzzy_find<cr>')
map('n', '<leader>fq', ':Telescope quickfix<cr>')
map('n', '<leader>bd', ':bdelete %<cr>')

-- Git
map('n', '<leader>gs', ':Telescope git_status<cr>')
map('n', '<leader>gc', ':Telescope git_commits<cr>')

-- Neovim
map('n', '<leader>fh', ':Telescope help_tags<cr>')
map('n', '<leader>bo', ':Telescope vim_options<cr>')
map('n', '<C-b>', ':Telescope buffers<cr>')