return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	version = "*",
	config = function()
		require("bufferline").setup({})
	end,
	keys = {
		{ "<leader>wl", "<CMD>BufferLineCloseRight<CR>", mode = { "n" } },
		{ "<leader>wh", "<CMD>BufferLineCloseLeft<CR>", mode = { "n" } },
		{ "<leader>wall", "<CMD>BufferLineCloseOthers<CR>", mode = { "n" } },
		{ "<leader>we", "<CMD>BufferLinePickClose<CR>", mode = { "n" } },
		-- よく使うキーを追加
		{ "<leader>bp", "<CMD>BufferLineCyclePrev<CR>", mode = { "n" } }, -- 前のバッファへ移動
		{ "<leader>bn", "<CMD>BufferLineCycleNext<CR>", mode = { "n" } }, -- 次のバッファへ移動
		{ "<leader>bP", "<CMD>BufferLineMovePrev<CR>", mode = { "n" } }, -- バッファを左へ移動
		{ "<leader>bN", "<CMD>BufferLineMoveNext<CR>", mode = { "n" } }, -- バッファを右へ移動
		{ "<leader>bb", "<CMD>BufferLinePick<CR>", mode = { "n" } }, -- バッファをピック
	},
}
