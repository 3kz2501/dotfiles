local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ctx)
		local set = vim.keymap.set
		set("n", "<space>e", vim.diagnostic.open_float(), { buffer = ctx.buffer })
		set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = true })
		set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = true })
		set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { buffer = true })
		set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = true })
		set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { buffer = true })
		set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = true })
		set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = true })
		set(
			"n",
			"<space>wl",
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
			{ buffer = true }
		)
		set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = true })
		set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = true })
		set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = true })
		set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = true })
		set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { buffer = true })
		set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", { buffer = true })
		set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { buffer = true })
		set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", { buffer = true })
		set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { buffer = true })
	end,
})

-- 補完プラグインであるcmp_nvim_lspをLSPと連携させています⇐ココ！
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- プラグインの設定
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,
})

-- Lspkindのrequire
local lspkind = require("lspkind")
--補完関係の設定
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" }, --ソース類を設定
		{ name = "vsnip" }, -- For vsnip users.
		{ name = "buffer" },
		{ name = "path" },
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(), --Ctrl+pで補完欄を一つ上に移動
		["<C-n>"] = cmp.mapping.select_next_item(), --Ctrl+nで補完欄を一つ下に移動
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }), --Ctrl+yで補完を選択確定
	}),
	experimental = {
		ghost_text = false,
	},
	-- Lspkind(アイコン)を設定
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
		}),
	},
})
