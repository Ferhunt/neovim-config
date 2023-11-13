local telescope = require 'telescope'

local telescope_builtin = require 'telescope.builtin'

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

telescope.load_extension 'aerial'

telescope.setup {
    pickers = {
        find_files = {
            hidden = true,
        },

        live_grep = {
            additional_args = function(opts)
                return { '--hidden' }
            end,
        },
    },

    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
            },
        },
    },
}

-- Enable telescope fzf native, if installed
pcall(telescope.load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })
