return {
	"github/copilot.vim",
	lazy = false,
	config = function()
		vim.defer_fn(function()
			require("copilot").setup({
				-- ここに必要な設定オプションを追加できます
			})
		end, 100)
	end,
}
