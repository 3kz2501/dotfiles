return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup()

		require("lspconfig").rust_analyzer.setup({
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
	end,
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
}
