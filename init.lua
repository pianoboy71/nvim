local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.python3_host_prog = "C:\\Users\\Admin\\.pyenv\\pyenv-win\\versions\\3.11.6\\python.exe"

require("vim-options")
require("lazy").setup("plugins")
require("dap-python").setup("~/.virtualenvs/debugpy/Scripts/python.exe")

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.cpp,*.h",
    callback = function()
        vim.lsp.buf.format()
    end,
})
vim.opt.termguicolors = true
