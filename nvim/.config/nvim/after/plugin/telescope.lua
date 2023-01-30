local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    dynamic_preview_title = true,
    path_display = { 'smart' },
    sorting_strategy = 'descending',
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--trim',
    },
    file_ignore_patterns = {
      'dist/.*',
      '%.git/.*',
      '%.vim/.*',
      'node_modules/.*',
      '%.idea/.*',
      '%.vscode/.*',
      '%.history/.*',
    },
    mappings = {
      i = {
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        -- ['<C-x>'] = actions.delete_buffer,
        ['<C-h>'] = 'which_key',
      },

      n = {
        ['<esc>'] = actions.close,
        ['X'] = actions.delete_buffer,
        ['<CR>'] = actions.select_default,
        ['?'] = actions.which_key,
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
    },
    find_files = {
      find_command = {
        'fd',
        '--type',
        'file',
        '--type',
        'symlink',
        '--hidden',
        '--exclude',
        '.git',
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = 'smart_case', -- "ignore_case" or "respect_case" or "smart_case"
    },
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('gh')

-- Files
vim.keymap.set('n', '<leader><leader>', ':Telescope find_files<cr>', { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>', { desc = '[F]ind [G]rep' })
vim.keymap.set(
  'n',
  '<leader>/',
  ':Telescope current_buffer_fuzzy_find<cr>',
  { desc = '[/] Fuzzily search in current buffer' }
)
vim.keymap.set('n', '<leader>fq', ':Telescope quickfix<cr>', { desc = '[F]ind [Q]uickfix' })

-- Git
vim.keymap.set('n', '<leader>fs', ':Telescope git_status<cr>', { desc = '[F]ind [S]tatus' })
vim.keymap.set('n', '<leader>fc', ':Telescope git_commits<cr>', { desc = '[F]ind [C]ommits' })

-- Neovim
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>', { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fo', ':Telescope vim_options<cr>', { desc = '[F]ind [O]ptions' })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>', { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>fk', ':Telescope keymaps<cr>', { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fd', ':Telescope diagnostics<cr>', { desc = '[F]ind [D]iagnostics' })
