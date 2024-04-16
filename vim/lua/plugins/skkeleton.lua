return {
	"vim-skk/skkeleton",
	dependencies = {
		"vim-denops/denops.vim",
		"Shougo/ddc.vim",
	},
	keys = {
		{ "<C-j>", "<Plug>(skkeleton-toggle)", desc = "toggle skkeleton", mode = "i" },
	},
	config = function()
		vim.fn["skkeleton#config"]({
			eggLikeNewline = true,
			useSkkServer = true,
			immediatelyCancel = false,
			registerConvertResult = true,
			globalDictionaries = {
				vim.fn.expand("~/.skk/SKK-JISYO.L"),
				vim.fn.expand("~/.skk/SKK-JISYO.fullname"),
				vim.fn.expand("~/.skk/SKK-JISYO.geo"),
				vim.fn.expand("~/.skk/SKK-JISYO.jinmei"),
				vim.fn.expand("~/.skk/SKK-JISYO.propernoun"),
				vim.fn.expand("~/.skk/SKK-JISYO.station"),
			},
		})
	end,
	event = "VeryLazy",
}
