return {
	"mfussenegger/nvim-lint",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "biomejs" },
			typescript = { "biomejs" },
			javascriptreact = { "biomejs" },
			typescriptreact = { "biomejs" },
			vue = { "biomejs" },
			svelte = { "biomejs" },
			python = { "ruff" },
			go = { "staticcheck" },
			lua = { "luacheck" },
			bash = { "shellcheck" },
			sql = { "sqlfluff" },
			cpp = { "cpplint" },
			c = { "cpplint" },
			java = { "checkstyle" },
		}

		-- Ruff の設定をカスタマイズ
		lint.linters.ruff = {
			cmd = "ruff", -- ここに cmd パラメータを追加
			-- オプション: 必要に応じてカスタマイズ可能
			-- 例: 特定のルールを有効化/無効化
			args = { "--select=E,F,W", "--ignore=E501" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ml", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
