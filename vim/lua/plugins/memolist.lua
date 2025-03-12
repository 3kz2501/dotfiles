return {
	"glidenote/memolist.vim",
	config = function()
		-- memolist_pathの設定
		vim.g.memolist_path = "~/Dropbox/memo/"
		vim.g.memolist_memo_suffix = "txt"
		vim.g.memolist_memo_date = "%Y-%m-%d %H:%M"

		vim.g.memolist_prompt_tags = 1
		vim.g.memolist_prompt_categories = 1
		vim.g.memolist_qfixgrep = 1

		-- VimFilerの代わりにNvim-Treeを使用する設定
		vim.g.memolist_vimfiler = 0
		vim.g.memolist_ex_cmd = "NvimTreeOpen"

		-- キーバインドの設定
		vim.api.nvim_set_keymap("n", "<Leader>mn", ":MemoNew<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>ml", ":MemoList<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Leader>mg", ":MemoGrep<CR>", { noremap = true, silent = true })
	end,
}
