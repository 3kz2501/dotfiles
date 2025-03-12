return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()
		local registry = require("mason-registry")

		-- 自動インストールしたいパッケージのリスト
		local ensure_installed = {
			"bacon",
			"biome",
			"checkstyle",
			"clang-format",
			"clangd",
			"cpplint",
			"codelldb",
			"goimports",
			"google-java-format",
			"gopls",
			"jdtls",
			"luacheck",
			"prettier",
			"pyright",
			"ruff",
			"rust-analyzer",
			"sqlfluff",
			"staticcheck",
			"stylua",
			"typescript-language-server",
		}

		-- パッケージが存在しない場合はインストール
		for _, tool in ipairs(ensure_installed) do
			if not registry.is_installed(tool) then
				registry.get_package(tool):install()
			end
		end
	end,
}
