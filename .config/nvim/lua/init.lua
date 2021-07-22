require("modules.keymap")
require("modules.options")
require("modules.util")
require("plugins.plugins")

vim.g.tokyonight_lualine_bold=true

require('lualine').setup{
    options = { theme = 'tokyonight'}
}

require "lsp_signature".setup()
