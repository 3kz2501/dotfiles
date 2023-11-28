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
          "/Users/kazuyoshi_kawakami/.skk/SKK-JISYO.L",
          "/Users/kazuyoshi_kawakami/.skk/SKK-JISYO.fullname",
          "/Users/kazuyoshi_kawakami/.skk/SKK-JISYO.geo",
          "/Users/kazuyoshi_kawakami/.skk/SKK-JISYO.jinmei",
          "/Users/kazuyoshi_kawakami/.skk/SKK-JISYO.propernoun",
          "/Users/kazuyoshi_kawakami/.skk/SKK-JISYO.station",
        },
       }
    end,
    event = "VeryLazy",
}
