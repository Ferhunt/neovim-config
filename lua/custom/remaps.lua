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
vim.keymap.set('n', 'J', 'gT')
vim.keymap.set('n', 'K', 'gt')

-- Move current tab with JK (mayus)
vim.keymap.set('n', 'H', function()
  vim.cmd('tabm -1')
end)

vim.keymap.set('n', 'L', function()
  vim.cmd('tabm +1')
end)

-- Open new tab with leader t
-- In netrw
vim.keymap.set('n', '<leader>tn', function()
  vim.cmd(':tab split')
  vim.cmd.edit('.')
end, { desc = 'New [T]ab in [N]etrw' })

-- In find files
vim.keymap.set('n', '<leader>tf', function()
  vim.cmd(':tab split')
  vim.cmd.edit('.')
  require('telescope.builtin').find_files()
end, { desc = 'New [T]ab in Telescope [F]ind files' })

--vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move line up and down and indent acordingly, with alt + jk or arrows
vim.keymap.set("v", "<M-Down>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

-- Wen jumping to next with n/N, keep cursor in the center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set('v', 'd', '\"_d')

-- Live find and replace with the current word
vim.keymap.set("n", "<leader>fr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = '[F]ind and [R]eplace' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>fd', vim.diagnostic.open_float, { desc = 'Open [F]loating [D]iagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- [[ Telescope ]]
local telescope_pickers = require('telescopePickers')
-- vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
-- vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Telescope [F]ind [F]iles' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
-- vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>gf', function()
  telescope_pickers.prettyFilesPicker({ picker = 'git_files' })
end, { desc = 'Search [G]it [F]iles' })

vim.keymap.set('n', '<leader>ff', function()
  telescope_pickers.prettyFilesPicker({ picker = 'find_files' })
end, { desc = 'Telescope [F]ind [F]iles' })

vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })

vim.keymap.set('n', '<leader>sw', function()
  telescope_pickers.prettyGrepPicker({ picker = 'grep_string' })
end, { desc = '[S]earch current [W]ord' })

vim.keymap.set('n', '<leader>sg', function()
  telescope_pickers.prettyGrepPicker({ picker = 'live_grep' })
end, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Open current working directory with E
vim.keymap.set("n", "<leader>E", function()
  vim.cmd.edit('.')
end, { desc = 'Open working directory on netrw' })

-- Change current working directory to the directory of the current file, or the
-- one open with netrw file explorer
vim.keymap.set("n", "<leader>cd", function()
  vim.cmd.cd('%:h')
end)

-- Terminal mode remaps

-- Enter normal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

