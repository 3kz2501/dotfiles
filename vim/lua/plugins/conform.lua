return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				javascript = { "biome" },
				typescript = { "biome" },
				javascriptreact = { "biome" },
				typescriptreact = { "biome" },
				svelte = { "biome" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "ruff" },
				go = { "goimports" },
				bash = { "shellharden" },
				sql = { "sqlfluff", "sqlfmt" }, -- sqlfluff を追加
				cpp = { "clang-format" },
				c = { "clang-format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
			-- SQLFluff の詳細設定を追加
			formatters = {
				sqlfluff = {
					-- SQLFluff の設定をカスタマイズする場合はここに追加
					-- 例: 特定のダイアレクトを指定する場合
					-- args = { "--dialect", "postgres" },
				},
			},
		})
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = true,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
