return {
  {
    "rcarriga/nvim-notify",
    opts = {
      stages = "static",
      render = "compact",
      top_down = false,
    },
  },
  require("noice").setup({
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
        },
        opts = { skip = true },
      },
    },
  }),
}
