return {
  "petertriho/nvim-scrollbar",
  dependencies = {
    "kevinhwang91/nvim-hlslens",
    "lewis6991/gitsigns.nvim",
  },
  opts = {
    set_highlights = false,
    show_in_active_only = true,
    handle = { blend = 0 },
    handlers = { cursor = false },
    excluded_filetypes = {
        'alpha',
        'lazy',
        'notify',
        'Trouble',
        'NvimTree',
        'qf',
        'prompt',
        'TelescopePrompt',
        'noice',
    },
  },
  config = function()
      -- require('hlslens').setup() is not required
      require("scrollbar.handlers.search").setup({
          -- hlslens config overrides
      })
  end,
}
