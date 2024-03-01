local function keys()
  -- stylua: ignore
  local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff",
  "pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord",
  "desert", "delek", "default", "darkblue", "blue" , "morning"}

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
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
    keys = keys(),
  },
  {
    "catppuccin/nvim",
    lazy = true,
    keys = keys(),
    -- opts = function()
    --   return {
    --     flavour = "frappe",
    --   }
    -- end,
  },
  {
    "bluz71/vim-nightfly-colors",
    lazy = true,
    name = "nightfly",
    keys = keys(),
  },
  { "sainnhe/everforest", lazy = true, keys = keys() },
  {
    "rose-pine/neovim",
    lazy = true,
    name = "rose-pine",
    keys = keys(),
  },
  { "embark-theme/vim", lazy = true, keys = keys() },
  { "AlexvZyl/nordic.nvim", lazy = true, keys = keys() },
  { "rebelot/kanagawa.nvim", lazy = true, keys = keys() },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "catppuccin-frappe" },
  },
}
