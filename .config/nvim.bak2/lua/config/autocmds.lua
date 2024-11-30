-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Kill all prettierd and eslint_d processes when closing vim
-- Note: This will kill ALL processes, meaning if you have two or more vim process using it,
-- they are both going to be terminated.
-- This will lead to a slow next format, but I believe it is worth it
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.fn.jobstart("killall prettierd eslint_d", { detach = true })
  end,
})
