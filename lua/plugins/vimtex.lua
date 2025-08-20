return {
    "lervag/vimtex",
    lazy = false,       -- we don't want to lazy load VimTeX
    -- tag = "v2.15",   -- uncomment to pin to a specific release
    init = function()
        --VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_sync = true
        vim.g.vimtex_view_skim_activate = true
        vim.g.vimtex_view_skim_reading_bar = false
    end
}
