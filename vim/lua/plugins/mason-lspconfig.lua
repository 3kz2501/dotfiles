return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup()

		local lspconfig = require("lspconfig")

		-- Rust の設定
		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					inlayHints = {
						enable = true,
						typeHints = true,
						parameterHints = true,
					},
				},
			},
			on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(bufnr, true)
				end
			end,
		})

		-- C/C++ の設定
		lspconfig.clangd.setup({
			cmd = { "clangd", "--background-index" },
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
			-- rust-analyzer と同じ inlay hints の設定を使用する場合
			on_attach = function(client, bufnr)
				if client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(bufnr, true)
				end
			end,
		})
	end,
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
}
