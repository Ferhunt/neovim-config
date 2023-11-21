local dap = require 'dap'

dap.adapters.godot = {
    type = 'server',
    host = '127.0.0.1',
    port = 6006,
}

dap.configurations.gdscript = {
    {
        name = 'Godot',
        type = 'godot',
        request = 'launch',
        project = '${workspaceFolder}',
        port = 6007,
        debugServer = 6006,
        address = '127.0.0.1',
        launch_game_instance = true,
        launch_scene = false,
    },
}

vim.keymap.set('n', '<leader>bp', dap.toggle_breakpoint, { desc = 'Toggle [B]reak[P]point' })
vim.keymap.set('n', '<leader>cb', dap.continue, { desc = 'Start and [C]ontinue De[B]ugging' })
vim.keymap.set('n', '<leader>sn', dap.step_over, { desc = 'Step Over (next)' })
vim.keymap.set('n', '<leader>sN', dap.step_into, { desc = 'Step Into' })
