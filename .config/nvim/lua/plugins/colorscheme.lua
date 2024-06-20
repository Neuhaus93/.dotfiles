local function keys()
  -- stylua: ignore
  local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff", "retrobox",
  "pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord", "zaibatsu",
  "desert", "delek", "default", "darkblue", "blue", "morning", "habamax", "sorbet", "vim", "wildcharm" }

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

        require("lazyvim.util").pick("colorscheme", { enable_preview = true })()
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
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    keys = keys(),
  },
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    lazy = true,
    keys = keys(),
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = true,
    keys = keys(),
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    keys = keys(),
  },
  {
    "marko-cerovac/material.nvim",
    name = "material",
    lazy = true,
    keys = keys(),
  },
  {
    "Yazeed1s/oh-lucy.nvim",
    name = "oh-lucy",
    lazy = true,
    keys = keys(),
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material-palenight",
    },
  },
}
