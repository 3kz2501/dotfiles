return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "rust",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "cpp",
        "python",
        "typescript",
        "javascript",
        "java",
        "sql",
        "json",
        "yaml",
        "toml",
        "comment",
        "markdown",
        "markdown_inline",
      },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
