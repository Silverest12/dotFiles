local o = vim.opt

o.number = true
o.relativenumber = true
o.wrap = false
o.startofline = false
o.splitright = true
o.splitbelow = true
o.smartindent = true
o.autoindent = true
o.list = true
o.lazyredraw = true
o.equalalways = true
o.smartcase = true
o.ignorecase = true
o.hlsearch = true

o.backupcopy     = "yes"

o.completeopt    = {
  "menu",
  "menuone",
  "noselect",
  "noinsert",
}

o.mouse = "n"
o.shell = "/usr/bin/bash"
o.laststatus = 2
o.pumheight = 10
o.re = 0
o.scrolloff = 2
o.sidescroll = 2
o.shiftwidth = 2
o.sidescrolloff = 15
o.tabstop = 2
o.timeoutlen = 400
o.updatetime = 1000
o.joinspaces = false