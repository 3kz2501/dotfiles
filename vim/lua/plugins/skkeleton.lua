return  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc.vim",
    },
    keys = {
      {"<C-j>", "<Plug>(skkeleton-toggle)", desc="toggle skkeleton", mode="i"},
    },
    event = "VeryLazy",
}
