return {
	"rachartier/tiny-inline-diagnostic.nvim",
	enabled = false, -- 一時的に無効化
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup()
		-- virtual_textをfalseにしない（コメントアウト）
		-- vim.diagnostic.config({ virtual_text = false })
	end,
}
