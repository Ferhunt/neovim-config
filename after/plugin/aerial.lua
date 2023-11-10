local aerial = require 'aerial'
local aerial_actions = require 'aerial.actions'

aerial.setup {
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialNext<CR>', { buffer = bufnr })
    vim.keymap.set('n', '}', '<cmd>AerialPrev<CR>', { buffer = bufnr })
  end,

  keymaps = {
    ['J'] = 'actions.next',
    ['K'] = 'actions.prev',
    ['<esc>'] = 'actions.close',
  },

  highlight_on_hover = true,

  manage_folds = true,

  link_tree_to_folds = true,

  close_on_select = false,

  show_guides = true,
}
