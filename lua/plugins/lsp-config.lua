return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "omnisharp", "pylsp", "emmet_ls" },
        automatic_enable = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
      end

      lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.omnisharp.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.pylsp.setup({ capabilities = capabilities, on_attach = on_attach, settings = {
                pylsp = {
                    plugins = {
                        pycodestyle = {
                            ignore = { "E501", "E226" },
                        },
                    },
                },
            },
        })
      lspconfig.emmet_ls.setup({ capabilities = capabilities, on_attach = on_attach })
      lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })
    end,
  },
}

