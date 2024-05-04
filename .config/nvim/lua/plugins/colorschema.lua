local Util = require("lazyvim.util")

local function keys()
  -- stylua: ignore
  local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff",
  "pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord",
  "desert", "delek", "default", "darkblue", "blue", "morning", "habamax" }

  return {
    {
      "<leader>uC",
      function() -- prevent builtin colors from being displayed in the picker
        local target = vim.fn.getcompletion

        ---@diagnostic disable-next-line: duplicate-set-field
        vim.fn.getcompletion = function()
          return vim.tbl_filter(function(color)
            return not vim.tbl_contains(builtins, color)
          end, target("", "color"))
        end

        require("lazyvim.util").telescope("colorscheme", { enable_preview = true })()
        vim.fn.getcompletion = target
      end,
      desc = "Colorscheme with preview",
    },
  }
end

return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    keys = keys(),
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    keys = keys(),
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    keys = keys(),
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine-moon",
    },
  },
}
