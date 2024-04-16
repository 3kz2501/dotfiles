local M = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {"all"},
      sync_install = true,
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

return { M }
