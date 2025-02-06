vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.wo.number = true
vim.wo.relativenumber = false
vim.opt.mouse = "a" --マウス操作を有効化
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "zsh"
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true
vim.opt.helplang = "ja", "en"
vim.opt.updatetime = 300
vim.opt.showtabline = 2
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.swapfile = false --スワップファイルを生成しない
vim.opt.wrap = true --端までコードが届いた際に折り返す
vim.g.mapleader = " "
-- float-transparent
vim.opt.winblend = 5 --フロートウィンドウなどを若干透明に
-- Python3
vim.cmd([[
    let g:python3_host_prog = '/home/kz/.local/share/mise/shims/python'
]])

vim.g.previm_open_cmd = "open -a /home/kz/Apps/zen-x86_64.AppImage"

local keymap = vim.keymap
-- キーバインド
-- 画面分割
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- jjでEscする
keymap.set("i", "jj", "<Esc>")
-- 設定ファイルを開く
keymap.set("n", "<F1>", ":edit $MYVIMRC<CR>")

-- インレイヒントの設定を修正
if vim.lsp.inlay_hint then
	vim.keymap.set("n", "<leader>L", function()
		vim.lsp.inlay_hint.enable(true, { 0 })
	end, { desc = "インレイヒントを有効化" })
end

require("lazy-nvim")
