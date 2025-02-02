local lint = require 'lint'

lint.linters_by_ft = {
    go = { 'golangcilint' },
    gdscript = { 'gdlint' },
    lua = { 'luacheck' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    callback = function()
        lint.try_lint()
    end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
    callback = function()
        lint.try_lint()
    end,
})
