
return {
    {
        "tpope/vim-fugitive"
    },
    {
      "lewis6991/gitsigns.nvim",
      event = "BufReadPre",
      config = function()
        require("gitsigns").setup({
          debug_mode = true,
          attach_to_untracked = false,
          on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local opts = { buffer = bufnr }

            vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts)
            vim.keymap.set("n", "<leader>gt", gs.toggle_current_line_blame, opts)
          end,
        })
      end,
    }
}
