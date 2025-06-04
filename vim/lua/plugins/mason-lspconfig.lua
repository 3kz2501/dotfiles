return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup()

		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Rust の設定
		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					checkOnSave = {
						command = "clippy", -- clippyを使用
						allTargets = true,
						extraArgs = { "--", "-W", "clippy::all" },
					},
					cargo = {
						allFeatures = true,
						loadOutDirsFromCheck = true,
					},
					procMacro = {
						enable = true,
					},
					diagnostics = {
						enable = true,
						experimental = {
							enable = true,
						},
					},
					inlayHints = {
						enable = true,
						typeHints = true,
						parameterHints = true,
					},
				},
			},
			on_attach = function(client, bufnr)
				-- 保存時に自動でフォーマット
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ async = false })
					end,
				})
			end,
		})

		-- C/C++ の設定（既存のまま）
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = { "clangd", "--background-index" },
			filetypes = { "c", "cpp", "objc", "objcpp" },
			root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
		})
	end,
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
}
