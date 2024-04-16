return  {
    "vim-skk/skkeleton",
    dependencies = {
      "vim-denops/denops.vim",
      "Shougo/ddc.vim",
    },
    keys = {
      {"<C-j>", "<Plug>(skkeleton-toggle)", desc="toggle skkeleton", mode="i"},
    },
    config = function()
      vim.fn['skkeleton#config']{
        eggLikeNewline = true,
        useSkkServer = true,
        immediatelyCancel = false,
        registerConvertResult = true,
        globalDictionaries = {
          "~/.skk/SKK-JISYO.L",
          "~/.skk/SKK-JISYO.fullname",
          "~/.skk/SKK-JISYO.geo",
          "~/.skk/SKK-JISYO.jinmei",
          "~/.skk/SKK-JISYO.propernoun",
          "~/.skk/SKK-JISYO.station",
        },
       }
    end,
    event = "VeryLazy",
}
