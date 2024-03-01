return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "prisma-language-server")
      table.insert(opts.ensure_installed, "vue-language-server")
    end,
  },
}
