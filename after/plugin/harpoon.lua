local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- basic telescope configuration
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require('telescope.pickers')
        .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
                results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
        })
        :find()
end

-- Keymaps

vim.keymap.set('n', '<leader>ha', function()
    harpoon:list():append()
end)

vim.keymap.set('n', '<leader>hl', function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Open harpoon window' })

vim.keymap.set('n', '<C-7>', function()
    harpoon:list():select(1)
end)
vim.keymap.set('n', '<C-8>', function()
    harpoon:list():select(2)
end)
vim.keymap.set('n', '<C-9>', function()
    harpoon:list():select(3)
end)
vim.keymap.set('n', '<C-0>', function()
    harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<C-j>', function()
    harpoon:list():prev()
end, { desc = 'Previous Harpoon buffer' })
vim.keymap.set('n', '<C-k>', function()
    harpoon:list():next()
end, { desc = 'Next Harpoon buffer' })
