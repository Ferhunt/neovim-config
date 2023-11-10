local highlight = {
  'CursorColumn',
  'Whitespace',
}
local ibl = require 'ibl'
ibl.setup {

  indent = {
    -- highlight = highlight,
    char = '┊',
  },

  -- whitespace = {
  --   highlight = highlight,
  --   remove_blankline_trail = false,
  -- },

  scope = { enabled = true },
}
