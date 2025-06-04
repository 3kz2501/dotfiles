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
		set("n", "gD", vim.lsp.buf.declaration, { buffer = true })
		set("n", "gd", vim.lsp.buf.definition, { buffer = true })
		set("n", "K", vim.lsp.buf.hover, { buffer = true })
		set("n", "gi", vim.lsp.buf.implementation, { buffer = true })
		set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = true })
		set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { buffer = true })
		set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { buffer = true })
		set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { buffer = true })
		set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = true })
		set("n", "<space>rn", vim.lsp.buf.rename, { buffer = true })
		set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = true })
		set("n", "gr", vim.lsp.buf.references, { buffer = true })

		-- エラーの箇所に飛ぶキーバインド
		set("n", "<space>p", vim.diagnostic.goto_prev, { buffer = true })
		set("n", "<space>n", vim.diagnostic.goto_next, { buffer = true })

		-- エラーをフロートウィンドウで表示するキーバインド
		set("n", "<leader>e", vim.diagnostic.open_float, { buffer = true })

		set("n", "<space>q", vim.diagnostic.setloclist, { buffer = true })
		-- set("n", "<space>f", vim.lsp.buf.formatting_sync, { buffer = true })
	end,
})

-- 補完プラグインであるcmp_nvim_lspをLSPと連携させる設定
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- プラグインの設定
require("mason").setup()
require("mason-lspconfig").setup()
vim.api.nvim_create_autocmd("User", {
	pattern = "LazyDone",
	callback = function()
		if pcall(require, "mason-lspconfig") then
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end
	end,
})

-- Lspkindのrequire
local lspkind = require("lspkind")
-- 補完関係の設定
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
		["<C-p>"] = cmp.mapping.select_prev_item(), -- Ctrl+pで補完欄を一つ上に移動
		["<C-n>"] = cmp.mapping.select_next_item(), -- Ctrl+nで補完欄を一つ下に移動
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Ctrl+yで補完を選択確定
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

-- 検索結果の移動の再設定
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
