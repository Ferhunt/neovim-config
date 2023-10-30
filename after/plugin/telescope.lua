local telescope = require('telescope')

local telescope_builtin = require('telescope.builtin')

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    },

   live_grep = {
      additional_args = function (opts)
        return {'--hidden'}
      end
    }
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

-- Customize buffers
-- Use in telescope buffers

-- telescope_builtin.buffers({
--   -- ...
--   entry_maker = require('rc.telescope.make_entry').gen_from_custom_buffer(),
-- })
-- local entry_maker = require("telescope.utils.filename").find_files_entry_maker
--
-- vim.keymap.set('n', "<C-p>", function()
-- 	local opts = {
-- 		entry_maker = entry_maker(),
-- 		sorting_strategy = "ascending",
-- 		layout_strategy = "center",
-- 		border = true,
-- 		borderchars = {
-- 			prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
-- 			results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
-- 			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
-- 		},
-- 		layout_config = {
-- 			width = 0.8,
-- 			height = 0.6,
-- 		},
-- 		results_title = false,
-- 		previewer = false,
-- 	}
--
-- 	opts.show_untracked = true
--
-- 	local succ = pcall(builtin.git_files, opts)
--
-- 	if not succ then
-- 		builtin.find_files(opts)
-- 	end
-- end, "[F]ind [G]itfiles, or [F]ind [F]iles")
