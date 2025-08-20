local M = {}

function M.setup()
  vim.cmd("highlight clear")
  vim.o.background = "dark"
  vim.o.termguicolors = true

  local highlights = {
    Normal = { fg = "#d4d4d4", bg = "#1e1e1e" },
    Comment = { fg = "#6a9955" },
    Keyword = { fg = "#d16969" },
    Function = { fg = "#dcdcaa" },
    Identifier = { fg = "#9cdcfe" },
    String = { fg = "#ce9178" },
    Number = { fg = "#b5cea8" },
    Constant = { fg = "#c586c0" },
    Type = { fg = "#4ec9b0" }
  }

  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M