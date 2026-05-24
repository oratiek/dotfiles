-- Neotest + RSpec
vim.pack.add { 'https://github.com/nvim-neotest/neotest' }
vim.pack.add { 'https://github.com/nvim-neotest/nvim-nio' }
vim.pack.add { 'https://github.com/olimorris/neotest-rspec' }
vim.pack.add { 'https://github.com/nvim-lua/plenary.nvim' }

require('neotest').setup {
  adapters = {
    require 'neotest-rspec',
  },
}

vim.keymap.set('n', '<leader>tn', function() require('neotest').run.run() end, { desc = '[T]est [N]earest' })
vim.keymap.set('n', '<leader>tf', function() require('neotest').run.run(vim.fn.expand '%') end, { desc = '[T]est [F]ile' })
vim.keymap.set('n', '<leader>ts', function() require('neotest').summary.toggle() end, { desc = '[T]est [S]ummary' })
vim.keymap.set('n', '<leader>to', function() require('neotest').output.open { enter = true } end, { desc = '[T]est [O]utput' })
