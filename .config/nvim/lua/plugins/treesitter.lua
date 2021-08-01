local M = {}

M.plugin = {
  	"nvim-treesitter/nvim-treesitter",
  	module = "nvim-treesitter",
  	opt = true,
  	run = ':TSUpdate',
  	requires = {
  		-- double rainbow
  		'p00f/nvim-ts-rainbow',
  	},
  	config = function()
  	  	require("plugins.treesitter").config()
  	end,
}

M.config = function()
  	local ts_config = require "nvim-treesitter.configs"

  	local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

  	ts_config.setup {
   	ensure_installed = {
   	  	"haskell",
   	  	"scala",
   	  	"java",
   	  	"clojure",
		"rust",
   	  	"nix",
   	  	"lua",
   	  	"python",
   	  	"yaml",
   	  	"json",
   	  	"comment",
   	},

   	highlight = {
   	  	enable = true,
   	  	disable = {'haskell', 'rust', 'scala'}
   	},

   	indent = { enable = false },

   	rainbow = {
   	  	enable = true,
   	  	extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
   	  	max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
   	},

   	incremental_selection = {
   	  	enable = true,
   	  	keymaps = {
   	  	  	init_selection = "<Enter>",
   	  	  	node_incremental = "<Enter>",
   	  	  	node_decremental = "<BS>",
   	  	},
   	},

   	--lsp_interop = {enable = true},
  	}
end

return M