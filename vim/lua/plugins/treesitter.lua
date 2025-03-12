local M = {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		-- ensure_installed は "all" のままで問題ありません
		-- これにより必要な言語は自動的にインストールされます
		ensure_installed = { "all" },
		sync_install = true,

		-- 以下の設定を追加
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		-- C/C++特有の設定が必要な場合は以下のように追加できます
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
	},
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
}

return { M }
