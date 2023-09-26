-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set('n', '<leader>e', vim.cmd.Ex, {desc = '[E]xplorer'})

-- To be able to save with Ctrl-s
vim.keymap.set({'n', 'i'}, '<C-s>', vim.cmd.w)

-- Indent in visual mode without changing back
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- With Tab
vim.keymap.set('v', '<S-Tab>', '<gv')
vim.keymap.set('v', '<Tab>', '>gv')

-- Switch tabs
vim.keymap.set('n', 'J', 'gT')
vim.keymap.set('n', 'K', 'gt')

-- Open new tab with leader t
vim.keymap.set('n', '<leader>t', function ()
  vim.cmd(':tab split')
  vim.cmd.edit('.')
end)

--vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set("v", "<M-Down>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set('v', 'd', '\"_d')

vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[F]ind and [R]eplace' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>fd', vim.diagnostic.open_float, { desc = 'Open [F]loating [D]iagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- [[ Telescope ]]
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope [F]ind [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Open current working directory with E
vim.keymap.set("n", "<leader>E", function ()
  vim.cmd.edit('.')
end, {desc = 'Open working directory on netrw'})

-- Change current working directory to the directory of the current file, or the
-- one open with netrw file explorer
vim.keymap.set("n", "<leader>cd", function ()
  vim.cmd.cd('%:h')
end)
