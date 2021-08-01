local lspconfig = require "lspconfig"

-- override handlers
pcall(require, "modules.lsp.handlers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
   properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
   },
}

local servers = {
    hls = {},
    clojure_lsp = {},
    sumneko_lua = require("modules.lsp.sumneko").config,
    yamlls = {cmd = { "vscode-json-language-server", "--stdio" },
   	  	     filetypes = { "yaml", "yml" }},
    jsonls = require("modules.lsp.json").config,
    bashls = {},
    pyright = {},
    texlab = {},
    dhall_lsp_server = {},
  	html = { cmd = { "vscode-html-language-server", "--stdio" } },
  	cssls = { cmd = { "vscode-css-language-server", "--stdio" } },
}

for name, opts in pairs(servers) do
    if type(opts) == "function" then
       opts()
    else
        local client = lspconfig[name]
        client.setup {
            flags = { debounce_text_changes = 150 },
            cmd = opts.cmd or client.cmd,
            filetypes = opts.filetypes or client.filetypes,
            on_attach = opts.on_attach or Util.lsp_on_attach,
            capabilities = opts.capabilities or capabilities,
        }
    end
end

