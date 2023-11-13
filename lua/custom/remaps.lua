-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set('n', '<leader>e', vim.cmd.Ex, { desc = '[E]xplorer' })

-- To be able to save with Ctrl-s
vim.keymap.set({ 'n', 'i' }, '<C-s>', vim.cmd.w)

-- Indent in visual mode without changing back
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- With Tab
vim.keymap.set('v', '<S-Tab>', '<gv')
vim.keymap.set('v', '<Tab>', '>gv')

-- Switch tabs
-- vim.keymap.set('n', 'J', 'gT')
-- vim.keymap.set('n', 'K', 'gt')

-- [[Bufferline Remaps]]
local bufferline = require 'bufferline'
-- Switch buffers in the Bufferline
vim.keymap.set('n', 'J', function()
    vim.cmd 'BufferLineCyclePrev'
end)
vim.keymap.set('n', 'K', function()
    vim.cmd 'BufferLineCycleNext'
end)

-- Move buffers in the bufferline
vim.keymap.set('n', 'H', function()
    vim.cmd 'BufferLineMovePrev'
end)
vim.keymap.set('n', 'L', function()
    vim.cmd 'BufferLineMoveNext'
end)

-- Move to certain buffer in the bufferline
vim.keymap.set('n', '<leader>1', function()
    bufferline.go_to(1, true)
end, { desc = 'Go to buffer 1 in BufferLine' })

vim.keymap.set('n', '<leader>2', function()
    bufferline.go_to(2, true)
end, { desc = 'Go to buffer 2 in BufferLine' })

vim.keymap.set('n', '<leader>3', function()
    bufferline.go_to(3, true)
end, { desc = 'Go to buffer 3 in BufferLine' })

vim.keymap.set('n', '<leader>4', function()
    bufferline.go_to(4, true)
end, { desc = 'Go to buffer 4 in BufferLine' })

vim.keymap.set('n', '<leader>5', function()
    bufferline.go_to(5, true)
end, { desc = 'Go to buffer 5 in BufferLine' })

vim.keymap.set('n', '<leader>6', function()
    bufferline.go_to(6, true)
end, { desc = 'Go to buffer 6 in BufferLine' })

vim.keymap.set('n', '<leader>7', function()
    bufferline.go_to(7, true)
end, { desc = 'Go to buffer 7 in BufferLine' })

vim.keymap.set('n', '<leader>8', function()
    bufferline.go_to(8, true)
end, { desc = 'Go to buffer 8 in BufferLine' })

vim.keymap.set('n', '<leader>9', function()
    bufferline.go_to(9, true)
end, { desc = 'Go to buffer 9 in BufferLine' })

-- vim.keymap.set('n', 'H', function()
--   vim.cmd('tabm -1')
-- end)
--
-- vim.keymap.set('n', 'L', function()
--   vim.cmd('tabm +1')
-- end)

-- Move to previous bufffer
vim.keymap.set('n', '<leader><tab>', '<C-^>')

-- Close current buffer
vim.keymap.set('n', '<leader>bd', ':bd<cr>')

-- Open new tab with leader t
-- In netrw
vim.keymap.set('n', '<leader>tn', function()
    vim.cmd ':tab split'
    vim.cmd.edit '.'
end, { desc = 'New [T]ab in [N]etrw' })

-- In find files
vim.keymap.set('n', '<leader>tf', function()
    vim.cmd ':tab split'
    vim.cmd.edit '.'
    require('telescope.builtin').find_files()
end, { desc = 'New [T]ab in Telescope [F]ind files' })

--vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move line up and down and indent acordingly, with alt + jk or arrows
vim.keymap.set('v', '<M-Down>', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', '<M-Up>', ":m '<-2<CR>gv=gv")

vim.keymap.set('v', '<M-j>', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv")

-- Wen jumping to next with n/N, keep cursor in the center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', 'p', [["_dP]])

vim.keymap.set('v', 'd', '"_d')

-- Live find and replace with the current word
vim.keymap.set('n', '<leader>fr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[F]ind and [R]eplace' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>fd', vim.diagnostic.open_float, { desc = 'Open [F]loating [D]iagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Telescope ]]
local telescope_pickers = require 'telescopePickers'

vim.keymap.set('n', '<leader>fa', ':Telescope aerial<CR>', { desc = '[F]ind in [A]erial' })
vim.keymap.set('n', '<leader>gf', function()
    telescope_pickers.prettyFilesPicker { picker = 'git_files' }
end, { desc = 'Search [G]it [F]iles' })

vim.keymap.set('n', '<leader>ff', function()
    telescope_pickers.prettyFilesPicker { picker = 'find_files' }
end, { desc = 'Telescope [F]ind [F]iles' })

vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })

vim.keymap.set('n', '<leader>sw', function()
    telescope_pickers.prettyGrepPicker { picker = 'grep_string' }
end, { desc = '[S]earch current [W]ord' })

vim.keymap.set('n', '<leader>sg', function()
    telescope_pickers.prettyGrepPicker { picker = 'live_grep' }
end, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Open current working directory with E
vim.keymap.set('n', '<leader>E', function()
    vim.cmd.Ex '.'
end, { desc = 'Open working directory on netrw' })

-- Change current working directory to the directory of the current file, or the
-- one open with netrw file explorer
vim.keymap.set('n', '<leader>cd', function()
    vim.cmd.cd '%:h'
end)

-- Terminal mode remaps

-- Enter normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Remaps for netrw
vim.api.nvim_create_autocmd('filetype', {
    pattern = 'netrw',
    desc = 'Better mappings for netrw',
    callback = function()
        local bind = function(lhs, rhs)
            vim.keymap.set('n', lhs, rhs, { remap = true, buffer = true })
        end

        -- edit new file
        bind('n', '%')

        -- rename file
        bind('r', 'R')

        -- Open file
        bind('f', '<cr>')

        -- Go up a directory
        bind('e', '-')
    end,
})

-- To indent automatically on empty line when entering insert
vim.keymap.set('n', 'i', function()
    if #vim.fn.getline '.' == 0 then
        return [["_cc]]
    else
        return 'i'
    end
end, { expr = true, desc = 'properly indent on empty line when insert' })

-- To use ctrl + space to open completion menu
local cmp = require 'cmp'
vim.keymap.set('i', '<C-space>', function()
    if cmp.visible() then
        require 'notify' 'visible'
        cmp.abort()
    else
        require 'notify' 'not visible'
        cmp.complete()
    end
end, { desc = '[S]earch [D]iagnostics' })

-- Change window with <leader>w + hjkl
vim.keymap.set('n', '<leader>wh', '<C-w>h')
vim.keymap.set('n', '<leader>wj', '<C-w>j')
vim.keymap.set('n', '<leader>wk', '<C-w>k')
vim.keymap.set('n', '<leader>wl', '<C-w>l')

-- Scroll keymaps
vim.keymap.set('n', '<C-j>', '<C-d>')
vim.keymap.set('n', '<C-k>', '<C-u>')

vim.keymap.set('n', '<M-j>', '<C-e>')
vim.keymap.set('n', '<M-k>', '<C-y>')

-- On insert, alt + hjkl are mapped to the arrow keys
vim.keymap.set('i', '<M-h>', '<left>')
vim.keymap.set('i', '<M-j>', '<down>')
vim.keymap.set('i', '<M-k>', '<up>')
vim.keymap.set('i', '<M-l>', '<right>')

vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle<CR>', { desc = 'Open [A]erial window' })
