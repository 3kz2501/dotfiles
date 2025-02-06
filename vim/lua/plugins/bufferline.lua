return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	-- versionの指定を削除し、より安定したバージョンを使用
	config = function()
		require("bufferline").setup({
			options = {
				-- バッファの切り替えをより安定させるためのオプション
				mode = "buffers",
				diagnostics = "nvim_lsp",
				separator_style = "thin",
				show_buffer_close_icons = true,
				show_close_icon = true,
				enforce_regular_tabs = true,
				always_show_bufferline = true,
			},
		})
	end,
	keys = {
		{
			"<leader>wl",
			"<CMD>BufferLineCloseRight<CR>",
			desc = "バッファライン右を閉じる",
			mode = { "n" },
		},
		{ "<leader>wh", "<CMD>BufferLineCloseLeft<CR>", desc = "バッファライン左を閉じる", mode = { "n" } },
		{ "<leader>wall", "<CMD>BufferLineCloseOthers<CR>", desc = "他のバッファを閉じる", mode = { "n" } },
		{ "<leader>we", "<CMD>BufferLinePickClose<CR>", desc = "選択して閉じる", mode = { "n" } },
		{ "<leader>bp", "<CMD>BufferLineCyclePrev<CR>", desc = "前のバッファ", mode = { "n" } },
		{ "<leader>bn", "<CMD>BufferLineCycleNext<CR>", desc = "次のバッファ", mode = { "n" } },
		{ "<leader>bP", "<CMD>BufferLineMovePrev<CR>", desc = "左へ移動", mode = { "n" } },
		{ "<leader>bN", "<CMD>BufferLineMoveNext<CR>", desc = "右へ移動", mode = { "n" } },
		{ "<leader>bb", "<CMD>BufferLinePick<CR>", desc = "バッファ選択", mode = { "n" } },
	},
}
