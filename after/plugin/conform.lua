local conform = require 'conform'

conform.setup {
    formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        python = { 'isort', 'black' },
        lua = { 'stylua' },
        html = { 'djlint' },
        go = { 'gofmt' },
    },

    formatters = {
        stylua = {
            command = 'stylua',
            prepend_args = {
                '--indent-width',
                '4',
            },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}
