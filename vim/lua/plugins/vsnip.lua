return {
	-- vim-vsnip プラグインの追加
	"hrsh7th/vim-vsnip",
	dependencies = {
		"hrsh7th/cmp-vsnip",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		-- vsnip の設定
		vim.g.vsnip_snippet_dir = vim.fn.expand("~/.config/nvim/snippets")

		-- treesitter との統合を有効にする
		vim.g.vsnip_treesitter_enabled = true
	end,
}
