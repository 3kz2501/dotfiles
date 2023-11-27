local M = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {"lua", "typescript", "rust", "python", "prisma"},
      sync_install = true,
    },
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
}

return { M }
